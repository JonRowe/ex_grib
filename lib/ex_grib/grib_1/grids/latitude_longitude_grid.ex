defmodule ExGrib.Grib1.Grids.LatitudeLongitudeGrid do
  @moduledoc """
  """

  alias ExGrib.Grib1.Data.SignedInteger
  alias ExGrib.Grib1.Grid
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
      latitude_of_first_grid_point: SignedInteger.parse(latitude_of_first_grid_point),
      latitude_of_last_grid_point: SignedInteger.parse(latitude_of_last_grid_point),
      longitude_of_first_grid_point: SignedInteger.parse(longitude_of_first_grid_point),
      longitude_of_last_grid_point: SignedInteger.parse(longitude_of_last_grid_point),
      ni: ni,
      nj: nj,
      resolution_and_component_flags: resolution_and_component_flags,
      scanning_mode: Table8.get(scanning_mode)
    }
  end

  # i is west to east
  # j is south to north
  #
  # with consecutive points i each row and no reversed rows
  # each point is thus consecutive longitude, with each "row"
  # being a single latitude
  #
  # TODO: only works for even grids currently, no stretching

  defimpl Grid do
    def index(grid, latitude, longitude) do
      case grid.scanning_mode do
        %Table8{consecutive_points: :i, i_direction: :positive, j_direction: :positive} ->
          lat_n =
            floor((latitude - grid.latitude_of_first_grid_point) / grid.i_direction_increment)

          lon_n =
            floor((longitude - grid.longitude_of_first_grid_point) / grid.j_direction_increment)

          lat_n * grid.ni + lon_n
      end
    end

    def latitude(%{i_direction_increment: inc, latitude_of_first_grid_point: lat} = grid, index) do
      n =
        case grid.scanning_mode do
          %Table8{consecutive_points: :i, i_direction: :positive, j_direction: :positive} ->
            floor(index / grid.ni)
        end

      # row number n is given by index divided by the number
      # in each row rounded down
      lat + n * inc
    end

    def longitude(%{j_direction_increment: inc, longitude_of_first_grid_point: lon} = grid, index) do
      n =
        case grid.scanning_mode do
          %Table8{consecutive_points: :i, i_direction: :positive, j_direction: :positive} ->
            index - floor(index / grid.ni) * grid.ni
        end

      # position in row is given by the index
      # minus the amount in previous rows, which
      # in turn is row number multiplied by amount in each row
      lon + n * inc
    end
  end
end
