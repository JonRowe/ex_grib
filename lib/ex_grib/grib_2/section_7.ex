defmodule ExGrib.Grib2.Section7 do
  @moduledoc """
  Section 7

  Data section

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_sect7.shtml
  """

  @type input :: binary()
  @type t :: {:ok, any(), binary()} | :error

  @spec parse(input()) :: t()
  def parse(<<
        # Length of the section in octets (nn)
        length_of_the_section_in_octets::integer-size(32),
        # Number of the section (7)
        7,
        # Data in a format described by data Template 7.X where X is the data representation template number given in octets 10-11 of Section 5.
        more::binary()
      >>) do
    size_of_data = length_of_the_section_in_octets - 5

    <<template_data::binary-size(size_of_data), rest::binary()>> = more

    {:ok, template_data, rest}
  end

  def parse(_), do: :error
end
