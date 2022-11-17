defmodule ExGrib.Grib1.Section4Test do
  use ExUnit.Case, async: true

  doctest ExGrib.Grib1.Section4

  alias ExGrib.Grib1.Table11
  alias ExGrib.Grib1.Section4

  import ExGrib.Test.File, only: [file_contents: 2]

  @fixed_bytes 12

  describe "parse/2" do
    test "it defaults to reading the data" do
      assert {:ok, %Section4{} = section, _} =
               Section4.parse(file_contents("forecast.grb", skip: [octets: 68]))

      assert length(section.data) ==
               (section.section_length - @fixed_bytes) * 8 / section.bits_per_value
    end

    test "it returns the definition without the data when asked" do
      assert {:ok, %Section4{} = section, _} =
               Section4.parse(file_contents("forecast.grb", skip: [octets: 68]), read_data: false)

      assert %Section4{
               binary_scale_factor: -6,
               bits_per_value: 16,
               data: :not_loaded,
               data_flag: %Table11{
                 additional_flags_at_section_4_octect_14: false,
                 grid_or_sphere: :grid,
                 int_or_float: :float,
                 simple_or_complex: :simple
               },
               reference_value: 101_737.125,
               section_length: 7454
             } = section
    end

    test "it returns the definition with the data when asked" do
      assert {:ok, %Section4{} = section, _} =
               Section4.parse(file_contents("forecast.grb", skip: [octets: 68]), read_data: true)

      assert %Section4{
               binary_scale_factor: -6,
               bits_per_value: bits_per_value = 16,
               data: data,
               data_flag: %Table11{
                 additional_flags_at_section_4_octect_14: false,
                 grid_or_sphere: :grid,
                 int_or_float: :float,
                 simple_or_complex: :simple
               },
               reference_value: 101_737.125,
               section_length: section_length = 7454
             } = section

      assert length(data) == (section_length - @fixed_bytes) * 8 / bits_per_value
    end

    test "it errors on an unrecognised section" do
      assert :error = Section4.parse(<<"NOTAGRIB">>)
    end
  end
end
