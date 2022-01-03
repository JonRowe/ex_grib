defmodule ExGrib.Grib2.Section5.Templates.SpectralDataSimplePacking do
  @moduledoc """
  Template 5.50

  Spectral data simple packingng

  Notes:

  (1) Removal of the real part of (0.0) coefficient from packed data is intended to
    reduce the variability of the coefficients, in order to improve packing accuracy.

  (2) For some spectral representations, the (0.0) coefficient represents the mean
    value of the parameter represented.

  (3) Negative values of E or D shall be represented according to Regulation 92.1.5.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp5-50.shtml
  """

  defstruct reference_value: nil,
            binary_scale_factor: nil,
            decimal_scale_factor: nil,
            number_of_bits_used_for_each_packed_value: nil,
            real_part_of_coefficient: nil

  @spec get(binary()) :: no_return
  def get(<<
        # Reference value (R) (IEEE 32-bit floating-point value)
        reference_value::integer-size(32),
        # Binary scale factor (E)
        binary_scale_factor::integer-size(16),
        # Decimal scale factor (D)
        decimal_scale_factor::integer-size(16),
        # Number of bits used for each packed value (field width)
        number_of_bits_used_for_each_packed_value::integer(),
        # Real part of (0.0) coefficient (IEEE 32-bit floating-point value)
        real_part_of_coefficient::integer-size(32),
        rest::binary()
      >>) do
    template = %__MODULE__{
      reference_value: reference_value,
      binary_scale_factor: binary_scale_factor,
      decimal_scale_factor: decimal_scale_factor,
      number_of_bits_used_for_each_packed_value: number_of_bits_used_for_each_packed_value,
      real_part_of_coefficient: real_part_of_coefficient
    }

    {:ok, template, rest}
  end
end
