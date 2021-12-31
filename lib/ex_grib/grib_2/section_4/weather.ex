defmodule ExGrib.Grib2.Section4.Weather do
  @moduledoc """
  Table 4.225

  Weather, see: FM 94 BUFR/FM 95 CREX Code table 0 20 003 - Present Weather
  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/WMO306_vI2_BUFRCREX_TableB_en_v23.0.0.pdf
  (Released date: Version 23.0.0 - May 15, 2019)

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-225.shtml
  """

  @type id :: integer()
  @type t :: no_return()

  @spec get(id()) :: t()
  def get(_), do: raise("Not Implemented")
end
