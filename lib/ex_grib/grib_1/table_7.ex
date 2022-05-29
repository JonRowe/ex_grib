defmodule ExGrib.Grib1.Table7 do
  @moduledoc """
  Resolution and component flags

  https://apps.ecmwf.int/codes/grib/format/grib1/flag/7/
  """

  @type id :: binary()
  @type t :: %__MODULE__{
          direction_increments: :not_given | :given,
          earth_shape: :spherical | :oblate_spherical,
          vector_direction: :north_and_east | :x_and_y_or_i_and_j
        }

  defstruct direction_increments: :not_parsed,
            earth_shape: :not_parsed,
            vector_direction: :not_parsed

  @spec get(id()) :: t()
  def get(<<
        direction_increments::integer-size(1),
        earth_shape::integer-size(1),
        _reserved::integer-size(2),
        vector_direction::integer-size(1),
        _other::integer-size(3)
      >>) do
    %__MODULE__{
      direction_increments:
        case direction_increments do
          0 -> :not_given
          1 -> :given
        end,
      earth_shape:
        case earth_shape do
          0 -> :spherical
          1 -> :oblate_spherical
        end,
      vector_direction:
        case vector_direction do
          0 -> :north_and_east
          1 -> :x_and_y_or_i_and_j
        end
    }
  end
end
