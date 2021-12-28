defmodule ExGrib.Grib2.Section3 do
  @moduledoc """
  Section 3 contains information about grid definition.

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

  alias ExGrib.Grib2.Section3.GridTemplate, as: Template
  alias ExGrib.Grib2.Section3.InterpretationOfListOfNumbers, as: Interpretation
  alias ExGrib.Grib2.Section3.SourceOfGridDefinition, as: GribSource

  @type input :: binary()
  @type t ::
          {:ok, GribSource.t(), integer(), Interpretation.t(), Template.t(), binary(), binary()}
          | :error

  def parse(<<
        # Section size in octets
        section_size::integer-size(32),
        # section number
        3,
        # grib source
        source_id::integer(),
        # number of data points in template
        number_of_data_points::integer-size(32),

        # number of octets in additional list if any
        _number_of_octets::integer(),
        # how to interpret the list of numbers
        interpretation_id::integer(),
        # the template used to define the grid
        grid_template::integer-size(16),
        more::binary()
      >>) do
    remaining_octets = section_size - 14

    <<template_and_additional_list::binary-size(remaining_octets), rest::binary()>> = more

    {:ok, template, additional_list} =
      Template.get(grid_template).get(template_and_additional_list)

    {:ok, GribSource.get(source_id), number_of_data_points, Interpretation.get(interpretation_id),
     template, additional_list, rest}
  end

  def parse(_), do: :error
end
