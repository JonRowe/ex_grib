defmodule ExGrib.Grib2.Section5Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib2.Section5
  alias ExGrib.Grib2.Section5.Templates.GridPointDataSimplePacking

  import ExGrib.Test.File, only: [file_contents: 2]

  describe "parse/1" do
    test "it returns data representation data" do
      assert {:ok, section, _} =
               Section5.parse(file_contents("gfs_25km.grb2", skip: [octets: 143]))

      assert %Section5{
               number_of_data_points_with_values_in_section_7: 9,
               template: %GridPointDataSimplePacking{} = template
             } = section

      assert %GridPointDataSimplePacking{
               binary_scale_factor: 32773,
               decimal_scale_factor: 0,
               number_of_packing_bits: 8,
               reference_value: 1_078_565_273,
               type_of_original_field_values: 0
             } == template
    end

    test "it errors on an unrecognised section" do
      assert :error = Section5.parse(<<"NOTAGRIB">>)
    end
  end
end
