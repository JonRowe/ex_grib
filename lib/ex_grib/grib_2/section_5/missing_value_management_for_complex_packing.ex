defmodule ExGrib.Grib2.Section5.MissingValueManagementForComplexPacking do
  @moduledoc """
  Table 5.5

  Missing value management for complex packing

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table5-5.shtml
  """

  @type id :: integer()
  @type t ::
          :no_explicit_missing_values_included_within_the_data_values
          | :primary_and_secondary_missing_values_included_within_the_data_values
          | :primary_missing_values_included_within_the_data_values
          | :reserved
          | :reserved_for_local_use

  @spec get(id()) :: t()
  def get(0), do: :no_explicit_missing_values_included_within_the_data_values
  def get(1), do: :primary_missing_values_included_within_the_data_values
  def get(2), do: :primary_and_secondary_missing_values_included_within_the_data_values
  def get(n) when n >= 3 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
end
