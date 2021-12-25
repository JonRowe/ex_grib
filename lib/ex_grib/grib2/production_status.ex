defmodule ExGrib.Grib2.ProductionStatus do
  @moduledoc """
  Production status of data.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table1-3.shtml
  """

  @typep status_id :: integer()
  @spec get(status_id()) :: atom()
  def get(0), do: :operational_products
  def get(1), do: :operational_test_products
  def get(2), do: :research_products
  def get(3), do: :re_analysis_products
  def get(4), do: :thorpex_interactive_grand_global_ensemble_tigge
  def get(5), do: :thorpex_interactive_grand_global_ensemble_tigge_test
  def get(6), do: :s2s_operational_products
  def get(7), do: :s2s_test_products
  def get(8), do: :uncertainties_in_ensembles_of_regional_reanalysis_project_uerra
  def get(9), do: :uncertainties_in_ensembles_of_regional_reanalysis_project_uerra_test
  def get(n) when n >= 10 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
