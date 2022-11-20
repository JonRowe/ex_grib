defmodule ExGrib.Grib1.Section4 do
  @moduledoc """
  Section 4:

  """

  @type input :: binary()
  @typep section ::
           %__MODULE__{
             binary_scale_factor: integer(),
             bits_per_value: integer(),
             data_flag: integer(),
             reference_value: float(),
             section_length: integer()
           }
  @type options :: [] | [read_data: boolean()]
  @type t :: {:ok, section()} | :error

  alias ExGrib.Grib1.Data.Float
  alias ExGrib.Grib1.Data.SignedInteger
  alias ExGrib.Grib1.Packing
  alias ExGrib.Grib1.Section1
  alias ExGrib.Grib1.Table11

  defstruct binary_scale_factor: :not_parsed,
            bits_per_value: :not_parsed,
            data: :not_parsed,
            data_flag: :not_parsed,
            reference_value: :not_parsed,
            section_length: :not_parsed

  @spec parse(Section1.t(), input(), options()) :: t()
  def parse(section_1, data, opts \\ [])

  def parse(
        <<
          # Length of section
          section_length::integer-size(24),
          # Flag (see Code table 11) (first 4 bits).
          data_flag::binary-size(4)-unit(1),
          # at end of section
          number_of_unused_bits::integer-size(4),
          raw_binary_scale_factor::binary-size(2),
          # real (minimum of packed values)
          reference_value::binary-size(4)-unit(8),
          # Number of bits containing each packed value
          bits_per_value::integer(),
          more::binary()
        >>,
        %Section1{decimal_scale_factor: d},
        opts
      ) do
    data_size_in_bits = (section_length - 11) * 8 - number_of_unused_bits

    <<data::binary-size(data_size_in_bits)-unit(1),
      _unused::binary-size(number_of_unused_bits)-unit(1), rest::binary()>> = more

    table_11 = Table11.get(data_flag)

    section =
      %__MODULE__{
        binary_scale_factor: SignedInteger.parse(raw_binary_scale_factor),
        bits_per_value: bits_per_value,
        data: :not_loaded,
        data_flag: table_11,
        reference_value: Float.parse(reference_value),
        section_length: section_length
      }
      |> maybe_load_data(data, d, Keyword.get(opts, :read_data, true))

    {:ok, section, rest}
  end

  def parse(_, _, _), do: :error

  defp maybe_load_data(section, _data, _d, false), do: section

  defp maybe_load_data(section, data, d, true) do
    parsed_data =
      case section.data_flag do
        %Table11{grid_or_sphere: :grid, simple_or_complex: :simple} ->
          Packing.Simple.parse(section, data, d)
      end

    %__MODULE__{section | data: parsed_data}
  end
end
