defmodule ExGrib.Grib1.Section2 do
  @moduledoc """
  Grid description

  https://apps.ecmwf.int/codes/grib/format/grib1/sections/2/
  """

  alias ExGrib.Grib1.Table6

  @type input :: binary()
  @typep section ::
           %__MODULE__{
             data_representation_type: Table6.t(),
             grid_definition: binary(),
             grid_definition_extension: :not_parsed,
             number_of_vertical_coordinate_values: integer(),
             pl: :not_parsed,
             pv: :not_parsed,
             pvl_location: integer(),
             section_length: integer()
           }
  @type t :: {:ok, section()} | :error

  defstruct data_representation_type: :not_parsed,
            grid_definition: :not_parsed,
            grid_definition_extension: :not_parsed,
            number_of_vertical_coordinate_values: :not_parsed,
            pl: :not_parsed,
            pv: :not_parsed,
            pvl_location: :not_parsed,
            section_length: :not_parsed

  @spec parse(input()) :: t()
  def parse(<<
        # Length of section
        section_length::integer-size(24),
        number_of_vertical_coordinate_values::integer(),
        pvl_location::integer(),
        data_representation_type::integer(),
        grid_definition::binary-size(26),
        more::binary()
      >>) do
    section = %__MODULE__{
      data_representation_type: Table6.get(data_representation_type),
      grid_definition: grid_definition,
      number_of_vertical_coordinate_values: number_of_vertical_coordinate_values,
      pvl_location: pvl_location,
      section_length: section_length
    }

    remaining_octets = section_length - 32

    # Octets 33 to (42,44 or 52 depend on the projection)
    #
    # 33-42 Extensions of grid definition for rotation or stretching of the coordinate system or Lambert conformal projection or Mercator projection
    # 33-44 Extensions of grid definition for space view perspective projection
    # 33-52 Extensions of grid definition for stretched and rotated coordinate system
    #
    # PV - List of vertical coordinate parameters (length = NV × 4 octets); if present, then PL = 4NV + PV
    # PL - List of numbers of points in each row (length = NROWS x 2 octets, where NROWS is the total number of rows defined within the grid description) 
    <<_extensions_pv_and_pl::binary-size(remaining_octets), rest::binary()>> = more

    {:ok, section, rest}
  end

  def parse(_), do: :error
end
