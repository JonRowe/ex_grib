defmodule ExGrib.Grib2.Section4.CategoricalOutlook do
  @moduledoc """
  Table 4.224

  Categorical outlook

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-224.shtml
  """

  @type id :: integer()
  @type t ::
          :critical_risk_area
          | :dry_thunderstorm
          | :extreamly_critical_risk_area
          | :general_thunderstorm_risk_area
          | :high_risk_area
          | :moderate_risk_area
          | :no_risk_area
          | :slight_risk_area
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :no_risk_area
  def get(1), do: :reserved
  def get(2), do: :general_thunderstorm_risk_area
  def get(3), do: :reserved
  def get(4), do: :slight_risk_area
  def get(5), do: :reserved
  def get(6), do: :moderate_risk_area
  def get(7), do: :reserved
  def get(8), do: :high_risk_area
  def get(n) when n >= 9 and n <= 10, do: :reserved
  # Dry Thunderstorm (Dry Lightning) Risk Area
  def get(11), do: :dry_thunderstorm
  def get(n) when n >= 12 and n <= 13, do: :reserved
  def get(14), do: :critical_risk_area
  def get(n) when n >= 15 and n <= 17, do: :reserved
  def get(18), do: :extreamly_critical_risk_area
  def get(n) when n >= 19 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
