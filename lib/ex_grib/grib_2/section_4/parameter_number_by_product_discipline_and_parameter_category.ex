defmodule ExGrib.Grib2.Section4.ParameterNumberByProductDisciplineAndParameterCategory do
  @moduledoc """
  Table 4.2

  Parameter number by product discipline and parameter category

  Notes:

  1. By convention, the flux sign is positive if downward.

  2. When a new parameter is to be added to Code table 4.2 and more than one category
    applies, the choice of category should be made base on the intended use of product.
    The discipline and category are an important part of any product definition, so it
    is possible to have the same parameter name in more than one category. For example,
    "Water Temperature" in discipline 10 (Oceanographic Products), category 4
    (sub-surface properties) is used to reporting water temperature in the ocean or open
    sea, and is not the same as "Water temperature" in discipline 1 (Hydrological
    Products), category 2 (Inland water and sediment properties) which is used for
    reporting water temperature in freshwater lakes and rivers.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-2.shtml
  """

  @type id :: integer()
  @type discipline_id :: integer()
  @type t ::
          :aerosols
          | :agricultural_or_aquacultural_special_products
          | :atmospheric_chemical_constituents
          | :ccitt_ia_string
          | :charged_particle_mass_and_number
          | :cloud
          | :cloud_properties
          | :covariance
          | :currents
          | :electric_and_magnetic_fields
          | :electrodynamics
          | :energetic_particles
          | :fire_weather_products
          | :flight_rules_conditions
          | :forecast_radar_imagery
          | :forecast_satellite_imagery_products
          | :glaciers_and_inland_ice_products
          | :hydrology_basic
          | :hydrology_probabilities
          | :ice
          | :image_format_products
          | :imagery
          | :inland_water_and_sediment_properties
          | :ion_neutral_coupling
          | :long_wave_radiation
          | :long_wave_radiation
          | :mass
          | :miscellaneous
          | :moisture
          | :momentum
          | :nuclear
          | :physical_atmospheric_properties
          | :quantitative_products
          | :radar
          | :sea_surface_temperatur
          | :short_wave_radiation
          | :soil_products
          | :solar_electromagnetic_emissions
          | :solar_radiation
          | :sub_surface_properties
          | :surface_properties
          | :temperature
          | :terrestrial_electromagnetic_emissions
          | :thermodynamic_stability_indices
          | :trace_gases
          | :transportation_related_products
          | :vegetation_or_biomass
          | :volcanic_ash
          | :waves
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(discipline_id(), id()) :: t()
  #
  # Product Discipline 0 - Meteorological products
  #
  def get(0, 0), do: :temperature
  def get(0, 1), do: :moisture
  def get(0, 2), do: :momentum
  def get(0, 3), do: :mass
  def get(0, 4), do: :short_wave_radiation
  def get(0, 5), do: :long_wave_radiation
  def get(0, 6), do: :cloud
  def get(0, 7), do: :thermodynamic_stability_indices
  def get(0, 13), do: :aerosols
  # Trace gases (0, e.g. Ozone, CO2)
  def get(0, 14), do: :trace_gases
  def get(0, 15), do: :radar
  #  Forecast Radar Imagery
  def get(0, 16), do: :forecast_radar_imagery
  #  Electrodynamics
  def get(0, 17), do: :electrodynamics
  # Nuclear/radiology
  def get(0, 18), do: :nuclear
  def get(0, 19), do: :physical_atmospheric_properties
  def get(0, 20), do: :atmospheric_chemical_constituents
  def get(0, n) when n >= 21 and n <= 189, do: :reserved
  # CCITT IA5 string
  def get(0, 190), do: :ccitt_ia_string
  def get(0, 191), do: :miscellaneous
  def get(0, n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(0, 192), do: :covariance
  def get(0, 255), do: :missing

  #
  # Product Discipline 1, Hydrologic products
  #
  def get(1, 0), do: :hydrology_basic
  def get(1, 1), do: :hydrology_probabilities
  def get(1, 2), do: :inland_water_and_sediment_properties
  def get(1, n) when n >= 3 and n <= 191, do: :reserved
  def get(1, n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(1, 255), do: :missing

  #
  # Product Discipline 2, Land Surface products
  #
  def get(2, 0), do: :vegetation_or_biomass
  def get(2, 1), do: :agricultural_or_aquacultural_special_products
  def get(2, 2), do: :transportation_related_products
  def get(2, 3), do: :soil_products
  def get(2, 4), do: :fire_weather_products
  def get(2, 5), do: :glaciers_and_inland_ice_products
  def get(2, n) when n >= 6 and n <= 191, do: :reserved
  def get(2, n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(2, 255), do: :missing

  #
  # Product Discipline 3, Space products
  #
  def get(3, 0), do: :image_format_products
  def get(3, 1), do: :quantitative_products
  def get(3, 2), do: :cloud_properties
  def get(3, 3), do: :flight_rules_conditions
  def get(3, 4), do: :volcanic_ash
  def get(3, 5), do: :sea_surface_temperatur
  def get(3, 6), do: :solar_radiation
  def get(3, n) when n >= 7 and n <= 191, do: :reserved
  def get(3, n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(3, 192), do: :forecast_satellite_imagery_products
  def get(3, 255), do: :missing

  #
  # Product Discipline 4, Space Weather products
  # In validation, meaning these are considered draft and subject
  # to change.
  #
  def get(4, 0), do: :temperature
  def get(4, 1), do: :momentum
  def get(4, 2), do: :charged_particle_mass_and_number
  def get(4, 3), do: :electric_and_magnetic_fields
  def get(4, 4), do: :energetic_particles
  def get(4, 5), do: :waves
  def get(4, 6), do: :solar_electromagnetic_emissions
  def get(4, 7), do: :terrestrial_electromagnetic_emissions
  def get(4, 8), do: :imagery
  def get(4, 9), do: :ion_neutral_coupling
  def get(4, n) when n >= 10 and n <= 191, do: :reserved
  def get(4, n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(4, 255), do: :missing

  #
  # Product Discipline 10, Oceanographic products
  #
  def get(10, 0), do: :waves
  def get(10, 1), do: :currents
  def get(10, 2), do: :ice
  def get(10, 3), do: :surface_properties
  def get(10, 4), do: :sub_surface_properties
  def get(10, n) when n >= 5 and n <= 190, do: :reserved
  def get(10, 191), do: :miscellaneous
  def get(10, n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(10, 255), do: :missing
end
