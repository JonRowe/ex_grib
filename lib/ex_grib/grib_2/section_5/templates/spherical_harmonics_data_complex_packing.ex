defmodule ExGrib.Grib2.Section5.Templates.SphericalHarmonicsDataComplexPacking do
  @moduledoc """
  Template 5.51

  Spherical harmonics data complex packingng

  Notes:

  (1) The unpacked subset is a set of values defined in the same
    way as the full set of values (on a spectrum limited to
    Js, Ksnd Ms), but on which scaling and packing are not applied.
    Associated values are stored in octets 6 onwards of section 7.

  (2) The remaining coefficients are multiplied by (n x (n+1))p,
    scaled and packed. The operator associated with this multiplication
    is derived from the Laplacian operator on the sphere.

  (3) The retrieval formula for a coefficient of wave number
    n is then:
      Y = (R+X x 2e ) x 10-d
      x (n x(n+1))-p where X is the packed scaled value
    associated with the coefficient.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp5-51.shtml
  """

  alias ExGrib.Grib2.Section5.PrecisionOfFloatingPointNumbers, as: Precision

  defstruct reference_value: nil,
            binary_scale_factor: nil,
            decimal_scale_factor: nil,
            number_of_bits_used_for_each_packed_value: nil,
            p_laplacian_scaling_factor_expressed_in_10_6_units: nil,
            js: nil,
            ks: nil,
            ms: nil,
            ts: nil,
            precision_of_the_unpacked_subset: nil

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
        # P― Laplacian scaling factor (expressed in 10-6 units)
        p_laplacian_scaling_factor_expressed_in_10_6_units::integer-size(32),
        # Js ― pentagonal resolution parameter of the unpacked subset (see Note1)
        js::integer-size(16),
        # Ks ― pentagonal resolution parameter of the unpacked subset (see Note1)
        ks::integer-size(16),
        # Ms ― pentagonal resolution parameter of the unpacked subset (see Note1)
        ms::integer-size(16),
        # Ts ― total number of values in the unpacked subset (see Note1)
        ts::integer-size(32),
        # Precision of the unpacked subset (see Code Table 5.7)
        precision_of_the_unpacked_subset::integer(),
        rest::binary()
      >>) do
    template = %__MODULE__{
      reference_value: reference_value,
      binary_scale_factor: binary_scale_factor,
      decimal_scale_factor: decimal_scale_factor,
      number_of_bits_used_for_each_packed_value: number_of_bits_used_for_each_packed_value,
      p_laplacian_scaling_factor_expressed_in_10_6_units:
        p_laplacian_scaling_factor_expressed_in_10_6_units,
      js: js,
      ks: ks,
      ms: ms,
      ts: ts,
      precision_of_the_unpacked_subset: Precision.get(precision_of_the_unpacked_subset)
    }

    {:ok, template, rest}
  end
end
