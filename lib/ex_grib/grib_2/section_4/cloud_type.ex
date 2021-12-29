defmodule ExGrib.Grib2.Section4.CloudType do
  @moduledoc """
  Table 4.203

  Cloud type

  Notes:

  1. Code figures 11-20 indicate all four layers were used and
     ground-based fog is below the lowest layer.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-203.shtml
  """

  @type id :: integer()
  @type t ::
          :altocumulus
          | :altocumulus_ground_based_fog_beneath_the_lowest_layer
          | :altostratus
          | :altostratus_ground_based_fog_beneath_the_lowest_layer
          | :cirrorcumulus
          | :cirrorcumulus_ground_based_fog_beneath_the_lowest_layer
          | :cirrostratus
          | :cirrostratus_ground_based_fog_beneath_the_lowest_layer
          | :cirrus
          | :cirrus_ground_based_fog_beneath_the_lowest_layer
          | :clear
          | :cumulonimbus
          | :cumulonimbus_ground_based_fog_beneath_the_lowest_layer
          | :cumulus
          | :cumulus_ground_based_fog_beneath_the_lowest_layer
          | :nimbostratus
          | :nimbostratus_ground_based_fog_beneath_the_lowest_layer
          | :stratocumulus
          | :stratocumulus_ground_based_fog_beneath_the_lowest_layer
          | :stratus
          | :stratus_ground_based_fog_beneath_the_lowest_layer
          | :unknown
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :clear
  def get(1), do: :cumulonimbus
  def get(2), do: :stratus
  def get(3), do: :stratocumulus
  def get(4), do: :cumulus
  def get(5), do: :altostratus
  def get(6), do: :nimbostratus
  def get(7), do: :altocumulus
  def get(8), do: :cirrostratus
  def get(9), do: :cirrorcumulus
  def get(10), do: :cirrus
  def get(11), do: :cumulonimbus_ground_based_fog_beneath_the_lowest_layer
  def get(12), do: :stratus_ground_based_fog_beneath_the_lowest_layer
  def get(13), do: :stratocumulus_ground_based_fog_beneath_the_lowest_layer
  def get(14), do: :cumulus_ground_based_fog_beneath_the_lowest_layer
  def get(15), do: :altostratus_ground_based_fog_beneath_the_lowest_layer
  def get(16), do: :nimbostratus_ground_based_fog_beneath_the_lowest_layer
  def get(17), do: :altocumulus_ground_based_fog_beneath_the_lowest_layer
  def get(18), do: :cirrostratus_ground_based_fog_beneath_the_lowest_layer
  def get(19), do: :cirrorcumulus_ground_based_fog_beneath_the_lowest_layer
  def get(20), do: :cirrus_ground_based_fog_beneath_the_lowest_layer
  def get(n) when n >= 21 and n <= 190, do: :reserved
  def get(191), do: :unknown
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
