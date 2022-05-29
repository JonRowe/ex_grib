defmodule ExGrib.Grib2.Section5.Templates.MatrixValuesAtGridPointSimplePacking do
  @moduledoc """
  Template 5.1

  Matrix values at grid point simple packingng

  Notes:
  (1) This form of representation enables a matrix of values to be depicted at each grid point the
    two dimensions of the matrix may represent coordinates expressed in terms of two elemental
    parameters (e.g. direction and frequency for wave spectra).  The numeric values of these
    coordinates, beyond that of simple subscripts, can be given in a functional form, or as a
    collection of explicit numbers.

  (2) Some simple coordinate functional forms are tabulated in Code table 5.2. Where a more complex
    coordinate function applies, the coordinate values shall be explicitly denoted by the inclusion
    of the actual set of values rather than the coefficients.  This shall be indicated by a code
    figure 0 from Code table 5.2 the number of explicit values coded shall be equal to the
    appropriate dimension of the matrix for which values are presented and they shall follow octet
    36 in place of coefficients.

  (3) Matrix bit maps will be present only if indicated by octet 22. If present, there shall be one
    bit map for each grid point with data values, as defined by the primary bit map in Section 6,
    each of length (NRxNC) bits: a bit set to 1 will indicate a data element at the corresponding
    location within the matrix. Bit maps shall be represented end-to-end, without regard for octet
    boundaries: the last bit map shall, if necessary, be followed by bits set to zero to fill any
    partially used octet.

  (4) Matrices restricted to scanning in the +i direction (left to right) and in the -j direction
    (top to bottom)

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp5-1.shtml
  """

  alias ExGrib.Grib2.Section5.TypeOfOriginalFieldValues, as: Type

  defstruct reference_value: nil,
            binary_scale_factor: nil,
            decimal_scale_factor: nil,
            number_of_packing_bits: nil,
            type_of_original_field_values: nil,
            matrix_bits_present: false,
            number_of_data_values_encoded_in_section_7: 0,
            nr: nil,
            nc: nil,
            first_dimension_coordinate_value_definition: nil,
            first_dimension_nc: nil,
            second_dimension_coordinate_value_definition: nil,
            second_dimension_nc: nil,
            first_dimension_physical_significance: nil,
            second_dimension_physical_significance: nil,
            first_dimension_coordinate_values_coefficients: nil,
            second_dimension_coordinate_values_coefficients: nil

  @type t :: {:ok, struct(), binary()} | :error

  @spec get(binary()) :: t()
  def get(<<
        # reference value (R) (IEEE 32-bit floating-point value)
        reference_value::integer-size(32),
        # Binary scale factor (E)
        binary_scale_factor::integer-size(16),
        # Decimal scale factor (D)
        decimal_scale_factor::integer-size(16),
        number_of_packing_bits::integer(),
        # Type of original field values (see Code Table 5.1)
        type_of_original_field_values::integer(),
        # 0 no matrix bit maps present; 1  matrix bit maps present
        _matrix_bit_maps_present::bits-size(1),
        # Number of data values encoded in Section 7
        number_of_data_values_encoded_in_section_7::integer-size(32),
        # NR ― first dimension (rows) of each matrix
        nr::integer-size(16),
        # NC ― second dimension (columns) of each matrix
        nc::integer-size(16),
        # First dimension coordinate value definition (see Code Table 5.2)
        first_dimension_coordinate_value_definition::integer(),
        # NC1 ― number of coefficients or values used  to specify first dimension coordinate function
        first_dimension_nc::integer(),
        # Second dimension coordinate value definition (see Code Table 5.2)
        second_dimension_coordinate_value_definition::integer(),
        # NC2 ― number of coefficients or values used to specify second dimension coordinate function
        second_dimension_nc::integer(),
        # First dimension physical significance (see Code Table 5.3)
        first_dimension_physical_significance::integer(),
        # Second dimension physical significance (see Code Table 5.3)
        second_dimension_physical_significance::integer(),
        more::binary()
      >>) do
    first_dimension_size = first_dimension_nc * 8
    second_dimension_size = second_dimension_nc * 8

    <<
      # Coefficients to define first dimension coordinate values in functional form or the explicit coordinate values (IEEE 32-bit floating-point value)
      first_dimension_coordinate_values_coefficients::integer-size(first_dimension_size),
      # Coefficients to define second dimension coordinate values in functional form or the explicit coordinate values (IEEE 32-bit floating-point value)
      second_dimension_coordinate_values_coefficients::integer-size(second_dimension_size),
      rest::binary()
    >> = more

    template = %__MODULE__{
      reference_value: reference_value,
      binary_scale_factor: binary_scale_factor,
      decimal_scale_factor: decimal_scale_factor,
      number_of_packing_bits: number_of_packing_bits,
      type_of_original_field_values: Type.get(type_of_original_field_values),
      # matrix_bit_maps_present == <<1>>,
      matrix_bits_present: false,
      number_of_data_values_encoded_in_section_7: number_of_data_values_encoded_in_section_7,
      nr: nr,
      nc: nc,
      first_dimension_coordinate_value_definition: first_dimension_coordinate_value_definition,
      first_dimension_nc: first_dimension_nc,
      second_dimension_coordinate_value_definition: second_dimension_coordinate_value_definition,
      second_dimension_nc: second_dimension_nc,
      first_dimension_physical_significance: first_dimension_physical_significance,
      second_dimension_physical_significance: second_dimension_physical_significance,
      first_dimension_coordinate_values_coefficients:
        first_dimension_coordinate_values_coefficients,
      second_dimension_coordinate_values_coefficients:
        second_dimension_coordinate_values_coefficients
    }

    {:ok, template, rest}
  end

  def get(_), do: :error
end
