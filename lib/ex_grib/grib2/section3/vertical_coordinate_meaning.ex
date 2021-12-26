defmodule ExGrib.Grib2.Section3.VerticalCoordinateMeaning do
  @moduledoc """
  Table 3.15

  Physical meaning of vertical coordinate

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-15.shtml
  """

  @type input :: integer()
  @type t ::
          :temperature
          | :pressure
          | :pressure_deviation_from_mean_sea_level
          | :altitude_above_mean_sea_level
          | :height_above_ground
          | :sigma_coordinate
          | :hybrid_coordinate
          | :depth_below_land_surface
          | :potential_temperature
          | :pressure_deviation_from_ground_to_level
          | :potential_vorticity
          | :geometric_height
          | :eta_coordinate
          | :geopotential_height
          | :logarithmic_hybrid_coordinate
          | :depth_below_sea_level
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(integer()) :: t()
  def get(n) when n >= 0 and n <= 19, do: :reserved
  # Temperature (in K)
  def get(20), do: :temperature
  def get(n) when n >= 21 and n <= 99, do: :reserved
  # Pressure (in Pa)
  def get(100), do: :pressure
  # Pressure deviation from mean sea level (in Pa)
  def get(101), do: :pressure_deviation_from_mean_sea_level
  # Altitude above mean sea level (in m)
  def get(102), do: :altitude_above_mean_sea_level
  # Height above ground (see note 1) (in m)
  def get(103), do: :height_above_ground
  # Sigma coordinate
  def get(104), do: :sigma_coordinate
  # Hybrid coordinate
  def get(105), do: :hybrid_coordinate
  # Depth below land surface (in m)
  def get(106), do: :depth_below_land_surface
  # Potential temperature (theta) (in K)
  def get(107), do: :potential_temperature
  # Pressure deviation from ground to level (in Pa)
  def get(108), do: :pressure_deviation_from_ground_to_level
  # Potential vorticity (in K m-2 kg-1 s-1)
  def get(109), do: :potential_vorticity
  # Geometric height (in m)
  def get(110), do: :geometric_height
  # Eta coordinate (see note 2)
  def get(111), do: :eta_coordinate
  # Geopotential height (in gpm)
  def get(112), do: :geopotential_height
  # Logarithmic hybrid coordinate
  def get(113), do: :logarithmic_hybrid_coordinate
  def get(n) when n >= 114 and n <= 159, do: :reserved
  # Depth below sea level (in m)
  def get(160), do: :depth_below_sea_level
  def get(n) when n >= 161 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
