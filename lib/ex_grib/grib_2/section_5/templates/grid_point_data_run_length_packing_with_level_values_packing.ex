defmodule ExGrib.Grib2.Section5.Templates.GridPointDataRunLengthPackingWithLevelValuesPacking do
  @moduledoc """
  Template 5.200

  Grid point data run length packing with level values packingng

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp5-200.shtml
  """

  defstruct number_of_used_for_each_packed_value_in_the_run_length_packing_with_level_value: nil,
            max_value: nil,
            max_value_level: nil,
            decimal_scale_factor_of_representative_value_of_each_level: nil,
            list_of_mvl_scale_representative_values: []

  @spec get(binary()) :: no_return
  def get(<<
        number_of_used_for_each_packed_value_in_the_run_length_packing_with_level_value::integer(),
        # MV - Maximum value within the levels that used in the packing
        max_value::integer-size(16),
        # MVL - Maximum value of level (Predefined)
        max_value_level::integer-size(16),
        decimal_scale_factor_of_representative_value_of_each_level::integer(),
        more::binary()
      >>) do
    # List of MVL scale representative values of each level from lv=1 to MVL
    {:ok, mvl_values, rest} = parse_mvl_scale_values(max_value_level, more)

    template = %__MODULE__{
      number_of_used_for_each_packed_value_in_the_run_length_packing_with_level_value:
        number_of_used_for_each_packed_value_in_the_run_length_packing_with_level_value,
      max_value: max_value,
      max_value_level: max_value_level,
      decimal_scale_factor_of_representative_value_of_each_level:
        decimal_scale_factor_of_representative_value_of_each_level,
      list_of_mvl_scale_representative_values: mvl_values
    }

    {:ok, template, rest}
  end

  defp parse_mvl_scale_values(1, <<value::integer-size(16), rest::binary()>>),
    do: {:ok, [value], rest}

  defp parse_mvl_scale_values(n, <<value::integer-size(16), more::binary()>>) do
    {:ok, mvl_values, rest} = parse_mvl_scale_values(n - 1, more)
    {:ok, [value | mvl_values], rest}
  end
end
