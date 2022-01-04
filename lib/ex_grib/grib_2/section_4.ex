defmodule ExGrib.Grib2.Section4 do
  @moduledoc """
  Section 4 contains information about product definition.

  Product definition section

  Notes:

  1. Coordinate values are intended to document the vertical discretization associated with
    model data on hybrid coordinate vertical levels. A value of zero in octets 6-7 indicates
    that no such values are present. Otherwise the number corresponds to the whole set of values.

  2. Hybrid systems employ a means of representing vertical coordinates in terms of a mathematical
    combination of pressure and sigma coordinates. When used in conjunction with a surface pressure
    field and an appropriate mathematical expression, the vertical coordinate parameters may be used
    to interpret the hybrid vertical coordinate.

  3. Hybrid coordinate values, if present, should be encoded in IEEE 32-bit floating point format.
    They are intended to be encoded as pairs.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_sect4.shtml
  """

  defstruct number_of_coordinate_values: :not_parsed,
            optional_list: :not_parsed,
            template: :not_parsed

  alias ExGrib.Grib2.Section4.ProductDefinitionTemplateNumber, as: Template

  @typep section ::
           %__MODULE__{
             number_of_coordinate_values: integer(),
             optional_list: list(),
             template: Template.t()
           }

  @type input :: binary()
  @type t :: {:ok, section(), binary()}

  @spec parse(input()) :: t()
  def parse(<<
        # Length of the section in octets (nn)
        section_size::integer-size(32),
        # Number of the section (4)
        4,
        # Number of coordinate values after template (See note 1)
        number_of_coordinate_values::integer-size(16),
        # Product definition template number (See Table 4.0)
        template_number::integer-size(16),
        more::binary()
      >>) do
    remaining_octets = section_size - 9

    # Octets 10-x are the product definition template given by `template_number` (See product template 4.x)
    # Octetx x-n are the optional list of coordinate values (See notes 2 and 3)
    <<template_and_optional_list_of_coords::binary-size(remaining_octets), rest::binary()>> = more

    {:ok, template, additional_list} =
      case Template.get(template_number) do
        atom when atom in [:reserved, :reserved_for_local_use, :missing] -> {:ok, atom, ""}
        module -> module.get(template_and_optional_list_of_coords)
      end

    section = %__MODULE__{
      number_of_coordinate_values: number_of_coordinate_values,
      optional_list: additional_list,
      template: template
    }

    {:ok, section, rest}
  end

  def parse(_), do: :error
end
