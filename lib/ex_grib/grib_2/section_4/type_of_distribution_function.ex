defmodule ExGrib.Grib2.Section4.TypeOfDistributionFunction do
  @moduledoc """
  Table 4.240

  Type of distribution function

  Notes:

  (1) Bin-Model or delta function with N concentration cl(r) in class (or mode) l.

    Concentration-density function:

      ƒ(r;d) = ∑l=1N cl(r) δ (d-Dl)

    Where:
      N - number of modes in the distribution
      δ - delta-Function
      d - diameter
      Dl - diameter of mode l(p1)i

  (2) Bin-Model or delta function with N concentration cl(r) in class (or mode) l.

    Concentration-density function:

      ƒ(r;m) = ∑l=1N cl(r) δ (m-Ml)

    Where:
      N - number of modes in the distribution
      δ - delta-Function
      m - mass
      Ml - mass of mode (p1)

  (3) N-Modal concentration-density function consisting of Gaussian-functions:

    Concentration-density function:

      ƒ(r;d) = ∑l=1N cl(r) 1/√ 2πδl  * e-((d-Dl)/δl)2

    Where:
      N - number of modes in the distribution
      d - diameter
      Dl - mean diameter of mode l(p1)
      δl - Variance of Mode l ((p2)

    with N fields of concentration cl(r)

  (4) N-Modal concentration-density function consisting of Gaussian-functions:

    Concentration-density function:

      ƒ(r;d) = ∑l=1Ncl(r)1/√ 2πδl(r)  * e-((d-Dl)(r)/δl(r))2

    Where:
      N - fields of concentration cl(r)
      δl(r) - Variance
      Dl(r) - mean diameter

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-240.shtml
  """

  @type id :: integer()
  @type t ::
          :delta_functions_with_spatially_variable_concentration_and_fixed_diameters_dl
          | :delta_functions_with_spatially_variable_concentration_and_fixed_masses_ml
          | :gaussian_and_variance
          | :gaussian_dl
          | :log_normal_distribution_with_spatially_variable_number_density_and_fixed_variance
          | :log_normal_distribution_with_spatially_variable_number_density_and_mass_density_and_fixed_variance
          | :log_normal_distribution_with_spatially_variable_number_density_and_variance
          | :no_distribution_function_by_type_of_distribution_function_of_type_no_fixed_particle_density
          | :no_specific_distribution_function_given
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :no_specific_distribution_function_given

  # Delta functions with spatially variable concentration and fixed diameters Dl(p1) in meter (See Note 1)
  def get(1), do: :delta_functions_with_spatially_variable_concentration_and_fixed_diameters_dl

  # Delta functions with spatially variable concentration and fixed masses Ml(p1) in kg (See Note 2)
  def get(2), do: :delta_functions_with_spatially_variable_concentration_and_fixed_masses_ml

  # Gaussian (Normal) distribution with spatially variable concentration and fixed mean diameter Dl(p1) and variance δ (p2) (See Note 3)
  def get(3), do: :gaussian_dl

  # Gaussian (Normal) distribution with spatially variable concentration, mean diameter and variance (See Note 4)
  def get(4), do: :gaussian_and_variance

  # Log-normal distribution with spatially variable number density, mean diameter and variance (See Note 5)
  def get(5), do: :log_normal_distribution_with_spatially_variable_number_density_and_variance

  # Log-normal distribution with spatially variable number density, mean diameter and fixed variance δ (p1) (See Note 6)
  def get(6),
    do: :log_normal_distribution_with_spatially_variable_number_density_and_fixed_variance

  # Log-normal distribution with spatially variable number density and mass density and fixed variance δ and fixed particle density ρ (p2) (See Note 7)
  def get(7),
    do:
      :log_normal_distribution_with_spatially_variable_number_density_and_mass_density_and_fixed_variance

  # No distribution function. The encoded variable is derived from variables characterized by type of distribution function of type No. 7 (see above) with fixed variance σ (p1) and fixed particle density ρ (p2)
  def get(8),
    do:
      :no_distribution_function_by_type_of_distribution_function_of_type_no_fixed_particle_density

  def get(n) when n >= 9 and n <= 49151, do: :reserved
  def get(n) when n >= 49152 and n <= 65534, do: :reserved_for_local_use
  def get(65535), do: :missing
end
