defmodule ExGrib.Grib2.Section5.Templates.GridPointDataComplexPacking do
  @moduledoc """
  Template 5.2

  Grid point data complex packingng

  Notes:

  (1) Group lengths have no meaning for row by row packing, where groups are coordinate lines (so th
    grid description section and possibly the bit-map section are enough); for consistency,
    associated field width and reference should then be encoded as 0.

  (2) For row by row packing with a bit-map, there should always be as many groups as rows. In case
    of rows with only missing values, all associated descriptors should be coded as zero.

  (3) Management of widths into a reference and increments, together with management of lengths as
    scaled incremental values, are intended to save descriptor size (which is an issue as far as
    compression gains are concerned).

  (4) Management of explicitly missing values is an alternate to bit-map use within Section 6; it
    is intended to reduce the whole GRIB message size.

  (5) There may be two types of missing value(s), such as to make a distinction between static
    misses (for instance, due to a land/sea mask) and occasional misses.

  (6) As an extra option, substitute value(s) for missing data may be specified. If not wished (or
    not applicable), all bits should be set to 1 for relevant substitute value(s).

  (7) If substitute value(s) are specified, type of content should be consistent with appropriate
    group with original field values (floating-point ― and then IEEE 32-bit encoded-, or integer).

  (8) If secondary missing values are used, such values are encoded within appropriate group with
    all bits set to 1 at packed data level.

  (9) If secondary missing values are used, such values are encoded within appropriate group with
    all bits set to 1, except the last one set to 0, at packed data level.

  (10) A group containing only missing values (of either type) will be encoded as a constant group
    (null width, no associate data) and the group reference will have all bits set to 1 for primary
    type, and all bits set to 1, except the last bit set to 0, for secondary type.

  (11) If necessary, group widths and/or field width of group references may be enlarged to avoid
    ambiguities between missing value indicator(s) and true data.

  (12) The group width is the number of bits used for every value in a group.

  (13) The group length (L) is the number of values in a group.

  (14) The essence of the complex packing method is to subdivide a field of values into NG groups,
    where the values in each group have similar sizes. In this procedure, it is necessary to retain
    enough information to recover the group lengths upon decoding. The NG group lengths for any
    given field can be described by Ln = ref + Kn x len_inc, n = 1,NG, where ref is given by octets
    38 - 41 and len_inc by octet 42. The NG values of K (the scaled group lengths) are stored in the
    data section, each with the number of bits specified by octet 47. Since the last group is a
    special case which may not be able to be specified by this relationship, the length of the last
    group is stored in octets 43-46.

  (15) See data template 7.2 and associated notes for complementary information.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp5-2.shtml
  """

  alias ExGrib.Grib2.Section5.GroupSplittingMethod, as: Group
  alias ExGrib.Grib2.Section5.MissingValueManagementForComplexPacking, as: MissingValue
  alias ExGrib.Grib2.Section5.TypeOfOriginalFieldValues, as: Type

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
            number_of_bits_used_for_the_scaled_group_lengths: nil

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
        number_of_bits_used_for_the_scaled_group_lengths
    }

    {:ok, template, rest}
  end
end
