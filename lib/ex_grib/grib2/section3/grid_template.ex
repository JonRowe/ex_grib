defmodule ExGrib.Grib2.Section3.GridTemplate do
  @moduledoc """
  Table 3.1

  Returns the grib template to use based on the grib template number.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-1.shtml
  """

  @type id :: integer()
  @type t ::
          :latitude_longitude
          | :rotated_latitude_longitude
          | :stretched_latitude_longitude
          | :rotated_and_stretched_latitude_longitude
          | :variable_resolution_latitude_longitude
          | :variable_resolution_rotated_latitude_longitude
          | :mercator
          | :transverse_mercator
          | :mercator_with_modelling_subdomains_definition
          | :polar_stereographic_projection
          | :polar_stereographic_with_modelling_subdomains_definition
          | :lambert_conformal
          | :albers_equal_area
          | :lambert_conformal_with_modelling_subdomains_definition
          | :gaussian_latitude_longitude
          | :rotated_gaussian_latitude_longitude
          | :stretched_gaussian_latitude_longitude
          | :rotated_and_stretched_gaussian_latitude_longitude
          | :spherical_harmonic_coefficients
          | :rotated_spherical_harmonic_coefficients
          | :stretched_spherical_harmonic_coefficients
          | :rotated_and_stretched_spherical_harmonic_coefficients
          | :cubed_sphere_gnomonic
          | :spectral_mercator_with_modelling_subdomains_definition
          | :spectral_polar_stereographic_with_modelling_subdomains_definition
          | :spectral_lambert_conformal_with_modelling_subdomains_definition
          | :space_view_perspective_or_orthographic
          | :triangular_grid_based_on_an_icosahedron
          | :general_unstructured_grid
          | :equatorial_azimuthal_equidistant_projection
          | :azimuth_range_projection
          | :lambert_azimuthal_equal_area_projection
          | :curvilinear_orthogonal_grids
          | :cross_section_grid_with_points_equally_spaced_on_the_horizontal
          | :hovmoller_diagram_with_points_equally_spaced_on_the_horizontal
          | :time_section_grid
          | :rotated_latitude_longitude
          | :rotated_latitude_longitude
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  # See Template 3.0. Also called Equidistant Cylindrical or Plate Caree.
  def get(0), do: :latitude_longitude
  # See Template 3.1.
  def get(1), do: :rotated_latitude_longitude
  # See Template 3.2.
  def get(2), do: :stretched_latitude_longitude
  # See Template 3.3.
  def get(3), do: :rotated_and_stretched_latitude_longitude
  # See Template 3.4.
  def get(4), do: :variable_resolution_latitude_longitude
  # See Template 3.5.
  def get(5), do: :variable_resolution_rotated_latitude_longitude
  def get(n) when n >= 6 and n <= 9, do: :reserved
  # See Template 3.10.
  def get(10), do: :mercator
  def get(11), do: :reserved
  # See Template 3.12.
  def get(12), do: :transverse_mercator
  # See Template 3.13.
  def get(13), do: :mercator_with_modelling_subdomains_definition
  def get(n) when n >= 14 and n <= 19, do: :reserved
  # See Template 3.20. Can be North or South.
  def get(20), do: :polar_stereographic_projection
  def get(n) when n >= 21 and n <= 22, do: :reserved
  # See Template 3.23.
  def get(23), do: :polar_stereographic_with_modelling_subdomains_definition
  def get(n) when n >= 24 and n <= 29, do: :reserved
  # See Template 3.30. Can be Secant, Tangent, Conical, or Bipolar.
  def get(30), do: :lambert_conformal
  # See Template 3.31.
  def get(31), do: :albers_equal_area
  def get(32), do: :reserved
  # See Template 3.33.
  def get(33), do: :lambert_conformal_with_modelling_subdomains_definition
  def get(n) when n >= 34 and n <= 39, do: :reserved
  # See Template 3.40.
  def get(40), do: :gaussian_latitude_longitude
  # See Template 3.41.
  def get(41), do: :rotated_gaussian_latitude_longitude
  # See Template 3.42.
  def get(42), do: :stretched_gaussian_latitude_longitude
  # See Template 3.43.
  def get(43), do: :rotated_and_stretched_gaussian_latitude_longitude
  def get(n) when n >= 44 and n <= 49, do: :reserved
  # See Template 3.50.
  def get(50), do: :spherical_harmonic_coefficients
  # See Template 3.51.
  def get(51), do: :rotated_spherical_harmonic_coefficients
  # See Template 3.52.
  def get(52), do: :stretched_spherical_harmonic_coefficients
  # See Template 3.53.
  def get(53), do: :rotated_and_stretched_spherical_harmonic_coefficients
  def get(n) when n >= 54 and n <= 59, do: :reserved
  # See Template 3.60.
  def get(60), do: :cubed_sphere_gnomonic
  # See Template 3.61.
  def get(61), do: :spectral_mercator_with_modelling_subdomains_definition
  # See Template 3.62.
  def get(62), do: :spectral_polar_stereographic_with_modelling_subdomains_definition
  # See Template 3.63.
  def get(63), do: :spectral_lambert_conformal_with_modelling_subdomains_definition
  def get(n) when n >= 64 and n <= 89, do: :reserved
  # See Template 3.90.
  def get(90), do: :space_view_perspective_or_orthographic
  def get(n) when n >= 91 and n <= 99, do: :reserved
  # See Template 3.100.
  def get(100), do: :triangular_grid_based_on_an_icosahedron
  # see Template 3.101.
  def get(101), do: :general_unstructured_grid
  def get(n) when n >= 102 and n <= 109, do: :reserved
  # See Template 3.110.
  def get(110), do: :equatorial_azimuthal_equidistant_projection
  def get(n) when n >= 111 and n <= 119, do: :reserved
  # See Template 3.120.
  def get(120), do: :azimuth_range_projection
  def get(n) when n >= 121 and n <= 139, do: :reserved
  # See Template 3.140.
  def get(140), do: :lambert_azimuthal_equal_area_projection
  def get(n) when n >= 141 and n <= 203, do: :reserved
  # See Template 3.204.
  def get(204), do: :curvilinear_orthogonal_grids
  def get(n) when n >= 205 and n <= 999, do: :reserved
  # See Template 3.1000.
  def get(1000), do: :cross_section_grid_with_points_equally_spaced_on_the_horizontal
  def get(n) when n >= 1001 and n <= 1099, do: :reserved
  # See Template 3.1100.
  def get(1100), do: :hovmoller_diagram_with_points_equally_spaced_on_the_horizontal
  def get(n) when n >= 1101 and n <= 1199, do: :reserved
  # See Template 3.1200.
  def get(1200), do: :time_section_grid
  def get(n) when n >= 1201 and n <= 32767, do: :reserved
  def get(n) when n >= 32768 and n <= 65534, do: :reserved_for_local_use
  # See Template 3.32768. Arakawa Staggered E-Grid.
  def get(32768), do: :rotated_latitude_longitude
  # See Template 3.32769. Arakawa Non-E Staggered Grid.
  def get(32769), do: :rotated_latitude_longitude
  def get(65535), do: :missing
end
