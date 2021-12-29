defmodule ExGrib.Grib2.Section4.TypeOfGeneratingProcess do
  @moduledoc """
  Table 4.3

  Type of generating process

  Notes:

  1. Code figures 12 and 13 are intended in cases where code figures 0 and 2
  may not be sufficient to indicate that significant post-processing has taken place
  on an intial analysis or forecast output.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-3.shtml
  """

  @type id :: integer()
  @type t ::
          :analysis
          | :initialization
          | :forecast
          | :bias_corrected_forecast
          | :ensemble_forecast
          | :probability_forecast
          | :forecast_error
          | :analysis_error
          | :observation
          | :climatological
          | :probability_weighted_forecast
          | :bias_corrected_ensemble_forecast
          | :post_processed_analysis
          | :post_processed_forecast
          | :nowcast
          | :hindcast
          | :physical_retrieval
          | :regression_analysis
          | :difference_between_two_forecasts
          | :reserved
          | :reserved_for_local_use
          | :forecast_confidence_indicator
          | :probability_matched_mean
          | :neighborhood_probability
          | :bias_corrected_and_downscaled_ensemble_forecast
          | :perturbed_analysis_for_ensemble_initialization
          | :ensemble_agreement_scale_probability
          | :post_processed_deterministic_expert_weighted_forecast
          | :ensemble_forecast_based_on_counting
          | :local_probability_matched_mean
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :analysis
  def get(1), do: :initialization
  def get(2), do: :forecast
  def get(3), do: :bias_corrected_forecast
  def get(4), do: :ensemble_forecast
  def get(5), do: :probability_forecast
  def get(6), do: :forecast_error
  def get(7), do: :analysis_error
  def get(8), do: :observation
  def get(9), do: :climatological
  def get(10), do: :probability_weighted_forecast
  def get(11), do: :bias_corrected_ensemble_forecast
  # Post-processed Analysis (See Note)
  def get(12), do: :post_processed_analysis
  # Post-processed Forecast (See Note)
  def get(13), do: :post_processed_forecast
  def get(14), do: :nowcast
  def get(15), do: :hindcast
  def get(16), do: :physical_retrieval
  def get(17), do: :regression_analysis
  def get(18), do: :difference_between_two_forecasts
  def get(n) when n >= 19 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(192), do: :forecast_confidence_indicator
  def get(193), do: :probability_matched_mean
  def get(194), do: :neighborhood_probability
  def get(195), do: :bias_corrected_and_downscaled_ensemble_forecast
  def get(196), do: :perturbed_analysis_for_ensemble_initialization
  def get(197), do: :ensemble_agreement_scale_probability
  def get(198), do: :post_processed_deterministic_expert_weighted_forecast
  def get(199), do: :ensemble_forecast_based_on_counting
  def get(200), do: :local_probability_matched_mean
  def get(255), do: :missing
end
