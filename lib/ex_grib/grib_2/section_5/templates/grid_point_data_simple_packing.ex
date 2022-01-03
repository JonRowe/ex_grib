defmodule ExGrib.Grib2.Section5.Templates.GridPointDataSimplePacking do
  @moduledoc """
  Template 5.0

  Grid point data simple packingng

  Note:
    Negative values of E or D shall be represented according to Regulation 92.1.5.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp5-0.shtml
  """

  defstruct reference_value: nil,
            binary_scale_factor: nil,
            decimal_scale_factor: nil,
            number_of_packing_bits: nil,
            type_of_original_field_values: nil

  @spec get(binary()) :: no_return
  def get(<<
        # Reference value (R) (IEEE 32-bit floating-point value)
        reference_value::integer-size(32),
        # Binary scale factor (E)
        binary_scale_factor::integer-size(16),
        # Decimal scale factor (D)
        decimal_scale_factor::integer-size(16),
        # number of bits used for each packed value for simple packing or for each group reference value for complex packing or spatial differencing
        number_of_packing_bits::integer(),
        # Type of original field values (see Code Table 5.1)
        type_of_original_field_values::integer(),
        rest::binary()
      >>) do
    template = %__MODULE__{
      reference_value: reference_value,
      binary_scale_factor: binary_scale_factor,
      decimal_scale_factor: decimal_scale_factor,
      number_of_packing_bits: number_of_packing_bits,
      type_of_original_field_values: type_of_original_field_values
    }

    {:ok, template, rest}
  end
end
