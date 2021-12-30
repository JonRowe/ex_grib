defmodule ExGrib.Grib2.Section4.PlanetaryBoundaryLayerRegime do
  @moduledoc """
  Table 4.209

  Planetary boundary layer regime

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-209.shtml
  """

  @type id :: integer()
  @type t ::
          :force_convection
          | :free_convection
          | :mechanically_driven_turbulence
          | :stable
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :reserved
  def get(1), do: :stable
  def get(2), do: :mechanically_driven_turbulence
  def get(3), do: :force_convection
  def get(4), do: :free_convection
  def get(n) when n >= 5 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
