defmodule ExGrib.Grib2.Section4.Templates.IndividualEnsembleForecastControlAndPerturbedIntervalForAtmosphericChemicalConstituentsBasedOnADistributionFunction do
  @moduledoc """
  Template 4.58

  Individual ensemble forecast control and perturbed interval for atmospheric chemical constituents based on a distribution functionoratmospheric chemical constituents based on a distribution function

  Notes:
  1. If Number of mode (N) > 1, then between X N fields with mode number I=1,...,N define the distribution function. X is number of variable
  parameters in the distribution function.
  2. Hours greater than 65534 will be coded as 65534
  3. For more information, see Part B, GRIB Attachment III.

  WARNING THIS TEMPLATE WAS AUTOGENERATED AND IS LIKELY INCOMPLETE

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp4-58.shtml
  """

  defstruct parameter_category: nil,
            parameter_number: nil,
            atmospheric_chemical_constituent_type: nil,
            number_of_mode: nil,
            mode_number: nil,
            type_of_distribution_function: nil,
            number_of_following_function_paramters: nil,
            list_of_scale_factor_of_fixed_distribution_function_parameter: nil,
            list_of_scale_value_of_fixed_distribution_function_parameter: nil,
            type_of_generting_process: nil,
            background_generting_process_identifier: nil,
            analysis_or_forecast_generating_process_identifier: nil,
            hours_of_observational_data_cut_off_after_reference_time: nil,
            minutes_of_observational_data_cut_off_after_reference_time: nil,
            indicator_of_unit_of_time_range: nil,
            forecast_time_in_units_defined_by_previous_octet: nil,
            type_of_first_fixed_surface: nil,
            scale_factor_of_first_fixed_surface: nil,
            scale_value_of_first_fixed_surface: nil,
            type_of_first_second_surface: nil,
            scale_factor_of_second_fixed_surface: nil,
            scale_value_of_second_fixed_surface: nil,
            type_of_ensemble_forecast: nil,
            perturbation_number: nil,
            number_of_forecasts_in_ensemble: nil

  @spec get(binary()) :: no_return
  def get(<<
        # Parameter category (see Code Table 4.1)
        parameter_category::integer(),
        # Parameter number (see Code Table 4.2)
        parameter_number::integer(),
        # Atmospheric Chemical Constituent Type (see Code table 4.230)
        atmospheric_chemical_constituent_type::integer-size(16),
        # Number of mode (N) of distribution (See Note 1)
        number_of_mode::integer-size(16),
        # Mode number (l)
        mode_number::integer-size(16),
        # Type of distribution function (see Code Table 4.240)
        type_of_distribution_function::integer-size(16),
        # Number of following function paramters  (Np) defined by type given in octet 18-19 (Type of distribution function)
        number_of_following_function_paramters::integer(),
        # List of scale factor of fixed distribution function parameter (p1 -  pNp) defined by type of distribution in octet 18-19
        list_of_scale_factor_of_fixed_distribution_function_parameter::integer-size(1704),
        # List of scale value of fixed distribution function parameter (p1 -  pNp) defined by type of distribution in octet 18-19
        list_of_scale_value_of_fixed_distribution_function_parameter::integer-size(248),
        # Type of generting process (see Code Table 4.3)
        type_of_generting_process::integer(),
        # Background generting process identifier (defined by originating centre)
        background_generting_process_identifier::integer(),
        # Analysis or forecast generating process identifier (defined by originating centre)
        analysis_or_forecast_generating_process_identifier::integer(),
        # Hours of observational data cut-off after reference time (See Note 2)
        hours_of_observational_data_cut_off_after_reference_time::integer-size(88),
        minutes_of_observational_data_cut_off_after_reference_time::integer(),
        # Indicator of unit of time range (see Code Table 4.4)
        indicator_of_unit_of_time_range::integer(),
        forecast_time_in_units_defined_by_previous_octet::integer-size(248),
        # Type of first fixed surface (see Code Table 4.5)
        type_of_first_fixed_surface::integer(),
        scale_factor_of_first_fixed_surface::integer(),
        scale_value_of_first_fixed_surface::integer-size(248),
        # Type of first second surface (see Code Table 4.5)
        type_of_first_second_surface::integer(),
        scale_factor_of_second_fixed_surface::integer(),
        scale_value_of_second_fixed_surface::integer-size(248),
        # Type of Ensemble Forecast (see Code Table 4.6)
        type_of_ensemble_forecast::integer(),
        perturbation_number::integer(),
        number_of_forecasts_in_ensemble::integer(),
        rest::binary()
      >>) do
    template = %__MODULE__{
      parameter_category: parameter_category,
      parameter_number: parameter_number,
      atmospheric_chemical_constituent_type: atmospheric_chemical_constituent_type,
      number_of_mode: number_of_mode,
      mode_number: mode_number,
      type_of_distribution_function: type_of_distribution_function,
      number_of_following_function_paramters: number_of_following_function_paramters,
      list_of_scale_factor_of_fixed_distribution_function_parameter:
        list_of_scale_factor_of_fixed_distribution_function_parameter,
      list_of_scale_value_of_fixed_distribution_function_parameter:
        list_of_scale_value_of_fixed_distribution_function_parameter,
      type_of_generting_process: type_of_generting_process,
      background_generting_process_identifier: background_generting_process_identifier,
      analysis_or_forecast_generating_process_identifier:
        analysis_or_forecast_generating_process_identifier,
      hours_of_observational_data_cut_off_after_reference_time:
        hours_of_observational_data_cut_off_after_reference_time,
      minutes_of_observational_data_cut_off_after_reference_time:
        minutes_of_observational_data_cut_off_after_reference_time,
      indicator_of_unit_of_time_range: indicator_of_unit_of_time_range,
      forecast_time_in_units_defined_by_previous_octet:
        forecast_time_in_units_defined_by_previous_octet,
      type_of_first_fixed_surface: type_of_first_fixed_surface,
      scale_factor_of_first_fixed_surface: scale_factor_of_first_fixed_surface,
      scale_value_of_first_fixed_surface: scale_value_of_first_fixed_surface,
      type_of_first_second_surface: type_of_first_second_surface,
      scale_factor_of_second_fixed_surface: scale_factor_of_second_fixed_surface,
      scale_value_of_second_fixed_surface: scale_value_of_second_fixed_surface,
      type_of_ensemble_forecast: type_of_ensemble_forecast,
      perturbation_number: perturbation_number,
      number_of_forecasts_in_ensemble: number_of_forecasts_in_ensemble
    }

    {:ok, template, rest}
  end
end
