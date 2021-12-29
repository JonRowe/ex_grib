defmodule ExGrib.Grib2.Section4.CloudTopHeightQualityIndicator do
  @moduledoc """
  Table 4.219

  Cloud top height quality indicator

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-219.shtml
  """

  @type id :: integer()
  @type t ::
          :fog_in_segment
          | :fog_in_segment_and_poor_quality_height_estimation
          | :nominal_cloud_top_height_quality
          | :poor_quality_height_estimation
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :nominal_cloud_top_height_quality
  def get(1), do: :fog_in_segment
  def get(2), do: :poor_quality_height_estimation
  def get(3), do: :fog_in_segment_and_poor_quality_height_estimation
  def get(n) when n >= 4 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
