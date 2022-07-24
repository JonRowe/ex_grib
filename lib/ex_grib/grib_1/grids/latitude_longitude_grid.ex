defmodule ExGrib.Grib1.Grids.LatitudeLongitudeGrid do
  @moduledoc """
  """

  alias ExGrib.Grib1.Table8

  defstruct i_direction_increment: :not_parsed,
            j_direction_increment: :not_parsed,
            latitude_of_first_grid_point: :not_parsed,
            latitude_of_last_grid_point: :not_parsed,
            longitude_of_first_grid_point: :not_parsed,
            longitude_of_last_grid_point: :not_parsed,
            ni: :not_parsed,
            nj: :not_parsed,
            resolution_and_component_flags: :not_parsed,
            scanning_mode: :not_parsed

  def parse(<<
        # Ni number of points along a parallel
        ni::unsigned-size(16),
        # Nj number of points along a meridian
        nj::unsigned-size(16),
        # La1 latitude of first grid point
        latitude_of_first_grid_point::binary-size(3),
        # Lo1 longitude of first grid point
        longitude_of_first_grid_point::binary-size(3),
        # Resolution and component flags (see Code table 7)
        resolution_and_component_flags::integer(),
        # La2 latitude of last grid point
        latitude_of_last_grid_point::binary-size(3),
        # Lo2 longitude of last grid point
        longitude_of_last_grid_point::binary-size(3),
        # Di i direction increment
        i_direction_increment::unsigned-size(16),
        # Dj j direction increment
        j_direction_increment::unsigned-size(16),
        # Scanning mode (flags see Flag/Code table 8)
        scanning_mode::binary-size(3)-unit(1),
        _more_scanning_mode::binary-size(5)-unit(1),
        0,
        0,
        0,
        0
      >>) do
    %__MODULE__{
      i_direction_increment: i_direction_increment,
      j_direction_increment: j_direction_increment,
      latitude_of_first_grid_point: coord(latitude_of_first_grid_point),
      latitude_of_last_grid_point: coord(latitude_of_last_grid_point),
      longitude_of_first_grid_point: coord(longitude_of_first_grid_point),
      longitude_of_last_grid_point: coord(longitude_of_last_grid_point),
      ni: ni,
      nj: nj,
      resolution_and_component_flags: resolution_and_component_flags,
      scanning_mode: Table8.get(scanning_mode)
    }
  end

  defp coord(<<0::size(1)-unit(1), value_in_milli_degrees::integer-size(23)-unit(1)>>) do
    value_in_milli_degrees
  end

  defp coord(<<1::size(1)-unit(1), value_in_milli_degrees::integer-size(23)-unit(1)>>) do
    -1 * value_in_milli_degrees
  end
end
