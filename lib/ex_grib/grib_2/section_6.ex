defmodule ExGrib.Grib2.Section6 do
  @moduledoc """
  Section 6

  Bit map section

  Notes:

  1.  If octet 6 is not zero, the length of this section is 6 and
  octets 7-nn are not present.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_sect6.shtml
  """

  alias ExGrib.Grib2.Section6.BitMapIndicator

  @type input :: binary()
  @type bitmap :: binary()
  @type t ::
          {:ok, BitMapIndicator.t(), bitmap(), binary()}
          | {:ok, BitMapIndicator.t(), binary()}
          | :error

  @spec parse(input()) :: t()
  def parse(<<
        # Length of the section in octets (nn)
        length_of_the_section_in_octets::integer-size(32),
        # Number of the section (6)
        6,
        # Bit-map indicator (See Table 6.0) (See note 1)
        0,
        more::binary()
      >>) do
    size = length_of_the_section_in_octets - 6
    <<bitmap::binary-size(size), rest::binary()>> = more
    {:ok, BitMapIndicator.get(0), bitmap, rest}
  end

  # See Note 1.
  def parse(<<0, 0, 0, 6, 6, bitmap_indicator, rest::binary()>>) do
    {:ok, BitMapIndicator.get(bitmap_indicator), rest}
  end

  def parse(_), do: :error
end
