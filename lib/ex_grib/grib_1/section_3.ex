defmodule ExGrib.Grib1.Section3 do
  @moduledoc """
  Section 3: Bit-map section

  https://apps.ecmwf.int/codes/grib/format/grib1/sections/3/
  """

  @type input :: binary()
  @typep section ::
           %__MODULE__{
             data: binary(),
             number_of_unused_bits_at_end_of_section_3: integer(),
             section_length: integer(),
             table_reference: integer()
           }
  @type t :: {:ok, section()} | :error

  defstruct data: :not_parsed,
            number_of_unused_bits_at_end_of_section_3: :not_parsed,
            section_length: :not_parsed,
            table_reference: :not_parsed

  @spec parse(input()) :: t()
  def parse(<<
        # Length of section
        section_length::integer-size(24),
        number_of_unused_bits_at_end_of_section_3::integer(),
        table_reference::integer-size(16),
        more::binary()
      >>) do
    remaining_octets = section_length - 6

    <<data::binary-size(remaining_octets), rest::binary()>> = more

    section = %__MODULE__{
      data: data,
      number_of_unused_bits_at_end_of_section_3: number_of_unused_bits_at_end_of_section_3,
      section_length: section_length,
      table_reference: table_reference
    }

    {:ok, section, rest}
  end

  def parse(_), do: :error
end
