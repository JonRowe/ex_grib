defmodule ExGrib.Grib2.Section4.Templates.IndividualEnsembleForecastControlAndPerturbedIntervalForSpatioTemporalChangingTileParameters do
  @moduledoc """
  Template 4.56

  Individual ensemble forecast control and perturbed interval for spatio temporal changing tile parametersa point in time interval for spatio-temporal changing tile parameters

  Notes:

  (1)   NUT is the number of used different spatial tiles,
  defining the cover structure of point. As each of these tiles has one or more different tile
  attributesA(NAT(ITN)), where (ITN=1,...,NUT), for example, (unmodified, snow-covered,...), there are
  NT=∑ITN=1NUT NAT(ITN) fields (that is, the total number of tile
  attribute pairs, defined in (octet 13) with indices (ITN,IAN) with the following meaning (IAN={1,...,ITN)}):
      1,1                
                    
  First tile - first attribute (e.g. unmodified) attribute
      ...                
            ...
      1,NAT(1)               
           First tile - NAT of first tile (last, e.g. snow-covered) attribute
      2,1                 
                    Second
  tile - first attribute (e.g. unmodified)
      ...                
           ...
      2,NAT(2)               
           Second tile - NAT of second tile (last, e.g. snow-covered) attribute
      ...                
           ...
      ...                
           ...
      NUT,1                
              NUT tile - first attribute (e.g. unmodified)
      ...                
           ...
      NUT,NAT(NUT)          NUT tile - NAT of
  last attribute (last) attribute

  A single tile attribute index (ITN,IAN) with spatial tile index ITN(1,...,NUT) and attribute A(IAN) with
  (IAN=1,...,NAT(ITN)) is represented in the template. All NT partitions are linked by the normalization formula, which
  states that the sum of all partions must be equal to normalization term (N=1 for fractions and N = 100 for percentage)
  on each point of the grid.

  The fields "tile class" and "tile fraction" must be provided in order to obtain the tile structure of each grid point.
  Please note that the field "tile fraction" is time-dependent in the case of defined attribute, whereas the field
  "tile class" is not affected by attribute (NT=NUT).

  (2)   For more informtion, see Part B, GRIB Attachment IV.


  (3)   Hours greater than 65534 will be coded as 65534.

  WARNING THIS TEMPLATE WAS AUTOGENERATED AND IS LIKELY INCOMPLETE

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp4-56.shtml
  """

  defstruct parameter_category: nil,
            parameter_number: nil,
            tile_classification: nil,
            total_number: nil,
            number_of_used_spatial_tiles: nil,
            tile_index: nil,
            number_of_used_tile_attributes: nil,
            attribute_of_tile: nil,
            type_of_generating_process: nil,
            background_generating_process_identifier: nil,
            analysis_or_forecast_generating_process_identifier: nil,
            hours_of_observational_data_cutoff_after_reference_time: nil,
            minutes_of_observational_data_cutoff_after_reference_time: nil,
            indicator_of_unit_of_time_range: nil,
            forecast_time_in_units_defined_by_octet: nil,
            type_of_first_fixed_surface: nil,
            scale_factor_of_first_fixed_surface: nil,
            scaled_value_of_first_fixed_surface: nil,
            type_of_second_fixed_surfaced: nil,
            scale_factor_of_second_fixed_surface: nil,
            scaled_value_of_second_fixed_surfaces: nil,
            perturbation_number: nil,
            number_of_forecasts_in_ensemble: nil

  @spec get(binary()) :: no_return
  def get(<<
        # Parameter category (see Code table 4.1)
        parameter_category::integer(),
        # Parameter number (see Code table 4.2)
        parameter_number::integer(),
        # Tile Classification (see Code table 4.242)
        tile_classification::integer(),
        # Total number (NT) of tile attribute pairs (See Notes 1 and 2)
        total_number::integer(),
        # Number of used spatial tiles (NUT) (See Notes 1 and 2)
        number_of_used_spatial_tiles::integer(),
        # Tile index (ITN={1 ... NUT}) (See Note 1)
        tile_index::integer(),
        # Number of used tile attributes (NAT) for tile ITN (See Note 1)
        number_of_used_tile_attributes::integer(),
        # Attribute of tile (see Code table 4.241) (A={A(1) ... A(NAT(ITN))}) (See Note 1)
        attribute_of_tile::integer(),
        # Type of generating process (see Code table 4.3)
        type_of_generating_process::integer(),
        # Background generating process identifier (defined by originating centre)
        background_generating_process_identifier::integer(),
        # Analysis or forecast generating process identifier (see Code ON388 Table A)
        analysis_or_forecast_generating_process_identifier::integer(),
        # Hours of observational data cutoff after reference time (see Note 3)
        hours_of_observational_data_cutoff_after_reference_time::integer-size(16),
        minutes_of_observational_data_cutoff_after_reference_time::integer(),
        # Indicator of unit of time range (see Code table 4.4)
        indicator_of_unit_of_time_range::integer(),
        # Forecast time in units defined by octet 24
        forecast_time_in_units_defined_by_octet::integer-size(32),
        # Type of first fixed surface (see Code table 4.5)
        type_of_first_fixed_surface::integer(),
        scale_factor_of_first_fixed_surface::integer(),
        scaled_value_of_first_fixed_surface::integer-size(32),
        # Type of second fixed surfaced (see Code table 4.5)
        type_of_second_fixed_surfaced::integer(),
        scale_factor_of_second_fixed_surface::integer(),
        scaled_value_of_second_fixed_surfaces::integer-size(32),
        perturbation_number::integer(),
        number_of_forecasts_in_ensemble::integer(),
        rest::binary()
      >>) do
    template = %__MODULE__{
      parameter_category: parameter_category,
      parameter_number: parameter_number,
      tile_classification: tile_classification,
      total_number: total_number,
      number_of_used_spatial_tiles: number_of_used_spatial_tiles,
      tile_index: tile_index,
      number_of_used_tile_attributes: number_of_used_tile_attributes,
      attribute_of_tile: attribute_of_tile,
      type_of_generating_process: type_of_generating_process,
      background_generating_process_identifier: background_generating_process_identifier,
      analysis_or_forecast_generating_process_identifier:
        analysis_or_forecast_generating_process_identifier,
      hours_of_observational_data_cutoff_after_reference_time:
        hours_of_observational_data_cutoff_after_reference_time,
      minutes_of_observational_data_cutoff_after_reference_time:
        minutes_of_observational_data_cutoff_after_reference_time,
      indicator_of_unit_of_time_range: indicator_of_unit_of_time_range,
      forecast_time_in_units_defined_by_octet: forecast_time_in_units_defined_by_octet,
      type_of_first_fixed_surface: type_of_first_fixed_surface,
      scale_factor_of_first_fixed_surface: scale_factor_of_first_fixed_surface,
      scaled_value_of_first_fixed_surface: scaled_value_of_first_fixed_surface,
      type_of_second_fixed_surfaced: type_of_second_fixed_surfaced,
      scale_factor_of_second_fixed_surface: scale_factor_of_second_fixed_surface,
      scaled_value_of_second_fixed_surfaces: scaled_value_of_second_fixed_surfaces,
      perturbation_number: perturbation_number,
      number_of_forecasts_in_ensemble: number_of_forecasts_in_ensemble
    }

    {:ok, template, rest}
  end
end
