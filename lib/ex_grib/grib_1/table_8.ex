defmodule ExGrib.Grib1.Table8 do
  @moduledoc """
  Scanning mode

  Notes:

  - 1 i direction: west to east along a parallel, or left to right along an X-axis.
  - 2 j direction: south to north along a meridian, or bottom to top along a Y-axis 

  https://apps.ecmwf.int/codes/grib/format/grib1/flag/8/
  """

  @type id :: <<_::3>>
  @typep direction :: :positive | :negative
  @type t :: %__MODULE__{
          i_direction: direction,
          j_direction: direction,
          consecutive_points: :i | :j
        }

  defstruct i_direction: :not_parsed,
            j_direction: :not_parsed,
            consecutive_points: :not_parsed

  @spec get(id()) :: t()
  def get(<<
        i_direction::integer-size(1),
        j_direction::integer-size(1),
        consecutive_points::integer-size(1)
      >>) do
    %__MODULE__{
      i_direction:
        case i_direction do
          0 -> :positive
          1 -> :negative
        end,
      j_direction:
        case j_direction do
          0 -> :negative
          1 -> :positive
        end,
      consecutive_points:
        case consecutive_points do
          0 -> :i
          1 -> :j
        end
    }
  end
end
