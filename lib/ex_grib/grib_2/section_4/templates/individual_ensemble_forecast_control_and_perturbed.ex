defmodule ExGrib.Grib2.Section4.Templates.IndividualEnsembleForecastControlAndPerturbed do
  @moduledoc """
  Template 4.1

  Individual ensemble forecast control and perturbedd, at a horizontallevel or in a horizontal layer at a point in time

  Notes:  Hours greater than
  65534 will be coded as 65534

  WARNING THIS TEMPLATE WAS AUTOGENERATED AND IS LIKELY INCOMPLETE

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp4-1.shtml
  """

  defstruct parameter_category: nil,
            parameter_number: nil,
            type_of_generating_process: nil,
            background_generating_process_identifier: nil,
            forecast_generating_process_identified: nil,
            hours_after_reference_time_data_cutoff: nil,
            minutes_after_reference_time_data_cutoff: nil,
            indicator_of_unit_of_time_range: nil,
            forecast_time_in_units_defined_by_octet: nil,
            type_of_first_fixed_surface: nil,
            scale_factor_of_first_fixed_surface: nil,
            scaled_value_of_first_fixed_surface: nil,
            type_of_second_fixed_surfaced: nil,
            scale_factor_of_second_fixed_surface: nil,
            scaled_value_of_second_fixed_surfaces: nil,
            type_of_ensemble_forecast: nil,
            perturbation_number: nil,
            number_of_forecasts_in_ensemble: nil

  @spec get(binary()) :: no_return
  def get(<<
        # Parameter category (see Code table 4.1)
        parameter_category::integer(),
        # Parameter number (see Code table 4.2)
        parameter_number::integer(),
        # Type of generating process (see Code table 4.3)
        type_of_generating_process::integer(),
        # Background generating process identifier (defined by originating centre)
        background_generating_process_identifier::integer(),
        # Forecast generating process identified (see Code ON388 Table A)
        forecast_generating_process_identified::integer(),
        # Hours after reference time data cutoff (see Note)
        hours_after_reference_time_data_cutoff::integer-size(16),
        # Minutes after reference time data cutoff (see Note)
        minutes_after_reference_time_data_cutoff::integer(),
        # Indicator of unit of time range (see Code table 4.4)
        indicator_of_unit_of_time_range::integer(),
        # Forecast time in units defined by octet 18
        forecast_time_in_units_defined_by_octet::integer-size(32),
        # Type of first fixed surface (see Code table 4.5)
        type_of_first_fixed_surface::integer(),
        scale_factor_of_first_fixed_surface::integer(),
        scaled_value_of_first_fixed_surface::integer-size(32),
        # Type of second fixed surfaced (see Code table 4.5)
        type_of_second_fixed_surfaced::integer(),
        scale_factor_of_second_fixed_surface::integer(),
        scaled_value_of_second_fixed_surfaces::integer-size(32),
        # Type of ensemble forecast (see Code table 4.6)
        type_of_ensemble_forecast::integer(),
        perturbation_number::integer(),
        number_of_forecasts_in_ensemble::integer(),
        rest::binary()
      >>) do
    template = %__MODULE__{
      parameter_category: parameter_category,
      parameter_number: parameter_number,
      type_of_generating_process: type_of_generating_process,
      background_generating_process_identifier: background_generating_process_identifier,
      forecast_generating_process_identified: forecast_generating_process_identified,
      hours_after_reference_time_data_cutoff: hours_after_reference_time_data_cutoff,
      minutes_after_reference_time_data_cutoff: minutes_after_reference_time_data_cutoff,
      indicator_of_unit_of_time_range: indicator_of_unit_of_time_range,
      forecast_time_in_units_defined_by_octet: forecast_time_in_units_defined_by_octet,
      type_of_first_fixed_surface: type_of_first_fixed_surface,
      scale_factor_of_first_fixed_surface: scale_factor_of_first_fixed_surface,
      scaled_value_of_first_fixed_surface: scaled_value_of_first_fixed_surface,
      type_of_second_fixed_surfaced: type_of_second_fixed_surfaced,
      scale_factor_of_second_fixed_surface: scale_factor_of_second_fixed_surface,
      scaled_value_of_second_fixed_surfaces: scaled_value_of_second_fixed_surfaces,
      type_of_ensemble_forecast: type_of_ensemble_forecast,
      perturbation_number: perturbation_number,
      number_of_forecasts_in_ensemble: number_of_forecasts_in_ensemble
    }

    {:ok, template, rest}
  end
end