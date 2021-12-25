defmodule ExGrib.Grib2.SubCentre do
  @moduledoc """
  Returns an originating sub-centre as assigned by the nation,
  looked up from an integer in the GRIB.

  https://www.nco.ncep.noaa.gov/pmb/docs/on388/tablec.html
  """

  @typep centre_id :: integer()
  @typep sub_centre_id :: integer()
  @spec get(centre_id(), sub_centre_id()) :: atom()
  def get(7, 1), do: :ncep_re_analysis_project
  def get(7, 2), do: :ncep_ensemble_products
  def get(7, 3), do: :ncep_central_operations
  def get(7, 4), do: :environmental_modeling_center
  def get(7, 5), do: :weather_prediction_center
  def get(7, 6), do: :ocean_prediction_center
  def get(7, 7), do: :climate_prediction_center
  def get(7, 8), do: :aviation_weather_center
  def get(7, 9), do: :storm_prediction_center
  def get(7, 10), do: :national_hurricane_center
  def get(7, 11), do: :nws_techniques_development_laboratory
  def get(7, 12), do: :nesdis_office_of_research_and_applications
  def get(7, 13), do: :federal_aviation_administration
  def get(7, 14), do: :nws_meteorological_development_laboratory
  def get(7, 15), do: :north_american_regional_reanalysis_project
  def get(7, 16), do: :space_weather_prediction_center
  def get(7, 17), do: :esrl_global_systems_division
  def get(_, _), do: :unknown
end
