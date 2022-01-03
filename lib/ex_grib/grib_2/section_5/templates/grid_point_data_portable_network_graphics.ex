defmodule ExGrib.Grib2.Section5.Templates.GridPointDataPortableNetworkGraphics do
  @moduledoc """
  Template 5.41

  Grid point data portable network graphicscs (png) format

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp5-41.shtml
  """

  defstruct reference_value: nil,
            binary_scale_factor: nil,
            decimal_scale_factor: nil,
            number_of_bits_required_to_hold_the_resulting_scaled_and_referenced_data_values: nil,
            type_of_original_field_values: nil

  alias ExGrib.Grib2.Section5.TypeOfOriginalFieldValues

  @spec get(binary()) :: no_return
  def get(<<
        # Reference value (R) (IEEE 32-bit floating-point value)
        reference_value::integer-size(32),
        # Binary scale factor (E)
        binary_scale_factor::integer-size(16),
        # Decimal scale factor (D)
        decimal_scale_factor::integer-size(16),
        # Number of bits required to hold the resulting scaled and referenced data values. (i.e. The depth of the grayscale image.) (see Note 2)
        number_of_bits_required_to_hold_the_resulting_scaled_and_referenced_data_values::integer(),
        # Type of original field values (see Code Table 5.1)
        type_of_original_field_values::integer(),
        rest::binary()
      >>) do
    template = %__MODULE__{
      reference_value: reference_value,
      binary_scale_factor: binary_scale_factor,
      decimal_scale_factor: decimal_scale_factor,
      number_of_bits_required_to_hold_the_resulting_scaled_and_referenced_data_values:
        number_of_bits_required_to_hold_the_resulting_scaled_and_referenced_data_values,
      type_of_original_field_values: TypeOfOriginalFieldValues.get(type_of_original_field_values)
    }

    {:ok, template, rest}
  end
end
