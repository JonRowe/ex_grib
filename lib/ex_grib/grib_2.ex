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

  defstruct header: :not_parsed,
            identification: :not_parsed,
            local_use: :not_parsed,
            grid_definition: :not_parsed,
            product_definition: :not_parsed,
            data_representation: :not_parsed,
            bitmap: :not_parsed,
            data: :not_parsed

  @type t ::
          %__MODULE__{
            header: Section0.t() | :not_parsed,
            identification: Section1.t() | :not_parsed,
            local_use: Section2.t() | :not_parsed,
            grid_definition: Section3.t() | :not_parsed,
            product_definition: Section4.t() | :not_parsed,
            data_representation: Section5.t() | :not_parsed,
            bitmap: Section6.t() | :not_parsed,
            data: Section7.t() | :not_parsed
          }

  @spec detect(binary()) :: boolean()
  def detect(binary) do
    case Section0.parse(binary) do
      {:ok, _, _} -> true
      :error -> false
    end
  end

  @spec parse_all(binary()) :: {:ok, list(t())} | :error
  def parse_all(binary) do
    with {:ok, grib, more} <- parse_next(binary), {:ok, gribs} <- parse_all(more) do
      {:ok, [grib | gribs]}
    else
      {:ok, grib} -> {:ok, [grib]}
      :error -> :error
    end
  end

  @spec parse_next(binary()) :: {:ok, t(), binary()} | :error
  def parse_next(binary) do
    {binary, %__MODULE__{}}
    |> parse_step(:header, &header/1)
    |> parse_step(:identification, &identification/1)
    |> parse_step(:local_use, &local_use/1)
    |> parse_step(:grid_definition, &grid_definition/1)
    |> parse_step(:product_definition, &product_definition/1)
    |> parse_step(:data_representation, &data_representation/1)
    |> parse_step(:bitmap, &bitmap/1)
    |> parse_step(:data, &data/1)
    |> parse_step(:footer, &footer/1)
  end

  @spec header(Section0.input()) :: Section0.t()
  def header(input), do: Section0.parse(input)

  @spec identification(Section1.input()) :: Section1.t()
  def identification(input), do: Section1.parse(input)

  @spec local_use(Section2.input()) :: Section2.t()
  def local_use(input), do: Section2.parse(input)

  @spec grid_definition(Section3.input()) :: Section3.t()
  def grid_definition(binary), do: Section3.parse(binary)

  @spec product_definition(Section4.input()) :: Section4.t()
  def product_definition(binary), do: Section4.parse(binary)

  @spec data_representation(Section5.input()) :: Section5.t()
  def data_representation(binary), do: Section5.parse(binary)

  @spec bitmap(Section6.input()) :: Section6.t()
  def bitmap(binary), do: Section6.parse(binary)

  @spec data(Section7.input()) :: Section7.t()
  def data(binary), do: Section7.parse(binary)

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
