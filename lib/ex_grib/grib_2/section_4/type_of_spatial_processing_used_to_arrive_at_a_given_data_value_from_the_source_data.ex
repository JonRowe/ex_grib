defmodule ExGrib.Grib2.Section4.TypeOfSpatialProcessingUsedToArriveAtAGivenDataValueFromTheSourceData do
  @moduledoc """
  Table 4.15

  Type of spatial processing used to arrive at a given data value from the source data

  Notes:
  (1) This method assumes that each field really represents box averages/maxima/minima where
    each box extends halfway to its neighboring grid point in each direction to represent
    averages/maxima/minima of values from the source grid with no interpolation.

  (2) Budget interpolation means a low-order interpolation method that quasi-conserves are
    a averages. It would be appropriate for interpolating budget fields such as precipitation.
    This method assumes that ithe field really represents box averages/maxima/minima where
    each box extends halfway to its neighboring grid point in each direction. The method
    actually averages bilinearly interpolated values in a square array of points distributed
    within each output grid box.

  (3) Performs a budget interpolation at the grid point nearest to the nominal grid point.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-15.shtml
  """

  @type id :: integer()
  @type t ::
          :bicubic_interpolation_using_the_grid_point_values_surrounding_the_nominal_grid_point
          | :bilinear_interpolation_using_the_grid_point_values_surrounding_the_nominal_grid_point
          | :budget_interpolation_using_the_grid_point_values_surrounding_the_nominal_grid_point
          | :data_is_calculated_directly_from_the_source_grid_with_no_interpolation
          | :neighbor_budget_interpolation_using_the_grid_point_values_surrounding_the_nominal_grid_point
          | :spectral_interpolation_using_the_grid_point_values_surrounding_the_nominal_grid_point
          | :using_the_value_from_the_source_grid_grid_point_which_is_nearest_to_the_nominal_grid_point
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  # Data is calculated directly from the source grid with no interpolation (see note 1)
  def get(0), do: :data_is_calculated_directly_from_the_source_grid_with_no_interpolation

  # Bilinear interpolation using the 4 source grid grid-point values surrounding the nominal grid-point
  def get(1),
    do: :bilinear_interpolation_using_the_grid_point_values_surrounding_the_nominal_grid_point

  # Bicubic interpolation using the 4 source grid grid-point values surrounding the nominal grid-point
  def get(2),
    do: :bicubic_interpolation_using_the_grid_point_values_surrounding_the_nominal_grid_point

  # Using the value from the source grid grid-point which is nearest to the nominal grid-point
  def get(3),
    do:
      :using_the_value_from_the_source_grid_grid_point_which_is_nearest_to_the_nominal_grid_point

  # Budget interpolation using the 4 source grid grid-point values surrounding the nominal grid-point (see note 2)
  def get(4),
    do: :budget_interpolation_using_the_grid_point_values_surrounding_the_nominal_grid_point

  # Spectral interpolation using the 4 source grid grid-point values surrounding the nominal grid-point
  def get(5),
    do: :spectral_interpolation_using_the_grid_point_values_surrounding_the_nominal_grid_point

  # Neighbor-budget interpolation using the 4 source grid grid-point values surrounding the nominal grid-point (see note 3)
  def get(6),
    do:
      :neighbor_budget_interpolation_using_the_grid_point_values_surrounding_the_nominal_grid_point

  def get(n) when n >= 7 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
