defmodule ExGrib.Grib2.Section4.PrecipitationType do
  @moduledoc """
  Table 4.201

  Precipitation type

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-201.shtml
  """

  @type id :: integer()
  @type t ::
          :drizzle
          | :freezing_drizzle
          | :freezing_rain
          | :graupel
          | :hail
          | :ice_pellets
          | :mixed
          | :mixture_of_rain_and_snow
          | :rain
          | :snow
          | :thunderstorm
          | :wet_snow
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :reserved
  def get(1), do: :rain
  def get(2), do: :thunderstorm
  def get(3), do: :freezing_rain
  # Mixed/Ice
  def get(4), do: :mixed
  def get(5), do: :snow
  def get(6), do: :wet_snow
  def get(7), do: :mixture_of_rain_and_snow
  def get(8), do: :ice_pellets
  def get(9), do: :graupel
  def get(10), do: :hail
  def get(11), do: :drizzle
  def get(12), do: :freezing_drizzle
  def get(n) when n >= 13 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
