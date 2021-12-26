defmodule ExGrib.Grib2.Section3.SourceOfGridDefinition do
  @moduledoc """
  Table 3.0
  The source of a GRIB definition, this can be either within section 3,
  or it can be a predetermined template, or not applicable to this template.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-0.shtml
  """

  @type id :: integer()
  @type t ::
          :grib_template | :predetermined | :reserved | :reserved_for_local_use | :not_applicable

  @spec get(id()) :: t()
  def get(0), do: :grib_template
  def get(1), do: :predetermined
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 154, do: :reserved_for_local_use
  def get(255), do: :not_applicable
end
