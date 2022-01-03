defmodule ExGrib.Grib2.Section5.Templates.GridPointDataSimplePackingWithLogarithmPreProcessing do
  @moduledoc """
  Template 5.61

  Grid point data simple packing with logarithm pre processingng

  Notes:

  (1) The template is approriately designed for data sets with all non-negative values and
    a wide variability range (more then 5 orders of magnitude). It must not be used for data sets with
    negative values or smaller variability range.

  (2) A logarithm pre-processing algorithm is used to fit the variability range into one or two order of
    magnitudes before using the simple packing algorithm. It requires a parameter (B) to assure that
    all values passed to the logarithm function are positive.Thus scaled values are Z=ln (Y+B), where Y
    are the original values, ln is the natural logarithm (or Napierian) function and B is chosen so that Y+B>0.

  (3) Best pratice follows for choosing the B pre-processing parameter.
    (a) If the data set minimum value is positive, B can be safely put to zero.
    (b) If the data set minimum is zero, all values must be scaled to become greater than
      zero and B can be equal to the minimum positive value in the data set.

  (4) Data shall be packed using Data template 7.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp5-61.shtml
  """

  defstruct reference_value: nil,
            binary_scale_factor: nil,
            decimal_scale_factor: nil,
            number_of_bits_used_for_each_packed_value: nil,
            pre_processing_parameter: nil

  @spec get(binary()) :: no_return
  def get(<<
        # Reference value (R) (IEEE 32-bit floating-point value)
        reference_value::integer-size(32),
        # Binary scale factor (E)
        binary_scale_factor::integer-size(16),
        # Decimal scale factor (D)
        decimal_scale_factor::integer-size(16),
        number_of_bits_used_for_each_packed_value::integer(),
        # Pre-processing parameter (B) (IEEE 32-bit floating-point value)
        pre_processing_parameter::integer-size(32),
        rest::binary()
      >>) do
    template = %__MODULE__{
      reference_value: reference_value,
      binary_scale_factor: binary_scale_factor,
      decimal_scale_factor: decimal_scale_factor,
      number_of_bits_used_for_each_packed_value: number_of_bits_used_for_each_packed_value,
      pre_processing_parameter: pre_processing_parameter
    }

    {:ok, template, rest}
  end
end
