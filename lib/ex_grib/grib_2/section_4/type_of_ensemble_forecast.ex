defmodule ExGrib.Grib2.Section4.TypeOfEnsembleForecast do
  @moduledoc """
  Table 4.6

  Type of ensemble forecast

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-6.shtml
  """

  @type id :: integer()
  @type t ::
          :multi_model_forecast
          | :negatively_perturbed_forecast
          | :perturbed_ensemble_member
          | :positively_perturbed_forecast
          | :unperturbed_high_resolution_control_forecast
          | :unperturbed_low_resolution_control_forecast
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :unperturbed_high_resolution_control_forecast
  def get(1), do: :unperturbed_low_resolution_control_forecast
  def get(2), do: :negatively_perturbed_forecast
  def get(3), do: :positively_perturbed_forecast
  def get(4), do: :multi_model_forecast
  def get(n) when n >= 5 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(192), do: :perturbed_ensemble_member
  def get(255), do: :missing
end
