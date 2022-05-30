defmodule ExGrib.Grib1 do
  @moduledoc """
  Functions for working with Grib1 files.
  """

  alias ExGrib.Grib1.Section0
  alias ExGrib.Grib1.Section1
  alias ExGrib.Grib1.Section2
  alias ExGrib.Grib1.Section3
  alias ExGrib.Grib1.Section4

  defstruct header: :not_parsed,
            grid_definition: :not_parsed,
            product_definition: :not_parsed,
            bitmap: :not_parsed,
            data: :not_parsed

  @type t ::
          %__MODULE__{
            header: Section0.t() | :not_parsed,
            product_definition: Section1.t() | :not_parsed,
            grid_definition: Section2.t() | :not_parsed,
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
    |> parse_step(:header, &header/1)
    |> parse_step(:product_definition, &product_definition/1)
    |> parse_step(:grid_definition, &grid_definition/1)
    |> parse_step(:bitmap, &bitmap/1)
    |> parse_step(:data, &data/1)
    |> parse_step(
      :footer,
      fn
        <<>> -> {:ok, :end_of_file}
        data -> {:ok, :more_data, data}
      end
    )
  end

  @spec header(Section0.input()) :: Section0.t()
  def header(input), do: Section0.parse(input)

  @spec product_definition(Section1.input()) :: Section1.t()
  def product_definition(binary), do: Section1.parse(binary)

  @spec grid_definition(Section2.input()) :: Section2.t()
  def grid_definition(binary), do: Section2.parse(binary)

  @spec bitmap(Section3.input()) :: Section3.t()
  def bitmap(binary), do: Section3.parse(binary)

  @spec data(Section4.input()) :: Section4.t()
  def data(binary), do: Section4.parse(binary)

  defp parse_step({:error, step}, _, _), do: {:error, step}

  defp parse_step({binary, struct}, :footer, function) do
    case function.(binary) do
      {:ok, :end_of_file} -> {:ok, struct}
      {:ok, :more_data, data} -> {:ok, struct, data}
      :error -> :error
    end
  end

  defp parse_step(
         {binary, %{product_definition: %{section_1_flags: %{section_2: :ommited}}} = struct},
         :grid_definition,
         _
       ) do
    {binary, Map.put(struct, :grid_definition, :not_present)}
  end

  defp parse_step(
         {binary, %{product_definition: %{section_1_flags: %{section_3: :ommited}}} = struct},
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
