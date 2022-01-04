defmodule ExGrib.Grib2.Section3 do
  @moduledoc """
  Section 3 contains information about grid definition.

  Grid definition section

  Notes:

  1. If octet 6 (source_id) is not zero, octets 15-xx (15-nn if octet 11 is zero) may not be supplied.
    This should be documented with all bits set to 1 in the grid definition template number.

  2. An optional list of numbers defining number of points is used to document a quasi-regular
    grid, where the number of points may vary from one row to another. In such a case, octet 11
    is non zero and gives the number octets on which each number of points is encoded. For all
    other cases, such as regular grids, octets 11 and 12 are zero and no list is appended to
    the grid definition template.

  3. If a list of numbers defining the number of points is preset, it is appended at the end of
    the grid definition template ( or directly after the grid definition number if the template
    is missing). When the grid definition template is present, the length is given according to
    bit 3 of the scanning mode flag octet (length is Nj or Ny for flag value 0). List ordering
    is implied by data scanning.

  4. Depending on the code value given in octet 12, the list of numbers either:
     - Corresponds to the coordinate lines as given in the grid definition, or
     - Corresponds to a full circle, or
     - Does not apply.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_sect3.shtml
  """

  defstruct interpetation_of_optional_list: :not_parsed,
            number_of_data_points: :not_parsed,
            optional_list: :not_parsed,
            source: :not_parsed,
            template: :not_parsed

  alias ExGrib.Grib2.Section3.GridTemplate, as: Template
  alias ExGrib.Grib2.Section3.InterpretationOfListOfNumbers, as: Interpretation
  alias ExGrib.Grib2.Section3.SourceOfGridDefinition, as: GribSource

  @typep section ::
           %__MODULE__{
             interpetation_of_optional_list: Interpretation.t(),
             number_of_data_points: integer(),
             optional_list: list() | nil,
             source: GribSource.t(),
             template: Template.t()
           }
  @type input :: binary()
  @type t :: {:ok, section(), binary()} | :error

  @spec parse(input()) :: t()
  def parse(<<
        # Length of the section in octets (nn)
        section_size::integer-size(32),
        # Number of the section (3)
        3,
        # Source of grid definition (See Table 3.0) (See note 1 below)
        source_id::integer(),
        # number of data points in template
        number_of_data_points::integer-size(32),
        # Number of octets for optional list of numbers defining number of points (See note 2)
        _number_of_octets::integer(),
        # Interpetation of list of numbers defining number of points (See Table 3.11)
        interpretation_id::integer(),
        # Grid definition template number (= N) (See Table 3.1)
        grid_template::integer-size(16),
        more::binary()
      >>) do
    remaining_octets = section_size - 14

    # Grid definition template (See Template 3.N where N is the grid definition template number given in octets 13-14)
    # Optional list of numbers defining number of points (See notes 2 3 and 4 below)
    <<template_and_additional_list::binary-size(remaining_octets), rest::binary()>> = more

    {:ok, template, additional_list} =
      Template.get(grid_template).get(template_and_additional_list)

    section = %__MODULE__{
      interpetation_of_optional_list: Interpretation.get(interpretation_id),
      number_of_data_points: number_of_data_points,
      optional_list: additional_list,
      source: GribSource.get(source_id),
      template: template
    }

    {:ok, section, rest}
  end

  def parse(_), do: :error
end
