defmodule ExGrib.Grib2.Section5.Templates.GridPointDataJpeg2000CodeStreamFormat do
  @moduledoc """
  Template 5.40

  Grid point data jpeg 2000 code stream formatat

  Notes:

  (1) The intent of this template is to scale the grid point data to obtain desired precision, if appropriate, and then
    subtract out reference value from the scaled field as is done using Data Representation Template 5.0. After this,
    the resulting grid point field can be treated as a grayscale image and is then encoded into the JPEG 2000 code
    stream format.To unpack the data field, the JPEG 2000 code stream is decoded back into an image, and the original
    field is obtained from the image data as described in regulation 92.9.4, Note (4).

  (2) The JPEG 2000 standared specifies that the bit-depth must be in the range of 1 to 38 bits.

  (3) The compression ratio M:1 (e.g. 20:1) specifies that the encoded stream should be less than ((1/M) x depth x
    number of data points) bits, where depth is specified in octet 20 and number of data points is specified in octets 6-9
    of the Data Representation Section.

  (4) The order of the data points should remain as specified in the scanning mode flags (Flag Table 3.4) set in the
    appropriate Grid Definition Template, even though the JPEG 2000 standard specifies that an image is stored starting
    at the top left corner.Assuming that the encoding software is expecting the image data in raster order (left to right
    across rows for each row), users should set the image width to Ni (or Nx) and the height to Nj (or Ny) if bit 3 of the
    scanning mode flag equals 0 (adjacent points in i (x) order), when encoding the "image." If bit 3 of the scanning
    mode flags equals 1 (adjacent points in j (y) order), it may be advantageous to set the image width to Nj (or Ny) and
    the height to Ni (or Nx).

  (5) This template should not be used when the data points are not available on a rectangular grid, such as occurs if some
    data points are bit-mapped out or if section 3 describes a quasi-regular grid. If it is necessary to use this template on
    such a grid, the data field can be treated as a one dimensional image where the height is set to 1 and the width is set to
    the total number of data points specified in octets 6-9.

  (6) Negative values of E or D shall be represented according to Regulation 92.1.5.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp5-40.shtml
  """

  defstruct reference_value: nil,
            binary_scale_factor: nil,
            decimal_scale_factor: nil,
            number_of_bits_required_to_hold_the_resulting_scaled_and_referenced_data_values: nil,
            type_of_original_field_values: nil,
            type_of_compression_used: nil,
            target_compression_ratio_m: nil

  alias ExGrib.Grib2.Section5.TypeOfCompression
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
        # Type of Compression used. (see Code Table 5.40)
        type_of_compression_used::integer(),
        # Target compression ratio M:1 (with respect to the bit-depth specified in octet 20)
        # when octet 22 indicates Lossy Compression. Otherwise set to missing (see Note 3)
        target_compression_ratio_m::integer(),
        rest::binary()
      >>) do
    template = %__MODULE__{
      reference_value: reference_value,
      binary_scale_factor: binary_scale_factor,
      decimal_scale_factor: decimal_scale_factor,
      number_of_bits_required_to_hold_the_resulting_scaled_and_referenced_data_values:
        number_of_bits_required_to_hold_the_resulting_scaled_and_referenced_data_values,
      type_of_original_field_values: TypeOfOriginalFieldValues.get(type_of_original_field_values),
      type_of_compression_used: TypeOfCompression.get(type_of_compression_used),
      target_compression_ratio_m: target_compression_ratio_m
    }

    {:ok, template, rest}
  end
end
