defmodule ExGrib.Grib2.Section4.ParameterCategoryByProductDiscipline do
  @moduledoc """
  Table 4.1

  Parameter category by product discipline.

  In Section 4, Octet 10

  Note: The disciplines are given in Section 0, Octet 7 of the GRIB2 message and are defined in Table 0.0.

  When a new category is to be added to Code table 4.1 and more than one discipline applies,
  the choice of discipline should be made based on the intended use of product.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-1.shtml
  """

  @type id :: integer()
  @type discipline_id :: integer()
  @type t ::
          :aerosols
          | :agricultural_or_aquacultural_special_products
          | :atmospheric_chemical_constituents
          | :ccitt_ia5_string
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
          | :forecast_satellite_imagery
          | :hydrology_basic_products
          | :hydrology_probabilities
          | :ice
          | :image_format_products
          | :imagery
          | :inland_water_and_sediment_properties
          | :ion_neutral_coupling
          | :kinematic_stability_indicies
          | :land_surface_products
          | :long_wave_radiation
          | :mass
          | :mass_probabilities
          | :miscellaneous
          | :moisture
          | :moisture_probabilities
          | :momentum
          | :momentum_probabilities
          | :nuclear_or_radiology
          | :physical_atmospheric_properties
          | :quantitative_products
          | :radar
          | :sea_surface_temperature
          | :short_wave_radiation
          | :soil_products
          | :solar_electromagnetic_emissions
          | :solar_radiation
          | :sub_surface_properties
          | :surface_properties
          | :temperature
          | :temperature_probabilities
          | :terrestrial_electromagnetic_emissions
          | :thermodynamic_stability_indicies
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
  # Product Discipline 0 - Meteorological Products
  #
  # Temperature (see Table 4.2-0-0)
  def get(0, 0), do: :temperature
  # Moisture (see Table 4.2-0-1)
  def get(0, 1), do: :moisture
  # Momentum (see Table 4.2-0-2)
  def get(0, 2), do: :momentum
  # Mass (see Table 4.2-0-3)
  def get(0, 3), do: :mass
  # Short-wave radiation (see Table 4.2-0-4)
  def get(0, 4), do: :short_wave_radiation
  # Long-wave radiation (see Table 4.2-0-5)
  def get(0, 5), do: :long_wave_radiation
  # Cloud (see Table 4.2-0-6)
  def get(0, 6), do: :cloud
  # Thermodynamic Stability indicies (see Table 4.2-0-7)
  def get(0, 7), do: :thermodynamic_stability_indicies
  def get(0, 8), do: :kinematic_stability_indicies
  # Temperature Probabilities (deprecated)
  def get(0, 9), do: :temperature_probabilities
  # Moisture Probabilities (deprecated)
  def get(0, 10), do: :moisture_probabilities
  # Momentum Probabilities (deprecated)
  def get(0, 11), do: :momentum_probabilities
  # Mass Probabilities (deprecated)
  def get(0, 12), do: :mass_probabilities
  # Aerosols (see Table 4.2-0-13)
  def get(0, 13), do: :aerosols
  # Trace gases (e.g. Ozone, CO2) (see Table 4.2-0-14)
  def get(0, 14), do: :trace_gases
  # Radar (see Table 4.2-0-15)
  def get(0, 15), do: :radar
  # Forecast Radar Imagery (see Table 4.2-0-16)
  def get(0, 16), do: :forecast_radar_imagery
  # Electrodynamics (see Table 4.2-0-17)
  def get(0, 17), do: :electrodynamics
  # Nuclear/radiology (see Table 4.2-0-18)
  def get(0, 18), do: :nuclear_or_radiology
  # Physical atmospheric properties (see Table 4.2-0-19)
  def get(0, 19), do: :physical_atmospheric_properties
  # Atmospheric chemical Constituents (see Table 4.2-0-20)
  def get(0, 20), do: :atmospheric_chemical_constituents
  def get(0, n) when n >= 21 and n <= 189, do: :reserved
  # CCITT IA5 string (see Table 4.2-0-190)
  def get(0, 190), do: :ccitt_ia5_string
  # Miscellaneous (see Table 4.2-0-191)
  def get(0, 191), do: :miscellaneous
  def get(0, n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  # Covariance (see Table 4.2-0-192)
  def get(0, 192), do: :covariance
  def get(0, 255), do: :missing

  #
  # Product Discipline 1 - Hydrological Products
  #
  # Hydrology basic products (see Table 4.2-1-0)
  def get(1, 0), do: :hydrology_basic_products
  # Hydrology probabilities (see Table 4.2-1-1)
  def get(1, 1), do: :hydrology_probabilities
  # Inland water and sediment properties (see Table 4.2-1-2)
  def get(1, 2), do: :inland_water_and_sediment_properties
  def get(1, n) when n >= 3 and n <= 191, do: :reserved
  def get(1, n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(1, 255), do: :missing

  #
  # Product Discipline 2 - Land Surface Products
  #
  # Vegetation/Biomass (see Table 4.2-2-0)
  def get(2, 0), do: :vegetation_or_biomass
  # Agricultural/Aquacultural Special Products (see Table 4.2-2-1)
  def get(2, 1), do: :agricultural_or_aquacultural_special_products
  def get(2, 2), do: :transportation_related_products
  # Soil Products (see Table 4.2-2-3)
  def get(2, 3), do: :soil_products
  # Fire Weather Products (see Table 4.2-2-4)
  def get(2, 4), do: :fire_weather_products
  # Land Surface Products (see Table 4.2-2-5)
  def get(2, 5), do: :land_surface_products
  def get(2, n) when n >= 6 and n <= 191, do: :reserved
  def get(2, n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(2, 255), do: :missing

  # Product Discipline 3 - Satellite Remote Sensing Products (formerly "Space Products")
  #
  # Notes:
  #
  # 1. Data are numeric without units, although they might be given quantitative meaning
  #   through a code table defined external to this document.  The emphasis is on a displayable "picture" of some phenomenon, perhaps with certain enhanced features.  Generally, each datum is an unsigned, one octet integer, but some images format products might have another datum size.  The size of the datum is indicated in Section 5 of the GRIB2 message.
  #
  # 2. Data are in specified physical units.
  #
  # Image format products (See note 1) (see Table 4.2-3-0)
  def get(3, 0), do: :image_format_products
  # Quantitative products (See note 2) (see Table 4.2-3-1)
  def get(3, 1), do: :quantitative_products
  # Cloud Properties (see Table 4.2-3-2)
  def get(3, 2), do: :cloud_properties
  # Flight Rules Conditions (see Table 4.2-3-3)
  def get(3, 3), do: :flight_rules_conditions
  # Volcanic Ash (see Table 4.2-3-4)
  def get(3, 4), do: :volcanic_ash
  # Sea-surface Temperature (see Table 4.2-3-5)
  def get(3, 5), do: :sea_surface_temperature
  # Solar Radiation (see Table 4.2-3-6)
  def get(3, 6), do: :solar_radiation
  def get(3, n) when n >= 7 and n <= 191, do: :reserved
  def get(3, n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  # Forecast Satellite Imagery (See note 2) (see Table 4.2-3-192)
  def get(3, 192), do: :forecast_satellite_imagery
  def get(3, 255), do: :missing

  #
  # Product Discipline 4 - Space Weather Products (In validation, meaning this is a draft and may be changed)
  #
  # Temperature (see Table 4.2-4-0)
  def get(4, 0), do: :temperature
  # Momentum (see Table 4.2-4-1)
  def get(4, 1), do: :momentum
  # Charged Particle Mass and Number (see Table 4.2-4-2)
  def get(4, 2), do: :charged_particle_mass_and_number
  # Electric and Magnetic Fields (see Table 4.2-4-3)
  def get(4, 3), do: :electric_and_magnetic_fields
  # Energetic Particles (see Table 4.2-4-4)
  def get(4, 4), do: :energetic_particles
  # Waves (see Table 4.2-4-5)
  def get(4, 5), do: :waves
  # Solar Electromagnetic Emissions (see Table 4.2-4-6)
  def get(4, 6), do: :solar_electromagnetic_emissions
  # Terrestrial Electromagnetic Emissions (see Table 4.2-4-7)
  def get(4, 7), do: :terrestrial_electromagnetic_emissions
  # Imagery (see Table 4.2-4-8)
  def get(4, 8), do: :imagery
  # Ion-Neutral Coupling (see Table 4.2-4-9)
  def get(4, 9), do: :ion_neutral_coupling
  def get(4, n) when n >= 10 and n <= 191, do: :reserved
  def get(4, n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(4, 255), do: :missing

  #
  # Product Discipline 10 - Oceanographic Products
  #
  # Waves (see Table 4.2-10-0)
  def get(10, 0), do: :waves
  # Currents (see Table 4.2-10-1)
  def get(10, 1), do: :currents
  # Ice (see Table 4.2-10-2)
  def get(10, 2), do: :ice
  # Surface Properties (see Table 4.2-10-3)
  def get(10, 3), do: :surface_properties
  # Sub-surface Properties (see Table 4.2-10-4)
  def get(10, 4), do: :sub_surface_properties
  def get(10, n) when n >= 5 and n <= 190, do: :reserved
  # Miscellaneous (see Table 4.2-10-191)
  def get(10, 191), do: :miscellaneous
  def get(10, n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(10, 255), do: :missing
end
