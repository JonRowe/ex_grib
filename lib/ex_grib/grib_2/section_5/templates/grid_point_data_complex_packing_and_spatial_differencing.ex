defmodule ExGrib.Grib2.Section5.Templates.GridPointDataComplexPackingAndSpatialDifferencing do
  @moduledoc """
  Template 5.3

  Grid point data complex packing and spatial differencingng

  Notes:
  (1) Spatial differencing is a pre-processing before group splitting at encoding time. It is
    intended to reduce the size of sufficiently smooth fields, when combined with a splitting
    scheme as described in data representation template 5.2.

    At order 1, an initial field of values f is replaced by a new field of values g,
    where g1 = f1, g2 = f2, ..., gn = fn - fn-1.

    At order 2, the field of values g is itself replaced by a new field of values h,
    where h1 = f1, h2 = f2 , h3 = g3- g2, ..., hn =gn - gn - 1.

    To keep values positive, the overall minimum of the resulting field (either gmin or hmin) is
    removed. At decoding time, after bit string unpacking, the original scaled values are
    recovered by adding the overall minimum and summing up recursively.

  (2) For differencing of order n, the first n values in the array that are not missing are set
    to zero in the packed array. These dummy values are not used in unpacking.

  (3) See data template 7.3 and associated notes for complementary information.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp5-3.shtml
  """

  alias ExGrib.Grib2.Section5.GroupSplittingMethod, as: Group
  alias ExGrib.Grib2.Section5.MissingValueManagementForComplexPacking, as: MissingValue
  alias ExGrib.Grib2.Section5.TypeOfOriginalFieldValues, as: Type
  alias ExGrib.Grib2.Section5.OrderOfSpatialDifferencing, as: Order

  defstruct reference_value: nil,
            binary_scale_factor: nil,
            decimal_scale_factor: nil,
            number_of_bits_used_for_each_packed_value_for_simple_packing_or_for_each_group_reference_value_for_complex_packing_or_spatial_differencing:
              nil,
            type_of_original_field_values: nil,
            group_splitting_method_used: nil,
            missing_value_management_used: nil,
            primary_missing_value_substitute: nil,
            secondary_missing_value_substitute: nil,
            ng: nil,
            reference_for_group_widths: nil,
            number_of_bits_used_for_the_group_widths: nil,
            reference_for_group_lengths: nil,
            length_increment_for_the_group_lengths: nil,
            true_length_of_last_group: nil,
            number_of_bits_used_for_the_scaled_group_lengths: nil,
            order_of_spatial_difference: nil,
            number_of_octets_required_in_the_data_section_to_specify_extra_descriptors_needed_for_spatial_differencing:
              nil

  @spec get(binary()) :: no_return
  def get(<<
        # reference value (R) (IEEE 32-bit floating-point value)
        reference_value::integer-size(32),
        # Binary scale factor (E)
        binary_scale_factor::integer-size(16),
        # Decimal scale factor (D)
        decimal_scale_factor::integer-size(16),
        number_of_bits_used_for_each_packed_value_for_simple_packing_or_for_each_group_reference_value_for_complex_packing_or_spatial_differencing::integer(),
        # Type of original field values (see Code Table 5.1)
        type_of_original_field_values::integer(),
        # Group splitting method used (see Code Table 5.4)
        group_splitting_method_used::integer(),
        # Missing value management used (see Code Table 5.5)
        missing_value_management_used::integer(),
        primary_missing_value_substitute::integer-size(32),
        secondary_missing_value_substitute::integer-size(32),
        # NG ― number of groups of data values into which field is split
        ng::integer-size(32),
        # Reference for group widths (see Note 12)
        reference_for_group_widths::integer(),
        # Number of bits used for the group widths (after the reference value in octet 36 has been removed)
        number_of_bits_used_for_the_group_widths::integer(),
        # Reference for group lengths (see Note 13)
        reference_for_group_lengths::integer-size(32),
        # Length increment for the group lengths (see Note 14)
        length_increment_for_the_group_lengths::integer(),
        true_length_of_last_group::integer-size(32),
        # Number of bits used for the scaled group lengths (after subtraction of the reference value given in octets 38-41 and division by the length increment given in octet 42)
        number_of_bits_used_for_the_scaled_group_lengths::integer(),
        # Order of spatial difference (see Code Table 5.6)
        order_of_spatial_difference::integer(),
        # Number of octets required in the data section to specify extra descriptors needed for spatial differencing (octets 6-ww in data template 7.3)
        number_of_octets_required_in_the_data_section_to_specify_extra_descriptors_needed_for_spatial_differencing::integer(),
        rest::binary()
      >>) do
    template = %__MODULE__{
      reference_value: reference_value,
      binary_scale_factor: binary_scale_factor,
      decimal_scale_factor: decimal_scale_factor,
      number_of_bits_used_for_each_packed_value_for_simple_packing_or_for_each_group_reference_value_for_complex_packing_or_spatial_differencing:
        number_of_bits_used_for_each_packed_value_for_simple_packing_or_for_each_group_reference_value_for_complex_packing_or_spatial_differencing,
      type_of_original_field_values: Type.get(type_of_original_field_values),
      group_splitting_method_used: Group.get(group_splitting_method_used),
      missing_value_management_used: MissingValue.get(missing_value_management_used),
      primary_missing_value_substitute: primary_missing_value_substitute,
      secondary_missing_value_substitute: secondary_missing_value_substitute,
      ng: ng,
      reference_for_group_widths: reference_for_group_widths,
      number_of_bits_used_for_the_group_widths: number_of_bits_used_for_the_group_widths,
      reference_for_group_lengths: reference_for_group_lengths,
      length_increment_for_the_group_lengths: length_increment_for_the_group_lengths,
      true_length_of_last_group: true_length_of_last_group,
      number_of_bits_used_for_the_scaled_group_lengths:
        number_of_bits_used_for_the_scaled_group_lengths,
      order_of_spatial_difference: Order.get(order_of_spatial_difference),
      number_of_octets_required_in_the_data_section_to_specify_extra_descriptors_needed_for_spatial_differencing:
        number_of_octets_required_in_the_data_section_to_specify_extra_descriptors_needed_for_spatial_differencing
    }

    {:ok, template, rest}
  end
end
