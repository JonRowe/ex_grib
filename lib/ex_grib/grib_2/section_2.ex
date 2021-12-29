defmodule ExGrib.Grib2.Section2 do
  @moduledoc """
  Section 2 is reserved for local use.

  Center=7 (NCEP), subcenter=14(NWS Meteorological Development Laboratory (MDL))
  uses octet 6 to indicate which local use table to use. For MDL, octet 6=1
  indicates use: "MDL Template 2.1"

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_sect2.shtml
  """

  @type input :: binary()
  @type t :: {:ok, binary()} | :error

  def parse(<<section_size::integer-size(32), 2, possibly_reserved::binary()>>) do
    if section_size > 0 do
      size_to_skip = section_size - 5
      <<_skip::binary-size(size_to_skip), rest::binary()>> = possibly_reserved
      {:ok, rest}
    else
      {:ok, possibly_reserved}
    end
  end

  # local use is sometimes missing
  def parse(<<_section_size::integer-size(32), n, _::binary>> = rest) when n > 2 and n < 9 do
    {:ok, rest}
  end

  def parse(_), do: :error
end
