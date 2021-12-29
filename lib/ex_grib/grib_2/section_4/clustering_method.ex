defmodule ExGrib.Grib2.Section4.ClusteringMethod do
  @moduledoc """
  Table 4.8

  Clustering method

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-8.shtml
  """

  @type id :: integer()
  @type t ::
          :anomoly_correlation
          | :root_mean_square
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :anomoly_correlation
  def get(1), do: :root_mean_square
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
