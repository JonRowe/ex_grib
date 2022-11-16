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
            bitmap: :not_parsed,
            data: :not_parsed

  @type t ::
          %__MODULE__{
            section_0: Section0.t() | :not_parsed,
            section_1: Section1.t() | :not_parsed,
            section_2: Section2.t() | :not_parsed,
            bitmap: Section3.t() | :not_parsed,
            data: Section4.t() | :not_parsed
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
    |> parse_step(:bitmap, &bitmap/1)
    |> parse_step(:data, &data/1)
    |> parse_step(:footer, &footer/1)
  end

  @spec bitmap(Section3.input()) :: Section3.t()
  def bitmap(binary), do: Section3.parse(binary)

  @spec data(Section4.input()) :: Section4.t()
  def data(binary), do: Section4.parse(binary)

  @spec footer(Section5.input()) :: Section5.t()
  def footer(binary), do: Section5.parse(binary)

  defp parse_step({:error, step}, _, _), do: {:error, step}

  defp parse_step({binary, struct}, :footer, function) do
    case function.(binary) do
      {:ok, :end_of_file} -> {:ok, struct}
      {:ok, :more_data, data} -> {:ok, struct, data}
      :error -> :error
    end
  end

  defp parse_step(
         {binary, %{section_1: %{section_1_flags: %{section_2: :ommited}}} = struct},
         :section_2,
         _
       ) do
    {binary, Map.put(struct, :section_2, :not_present)}
  end

  defp parse_step(
         {binary, %{section_1: %{section_1_flags: %{section_3: :ommited}}} = struct},
         :bitmap,
         _
       ) do
    {binary, Map.put(struct, :bitmap, :not_present)}
  end

  defp parse_step({binary, struct}, step, function) do
    case function.(binary) do
      {:ok, section, next} -> {next, Map.put(struct, step, section)}
      :error -> {:error, step}
    end
  end
end
