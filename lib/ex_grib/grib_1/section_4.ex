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

    <<_variable::binary-size(remaining_octets), rest::binary()>> = more

    section = %__MODULE__{
      binary_scale_factor: binary_scale_factor,
      bits_per_value: bits_per_value,
      data_flag: Table11.get(data_flag),
      reference_value: reference_value,
      section_length: section_length
    }

    {:ok, section, rest}
  end

  def parse(_), do: :error
end
