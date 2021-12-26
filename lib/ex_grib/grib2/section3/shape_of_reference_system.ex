defmodule ExGrib.Grib2.Section3.ShapeOfReferenceSystem do
  @moduledoc """
  Table 3.2
  Returns the 'shape' of the reference system (e.g. the datum used by the grib).

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-2.shtml
  """

  @type id :: integer()
  @type t ::
          :spherical
          | :spherical_with_custom_radius
          | :iau_oblate_spheriod
          | :custom_oblate_spheriod_km
          | :iag_oblate_spheriod
          | :wgs84
          | :spherical_2
          | :custom_oblate_spheriod_m
          | :spherical_wgs84
          | :osgb
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  # Earth assumed spherical with radius = 6,367,470.0 m
  def get(0), do: :spherical
  # Earth assumed spherical with radius specified (in m) by data producer
  def get(1), do: :spherical_with_custom_radius

  # Earth assumed oblate spheriod with size as determined by IAU in 1965 (major axis = 6,378,160.0 m, minor axis = 6,356,775.0 m, f = 1/297.0)
  def get(2), do: :iau_oblate_spheriod
  # Earth assumed oblate spheriod with major and minor axes specified (in km) by data producer
  def get(3), do: :custom_oblate_spheriod_km

  # Earth assumed oblate spheriod as defined in IAG-GRS80 model (major axis = 6,378,137.0 m, minor axis = 6,356,752.314 m, f = 1/298.257222101)
  def get(4), do: :iag_oblate_spheriod
  # Earth assumed represented by WGS84 (as used by ICAO since 1998) (Uses IAG-GRS80 as a basis)
  def get(5), do: :wgs84
  # Earth assumed spherical with radius = 6,371,229.0 m
  def get(6), do: :spherical_2
  # Earth assumed oblate spheroid with major and minor axes specified (in m) by data producer
  def get(7), do: :custom_oblate_spheriod_m

  # Earth model assumed spherical with radius 6,371,200 m, but the horizontal datum of the resulting Latitude/Longitude field is the WGS84 reference frame
  def get(8), do: :spherical_wgs84

  # Earth represented by the OSGB 1936 Datum, using the Airy_1830 Spheroid, the Greenwich meridian as 0 Longitude, the Newlyn datum as mean sea level, 0 height.
  def get(9), do: :osgb
  def get(n) when n >= 10 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
