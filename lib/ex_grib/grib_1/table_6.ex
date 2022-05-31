defmodule ExGrib.Grib1.Table6 do
  @moduledoc """
  Data representation type

  https://apps.ecmwf.int/codes/grib/format/grib1/ctable/6/
  """

  alias ExGrib.Grib1.Grids.LatitudeLongitudeGrid

  @type id :: integer()
  @type t ::
          :albers_equal_area_secant_or_tangent_conic_or_bipolar_projection
          | :gaussian_latitude_longitude_grid
          | :gnomonic_projection
          | :lambert_conformal_secant_or_tangent_conic_or_bipolar_projection
          | :latitude_longitude_grid
          | :mercator_projection
          | :millers_cylindrical_projection
          | :oblique_lambert_conformal_secant_or_tangent_conic_or_bipolar_projection
          | :polar_stereographic_projection
          | :reserved
          | :reserved_for_local_use
          | :rotated_gaussian_latitude_longitude_grid
          | :rotated_latitude_longitude_grid
          | :rotated_spherical_harmonic_coefficients
          | :simple_polyconic_projection
          | :space_view_perspective_or_orthographic
          | :spherical_harmonic_coefficients
          | :stretched_and_rotated_gaussian_latitude_longitude_grids
          | :stretched_and_rotated_latitude_longitude_grids
          | :stretched_and_rotated_spherical_harmonic_coefficients
          | :stretched_gaussian_latitude_longitude_grid
          | :stretched_latitude_longitude_grid
          | :stretched_spherical_harmonics
          | :universal_transverse_mercator_projection

  @spec get(id()) :: t()
  def get(0), do: :latitude_longitude_grid
  def get(1), do: :mercator_projection
  def get(2), do: :gnomonic_projection
  def get(3), do: :lambert_conformal_secant_or_tangent_conic_or_bipolar_projection
  def get(4), do: :gaussian_latitude_longitude_grid
  def get(5), do: :polar_stereographic_projection
  def get(6), do: :universal_transverse_mercator_projection
  def get(7), do: :simple_polyconic_projection
  def get(8), do: :albers_equal_area_secant_or_tangent_conic_or_bipolar_projection
  def get(9), do: :millers_cylindrical_projection
  def get(10), do: :rotated_latitude_longitude_grid
  def get(n) when n >= 11 and n <= 12, do: :reserved
  def get(13), do: :oblique_lambert_conformal_secant_or_tangent_conic_or_bipolar_projection
  def get(14), do: :rotated_gaussian_latitude_longitude_grid
  def get(n) when n >= 15 and n <= 19, do: :reserved
  def get(20), do: :stretched_latitude_longitude_grid
  def get(n) when n >= 21 and n <= 23, do: :reserved
  def get(24), do: :stretched_gaussian_latitude_longitude_grid
  def get(n) when n >= 25 and n <= 29, do: :reserved
  def get(30), do: :stretched_and_rotated_latitude_longitude_grids
  def get(n) when n >= 31 and n <= 33, do: :reserved
  def get(34), do: :stretched_and_rotated_gaussian_latitude_longitude_grids
  def get(n) when n >= 35 and n <= 49, do: :reserved
  def get(50), do: :spherical_harmonic_coefficients
  def get(n) when n >= 51 and n <= 59, do: :reserved
  def get(60), do: :rotated_spherical_harmonic_coefficients
  def get(n) when n >= 61 and n <= 69, do: :reserved
  def get(70), do: :stretched_spherical_harmonics
  def get(n) when n >= 71 and n <= 79, do: :reserved
  def get(80), do: :stretched_and_rotated_spherical_harmonic_coefficients
  def get(n) when n >= 81 and n <= 89, do: :reserved
  def get(90), do: :space_view_perspective_or_orthographic
  def get(n) when n >= 91 and n <= 191, do: :reserved
  # See code tables relative to grid definition
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use

  @spec grid(id()) :: module()
  def grid(0), do: LatitudeLongitudeGrid
end
