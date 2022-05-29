defmodule ExGrib.Grib1.Table11 do
  @moduledoc """
  Flag.

  Notes:

  1 - Bit 4 shall be set to 1 to indicate that bits 5 to 12 are contained in
      octet 14 of the Binary data section.

  2 - Bit 3 shall be set to 1 to indicate that the data represented are
      integer values; where integer values are Latitude and longitude are
      represented, any reference values, if not zero, should be rounded to
      integer before being applied.

  3 - Where secondary bit-maps are present in the data (used in association
      with second-order packing and, optionally, with a matrix of values at
      each point), this shall be indicated by setting bit 7 to 1.

  4 - The indicated meaning of bit 6 shall be retained in anticipation of
      the future reintroduction of a system to define a matrix of values
      at each grid point. 

  https://apps.ecmwf.int/codes/grib/format/grib1/flag/11/
  """

  @type id :: <<_::4>>
  @type additional_id :: <<_::8>>
  @type t :: %__MODULE__{
          additional_flags_at_section_4_octect_14: boolean(),
          grid_or_sphere: :grid | :spherical_harmonics,
          int_or_float: :float | :integer,
          simple_or_complex: :simple | :complex
        }

  @type additional :: %__MODULE__{
          additional_flags_at_section_4_octect_14: true,
          grid_or_sphere: :grid | :spherical_harmonics,
          int_or_float: :float | :integer,
          second_order_value_width: :constant | :different | :in_data,
          secondary_bit_maps: boolean() | :in_data,
          simple_or_complex: :simple | :complex,
          single_or_matrix: :single | :matrix | :in_data
        }

  defstruct additional_flags_at_section_4_octect_14: :not_parsed,
            grid_or_sphere: :not_parsed,
            int_or_float: :not_parsed,
            second_order_value_width: :not_parsed,
            secondary_bit_maps: :not_parsed,
            simple_or_complex: :not_parsed,
            single_or_matrix: :not_parsed

  @spec get(id()) :: t()
  def get(<<
        grid_or_sphere::integer-size(1),
        simple_or_complex::integer-size(1),
        int_or_float::integer-size(1),
        additional_flags_at_section_4_octect_14::integer-size(1)
      >>) do
    %__MODULE__{
      additional_flags_at_section_4_octect_14:
        case additional_flags_at_section_4_octect_14 do
          0 -> false
          1 -> true
        end,
      grid_or_sphere:
        case grid_or_sphere do
          0 -> :grid
          1 -> :spherical_harmonics
        end,
      simple_or_complex:
        case simple_or_complex do
          0 -> :simple
          1 -> :complex
        end,
      int_or_float:
        case int_or_float do
          0 -> :float
          1 -> :integer
        end
    }
  end

  @spec get_additional(t(), additional_id()) :: additional()
  def get_additional(
        %__MODULE__{} = flags,
        <<
          # reserved
          0::size(1),
          single_or_matrix::integer-size(1),
          secondary_bit_maps::integer-size(1),
          second_order_value_width::integer-size(1),
          _reserved::bitstring-size(4)
        >>
      ) do
    %__MODULE__{
      flags
      | single_or_matrix:
          case single_or_matrix do
            0 -> :single
            1 -> :matrix
          end,
        secondary_bit_maps:
          case secondary_bit_maps do
            0 -> false
            1 -> true
          end,
        second_order_value_width:
          case second_order_value_width do
            0 -> :constant
            1 -> :different
          end
    }
  end
end
