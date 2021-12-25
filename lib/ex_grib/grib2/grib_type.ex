defmodule ExGrib.Grib2.GribType do
  @moduledoc """
  Grib type.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table1-4.shtml
  """

  @typep type_id :: integer()
  @spec get(type_id()) :: atom()
  def get(0), do: :analysis_products
  def get(1), do: :forecast_products
  def get(2), do: :analysis_and_forecast_products
  def get(3), do: :control_forecast_products
  def get(4), do: :perturbed_forecast_products
  def get(5), do: :control_and_perturbed_forecast_products
  def get(6), do: :processed_satellite_observations
  def get(7), do: :processed_radar_observations
  def get(8), do: :event_probability
  def get(n) when n >= 9 and n <= 191, do: :reserved
  def get(192), do: :experimental_products
  def get(n) when n >= 193 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
