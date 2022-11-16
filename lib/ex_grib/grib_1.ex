defmodule ExGrib.Grib1 do
  @moduledoc """
  Functions for working with Grib1 files.
  """

  alias ExGrib.Grib1.Section0
  alias ExGrib.Grib1.Section1
  alias ExGrib.Grib1.Section2
  alias ExGrib.Grib1.Section3
  alias ExGrib.Grib1.Section4
  alias ExGrib.Grib1.Section5

  defstruct section_0: :not_parsed,
            section_1: :not_parsed,
            section_2: :not_parsed,
            section_3: :not_parsed,
            section_4: :not_parsed

  @type t ::
          %__MODULE__{
            section_0: Section0.t() | :not_parsed,
            section_1: Section1.t() | :not_parsed,
            section_2: Section2.t() | :not_parsed,
            section_3: Section3.t() | :not_parsed,
            section_4: Section4.t() | :not_parsed
          }

  @spec detect(binary()) :: boolean()
  def detect(binary) do
    case Section0.parse(binary) do
      {:ok, _, _} -> true
      :error -> false
    end
  end

  @spec parse(binary()) :: {:ok, t(), binary()} | :error
  def parse(binary) do
    {binary, %__MODULE__{}}
    |> parse_step(:section_0, &Section0.parse/1)
    |> parse_step(:section_1, &Section1.parse/1)
    |> parse_step(:section_2, &Section2.parse/1)
    |> parse_step(:section_3, &Section3.parse/1)
    |> parse_step(:section_4, &Section4.parse/1)
    |> parse_step(:footer, &footer/1)
  end

  @spec footer(Section5.input()) :: Section5.t()
  def footer(binary), do: Section5.parse(binary)

  defguardp is_ommited(section, section_1)
            when (section == :section_2 and section_1.section_1_flags.section_2 == :ommited) or
                   (section == :section_3 and section_1.section_1_flags.section_3 == :ommited)

  defp parse_step({:error, step}, _, _), do: {:error, step}

  defp parse_step({binary, struct}, :footer, function) do
    case function.(binary) do
      {:ok, :end_of_file} -> {:ok, struct}
      {:ok, :more_data, data} -> {:ok, struct, data}
      :error -> :error
    end
  end

  defp parse_step({binary, %{section_1: s1} = struct}, key, _) when is_ommited(key, s1) do
    {binary, Map.put(struct, key, :not_present)}
  end

  defp parse_step({binary, struct}, step, function) do
    case function.(binary) do
      {:ok, section, next} -> {next, Map.put(struct, step, section)}
      :error -> {:error, step}
    end
  end
end
