defmodule ExGrib.Grib1 do
  @moduledoc """
  Functions for working with Grib1 files.
  """

  alias ExGrib.Grib1.Section0

  defstruct header: :not_parsed,
            grid_definition: :not_parsed,
            product_definition: :not_parsed,
            bitmap: :not_parsed,
            data: :not_parsed

  @type t ::
          %__MODULE__{
            header: Section0.t() | :not_parsed,
            product_definition: :not_parsed,
            grid_definition: :not_parsed,
            data: :not_parsed,
            bitmap: :not_parsed
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

  defp parse_step({:error, step}, _, _), do: {:error, step}

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
      :error -> {:error, step}
    end
  end
end
