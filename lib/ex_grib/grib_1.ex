defmodule ExGrib.Grib1 do
  @moduledoc """
  Functions for working with Grib1 files.
  """

  alias ExGrib.Grib1.Grid
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

  @type options :: [] | Section4.options()

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

  @spec generate_grid(t()) :: [%{latitude: integer(), longitude: integer(), value: number()}]
  def generate_grid(%__MODULE__{section_2: section_2, section_4: section_4}) do
    Enum.with_index(section_4.data, fn value, index ->
      %{
        latitude: Grid.latitude(section_2.grid_definition, index),
        longitude: Grid.longitude(section_2.grid_definition, index),
        value: value
      }
    end)
  end

  @spec index(t(), integer(), integer()) :: integer() | :not_found
  def index(%__MODULE__{section_2: section_2}, latitude, longitude) do
    Grid.index(section_2.grid_definition, latitude, longitude)
  end

  @spec matches?(t(), list(keyword())) :: boolean()
  def matches?(%__MODULE__{}, []), do: true

  def matches?(%__MODULE__{} = grib, query) do
    Enum.all?(query, fn {key, value} ->
      case key do
        :level -> grib.section_1.level == value
        :parameter -> grib.section_1.indicator_of_parameter.parameter == value
        :type_of_level -> grib.section_1.indicator_of_type_of_level.octet_10 == value
        :unit -> grib.section_1.indicator_of_parameter.unit == value
      end
    end)
  end

  @spec parse(binary(), options()) :: {:ok, t(), binary()} | :error
  def parse(binary, opts \\ []) do
    {binary, %__MODULE__{}, opts}
    |> parse_step(:section_0, &Section0.parse/1)
    |> parse_step(:section_1, &Section1.parse/1)
    |> parse_step(:section_2, &Section2.parse/1)
    |> parse_step(:section_3, &Section3.parse/1)
    |> parse_step(:section_4, &Section4.parse/3)
    |> parse_step(:section_5, &Section5.parse/1)
  end

  defp call(function, :section_4, {binary, struct, opts}),
    do: function.(binary, struct.section_1, opts)

  defp call(function, _, {binary, _, _}), do: function.(binary)

  defguardp is_ommited(section, section_1)
            when (section == :section_2 and section_1.section_1_flags.section_2 == :ommited) or
                   (section == :section_3 and section_1.section_1_flags.section_3 == :ommited)

  defp parse_step({:error, step, _}, _, _), do: {:error, step}

  defp parse_step({binary, struct, _}, :section_5, function) do
    case function.(binary) do
      {:ok, :end_of_file} -> {:ok, struct}
      {:ok, :more_data, data} -> {:ok, struct, data}
      :error -> :error
    end
  end

  defp parse_step({binary, %{section_1: s1} = struct, opts}, key, _) when is_ommited(key, s1) do
    {binary, Map.put(struct, key, :not_present), opts}
  end

  defp parse_step({binary, struct, opts}, step, function) when step == :section_4 do
    case function.(binary, struct.section_1, opts) do
      {:ok, section, next} -> {next, Map.put(struct, step, section), opts}
      :error -> {:error, step}
    end
  end

  defp parse_step({_, struct, opts} = tuple, step, function) do
    case call(function, step, tuple) do
      {:ok, section, next} -> {next, Map.put(struct, step, section), opts}
      :error -> {:error, step}
    end
  end
end
