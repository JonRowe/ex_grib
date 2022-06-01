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
             reference_value: binary(),
             section_length: integer()
           }
  @type t :: {:ok, section()} | :error

  alias ExGrib.Grib1.Table11

  defstruct binary_scale_factor: :not_parsed,
            bits_per_value: :not_parsed,
            data: :not_parsed,
            data_flag: :not_parsed,
            reference_value: :not_parsed,
            section_length: :not_parsed

  @spec parse(input()) :: t()
  def parse(<<
        # Length of section
        section_length::integer-size(24),
        # Flag (see Code table 11) (first 4 bits).
        data_flag::binary-size(4)-unit(1),
        _number_of_unused_bits_at_end_of_section::integer-size(4),
        binary_scale_factor::signed-integer-size(16),
        # real (minimum of packed values)
        reference_value::binary-size(4),
        # Number of bits containing each packed value
        bits_per_value::integer(),
        more::binary()
      >>) do
    remaining_octets = section_length - 11

    <<data::binary-size(remaining_octets), rest::binary()>> = more

    table_11 = Table11.get(data_flag)

    section = %__MODULE__{
      binary_scale_factor: binary_scale_factor,
      bits_per_value: bits_per_value,
      data: parse_data(data, bits_per_value, table_11),
      data_flag: table_11,
      reference_value: reference_value,
      section_length: section_length
    }

    {:ok, section, rest}
  end

  def parse(_), do: :error

  defp parse_chunk(data, n) when byte_size(data) * 8 >= n do
    <<chunk::binary-size(n)-unit(1), rest::binary()-unit(1)>> = data
    [chunk | parse_chunk(rest, n)]
  end

  defp parse_chunk(_, _), do: []

  defp parse_data(data, n, %Table11{additional_flags_at_section_4_octect_14: false} = flags) do
    case flags do
      %Table11{grid_or_sphere: :grid, simple_or_complex: :simple} ->
        # From octet 12 onwards, e.g. straight up data.
        parse_chunk(data, n)
    end
  end

  # probably not 0 0 but will serve as a point to start when octect 14 does exist
  defp parse_data(
         <<0, 0, more_flags::binary-size(1), _data::binary()>>,
         _n,
         %Table11{additional_flags_at_section_4_octect_14: true} = flags
       ) do
    _table_11 = Table11.get_additional(flags, more_flags)
    []
  end
end
