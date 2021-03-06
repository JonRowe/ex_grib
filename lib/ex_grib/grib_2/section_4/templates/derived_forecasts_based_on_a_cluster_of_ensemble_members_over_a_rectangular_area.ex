defmodule ExGrib.Grib2.Section4.Templates.DerivedForecastsBasedOnAClusterOfEnsembleMembersOverARectangularArea do
  @moduledoc """
  Template 4.3

  Derived forecasts based on a cluster of ensemble members over a rectangular area at a horizontal level or in a horizontal layer at a point in time

  Notes:  Hours greater than
  65534 will be coded as 65534

  WARNING THIS TEMPLATE WAS AUTOGENERATED AND IS LIKELY INCOMPLETE

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp4-3.shtml
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
            derived_forecast: nil,
            number_of_forecasts_in_the_ensemble: nil,
            cluster_identifier: nil,
            number_of_cluster_to_which_the_high_resolution_control_belongs: nil,
            number_of_cluster_to_which_the_low_resolution_control_belongs: nil,
            total_number_of_clusters: nil,
            clustering_method: nil,
            northern_latitude_of_cluster_domain: nil,
            southern_latitude_of_cluster_domain: nil,
            eastern_longitude_of_cluster_domain: nil,
            western_longitude_of_cluster_domain: nil,
            nc_number_of_forecasts_in_the_cluster: nil,
            scale_factor_of_standard_deviation_in_the_cluster: nil,
            scaled_value_of_standard_deviation_in_the_cluster: nil,
            scale_factor_of_distance_of_the_cluster_from_ensemble_mean: nil,
            scaled_value_of_distance_of_the_cluster_from_ensemble_mean: nil,
            list_of_nc_ensemble_forecast_numbers: nil

  @spec get(binary()) :: no_return
  def get(<<
        # Parameter category (see Code Table 4.1)
        parameter_category::integer(),
        # Parameter number (see Code Table 4.2)
        parameter_number::integer(),
        # Type of generating process (see Code Table 4.3)
        type_of_generating_process::integer(),
        # Background generating process identifier (defined by originating centre)
        background_generating_process_identifier::integer(),
        # Forecast generating process identified (see Code ON388 Table A)
        forecast_generating_process_identified::integer(),
        # Hours after reference time data cutoff (see Note)
        hours_after_reference_time_data_cutoff::integer-size(16),
        minutes_after_reference_time_data_cutoff::integer(),
        # Indicator of unit of time range (see Code Table 4.4)
        indicator_of_unit_of_time_range::integer(),
        # Forecast time in units defined by octet 18
        forecast_time_in_units_defined_by_octet::integer-size(32),
        # Type of first fixed surface (see Code Table 4.5)
        type_of_first_fixed_surface::integer(),
        scale_factor_of_first_fixed_surface::integer(),
        scaled_value_of_first_fixed_surface::integer-size(32),
        # Type of second fixed surfaced (see Code  Table 4.5)
        type_of_second_fixed_surfaced::integer(),
        scale_factor_of_second_fixed_surface::integer(),
        scaled_value_of_second_fixed_surfaces::integer-size(32),
        # Derived forecast (see Code Table 4.7)
        derived_forecast::integer(),
        # Number of forecasts in the ensemble (N)
        number_of_forecasts_in_the_ensemble::integer(),
        #  Cluster identifier
        cluster_identifier::integer(),
        number_of_cluster_to_which_the_high_resolution_control_belongs::integer(),
        number_of_cluster_to_which_the_low_resolution_control_belongs::integer(),
        total_number_of_clusters::integer(),
        # Clustering method (see Code Table 4.8)
        clustering_method::integer(),
        northern_latitude_of_cluster_domain::integer-size(32),
        southern_latitude_of_cluster_domain::integer-size(32),
        eastern_longitude_of_cluster_domain::integer-size(32),
        western_longitude_of_cluster_domain::integer-size(32),
        # Nc - number of forecasts in the cluster
        nc_number_of_forecasts_in_the_cluster::integer(),
        scale_factor_of_standard_deviation_in_the_cluster::integer(),
        scaled_value_of_standard_deviation_in_the_cluster::integer-size(32),
        scale_factor_of_distance_of_the_cluster_from_ensemble_mean::integer(),
        scaled_value_of_distance_of_the_cluster_from_ensemble_mean::integer-size(32),
        # List of Nc ensemble forecast numbers ( Nc is given in octet 58)
        list_of_nc_ensemble_forecast_numbers::integer-size(0),
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
      derived_forecast: derived_forecast,
      number_of_forecasts_in_the_ensemble: number_of_forecasts_in_the_ensemble,
      cluster_identifier: cluster_identifier,
      number_of_cluster_to_which_the_high_resolution_control_belongs:
        number_of_cluster_to_which_the_high_resolution_control_belongs,
      number_of_cluster_to_which_the_low_resolution_control_belongs:
        number_of_cluster_to_which_the_low_resolution_control_belongs,
      total_number_of_clusters: total_number_of_clusters,
      clustering_method: clustering_method,
      northern_latitude_of_cluster_domain: northern_latitude_of_cluster_domain,
      southern_latitude_of_cluster_domain: southern_latitude_of_cluster_domain,
      eastern_longitude_of_cluster_domain: eastern_longitude_of_cluster_domain,
      western_longitude_of_cluster_domain: western_longitude_of_cluster_domain,
      nc_number_of_forecasts_in_the_cluster: nc_number_of_forecasts_in_the_cluster,
      scale_factor_of_standard_deviation_in_the_cluster:
        scale_factor_of_standard_deviation_in_the_cluster,
      scaled_value_of_standard_deviation_in_the_cluster:
        scaled_value_of_standard_deviation_in_the_cluster,
      scale_factor_of_distance_of_the_cluster_from_ensemble_mean:
        scale_factor_of_distance_of_the_cluster_from_ensemble_mean,
      scaled_value_of_distance_of_the_cluster_from_ensemble_mean:
        scaled_value_of_distance_of_the_cluster_from_ensemble_mean,
      list_of_nc_ensemble_forecast_numbers: list_of_nc_ensemble_forecast_numbers
    }

    {:ok, template, rest}
  end
end
