defmodule ExGrib.Grib2.ReferenceTime do
  @moduledoc """
  Significance of reference time values.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table1-2.shtml
  """

  @type id :: integer()
  @type t ::
          :analysis
          | :start_of_forecast
          | :observation_time
          | :verifying_time_of_forecast
          | :missing
          | :reserved
          | :reserved_for_local_use

  @spec get(id()) :: t()
  def get(0), do: :analysis
  def get(1), do: :start_of_forecast
  def get(2), do: :verifying_time_of_forecast
  def get(3), do: :observation_time
  def get(n) when n >= 4 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
