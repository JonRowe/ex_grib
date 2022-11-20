defmodule ExGrib.Grib2 do
  @moduledoc """
  Functions for working with Grib2 files.

  See: https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/
  """

  alias ExGrib.Grib2.Section0
  alias ExGrib.Grib2.Section1
  alias ExGrib.Grib2.Section2
  alias ExGrib.Grib2.Section3
  alias ExGrib.Grib2.Section4
  alias ExGrib.Grib2.Section5
  alias ExGrib.Grib2.Section6
  alias ExGrib.Grib2.Section7
  alias ExGrib.Grib2.Section8

  @type section_number :: integer()
  @type section_size :: integer()

  defstruct section_0: :not_parsed,
            section_1: :not_parsed,
            section_2: :not_parsed,
            section_3: :not_parsed,
            section_4: :not_parsed,
            section_5: :not_parsed,
            section_6: :not_parsed,
            section_7: :not_parsed

  @type t ::
          %__MODULE__{
            section_0: Section0.t() | :not_parsed,
            section_1: Section1.t() | :not_parsed,
            section_2: Section2.t() | :not_parsed,
            section_3: Section3.t() | :not_parsed,
            section_4: Section4.t() | :not_parsed,
            section_5: Section5.t() | :not_parsed,
            section_6: Section6.t() | :not_parsed,
            section_7: Section7.t() | :not_parsed
          }

  @spec detect(binary()) :: boolean()
  def detect(binary) do
    case Section0.parse(binary) do
      {:ok, _, _} -> true
      :error -> false
    end
  end

  @spec parse(binary()) :: {:ok, t()} | {:ok, t(), binary()} | :error
  def parse(binary) do
    {binary, %__MODULE__{}}
    |> parse_step(:section_0, &Section0.parse/1)
    |> parse_step(:section_1, &Section1.parse/1)
    |> parse_step(:section_2, &Section2.parse/1)
    |> parse_step(:section_3, &Section3.parse/1)
    |> parse_step(:section_4, &Section4.parse/1)
    |> parse_step(:section_5, &Section5.parse/1)
    |> parse_step(:section_6, &Section6.parse/1)
    |> parse_step(:section_7, &Section7.parse/1)
    |> parse_step(:footer, &footer/1)
  end

  @spec footer(Section8.input()) :: Section8.t()
  def footer(binary), do: Section8.parse(binary)

  defp parse_step({binary, struct}, :footer, function) do
    case function.(binary) do
      {:ok, :end_of_file} -> {:ok, struct}
      {:ok, :more_data, data} -> {:ok, struct, data}
      :error -> :error
    end
  end

  defp parse_step({binary, struct}, step, function) do
    case function.(binary) do
      {:ok, section, next} -> {next, Map.put(struct, step, section)}
      :error -> :error
    end
  end

  defp parse_step(:error, _, _), do: :error
end
