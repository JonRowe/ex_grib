defmodule ExGrib.Grib2.Section3.Templates.LatitudeLongitude do
  @moduledoc """
  Template 3.0

  Latitude/Longitude (or equidistant cylindrical, or Plate Carree)

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp3-0.shtml
  """

  alias ExGrib.Grib2.Section3.ScanningMode
  alias ExGrib.Grib2.Section3.ShapeOfReferenceSystem, as: ShapeOfTheEarth

  defstruct shape_of_the_earth: nil,
            radius_scale_factor: nil,
            radius_scale_value: nil,
            major_axis_scale_factor: nil,
            major_axis_scale_value: nil,
            minor_axis_scale_factor: nil,
            minor_axis_scale_value: nil,
            n_i: nil,
            n_j: nil,
            basic_angle: nil,
            basic_angle_subdivisions: nil,
            first_point_latitude: nil,
            first_point_longitude: nil,
            resolution_and_component_flag: nil,
            last_point_latitude: nil,
            last_point_longitude: nil,
            d_i: nil,
            d_j: nil,
            scanning_mode: nil

  @type input :: binary()
  @type t() :: {:ok, %__MODULE__{}, binary()} | :error

  @spec get(input()) :: t()
  def get(<<
        # 15 - Shape of the Earth (See Code Table 3.2)
        shape_of_the_earth::integer(),
        # 16 - Scale Factor of radius of spherical Earth
        radius_scale_factor::integer(),
        # 17-20 Scale value of radius of spherical Earth
        radius_scale_value::integer-size(32),
        # 21 Scale factor of major axis of oblate spheroid Earth
        major_axis_scale_factor::integer(),
        # 22-25 Scaled value of major axis of oblate spheroid Earth
        major_axis_scale_value::integer-size(32),
        # 26 Scale factor of minor axis of oblate spheroid Earth
        minor_axis_scale_factor::integer(),
        # 27-30 Scaled value of minor axis of oblate spheroid Earth
        minor_axis_scale_value::integer-size(32),
        # 31-34 Ni — number of points along a parallel
        n_i::integer-size(32),
        # 35-38 Nj — number of points along a meridian
        n_j::integer-size(32),
        # 39-42 Basic angle of the initial production domain (see Note 1)
        basic_angle::integer-size(32),
        # 43-46 Subdivisions of basic angle used to define extreme longitudes and latitudes, and direction increments (see Note 1)
        basic_angle_subdivisions::integer-size(32),
        # 47-50 La1 — latitude of first grid point (see Note 1)
        first_point_latitude::integer-size(32),
        # 51-54 Lo1 — longitude of first grid point (see Note 1)
        first_point_longitude::integer-size(32),
        # 55 Resolution and component flags (see Flag Table 3.3)
        resolution_and_component_flag::integer(),
        # 56-59 La2 — latitude of last grid point (see Note 1)
        last_point_latitude::integer-size(32),
        # 60-63 Lo2 — longitude of last grid point (see Note 1)
        last_point_longitude::integer-size(32),
        # 64-67 Di — i direction increment (see Notes 1 and 5)
        d_i::integer-size(32),
        # 68-71 Dj — j direction increment (see Note 1 and 5)
        d_j::integer-size(32),
        # 72 Scanning mode (flags — see Flag Table 3.4 and Note 6)
        scanning_mode::integer(),
        # 73-nn List of number of points along each meridian or parallel (These octets are only present for quasi-regular grids as described in notes 2 and 3)
        rest::binary()
      >>) do
    template = %__MODULE__{
      shape_of_the_earth: ShapeOfTheEarth.get(shape_of_the_earth),
      radius_scale_factor: radius_scale_factor,
      radius_scale_value: radius_scale_value,
      major_axis_scale_factor: major_axis_scale_factor,
      major_axis_scale_value: major_axis_scale_value,
      minor_axis_scale_factor: minor_axis_scale_factor,
      minor_axis_scale_value: minor_axis_scale_value,
      n_i: n_i,
      n_j: n_j,
      basic_angle: basic_angle,
      basic_angle_subdivisions: basic_angle_subdivisions,
      first_point_latitude: first_point_latitude,
      first_point_longitude: first_point_longitude,
      resolution_and_component_flag: resolution_and_component_flag,
      last_point_latitude: last_point_latitude,
      last_point_longitude: last_point_longitude,
      d_i: d_i,
      d_j: d_j,
      scanning_mode: ScanningMode.get(scanning_mode)
    }

    {:ok, template, rest}
  end

  def get(_), do: :error
end
