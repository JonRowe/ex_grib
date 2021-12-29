defmodule ExGrib.Grib2.Section4.TileClassification do
  @moduledoc """
  Table 4.242

  Tile classification

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-242.shtml
  """

  @type id :: integer()
  @type t ::
          :land_use_classes_according_to_esa_globcover_gcv
          | :land_use_classes_according_to_european_commission_global_land_cover_project_glc
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :reserved
  # Land use classes according to ESA-GLOBCOVER GCV2009
  def get(1), do: :land_use_classes_according_to_esa_globcover_gcv
  # Land use classes according to European Commission-Global Land Cover Project GLC2000
  def get(2), do: :land_use_classes_according_to_european_commission_global_land_cover_project_glc
  def get(n) when n >= 3 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
