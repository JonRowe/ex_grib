defmodule ExGrib.Grib2.Section4.PresenceOfAerosol do
  @moduledoc """
  Table 4.205

  Presence of aerosol

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-205.shtml
  """

  @type id :: integer()
  @type t ::
          :aerosol_not_present
          | :aerosol_present
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :aerosol_not_present
  def get(1), do: :aerosol_present
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
