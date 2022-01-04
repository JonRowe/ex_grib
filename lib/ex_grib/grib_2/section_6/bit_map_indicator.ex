defmodule ExGrib.Grib2.Section6.BitMapIndicator do
  @moduledoc """
  Table 6.0

  Bit map indicator

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table6-0.shtml
  """

  @type id :: integer()
  @type t ::
          :bit_map_attached
          | :bit_map_does_not_apply
          | :bit_map_pre_determined
          | :bit_map_previously_defined

  @spec get(id()) :: t()
  # A bit map applies to this product and is specified in this section.
  def get(0), do: :bit_map_attached

  # A bit map pre-determined by the orginating generating center applies to this product and is not specified in this section.
  def get(n) when n >= 1 and n <= 253, do: :bit_map_pre_determined
  # A bit map previously defined in the same GRIB2 message applies to this product.
  def get(254), do: :bit_map_previously_defined
  # A bit map does not apply to this product.
  def get(255), do: :bit_map_does_not_apply
end
