defmodule ExGrib.Grib1.Section4Test do
  use ExUnit.Case, async: true

  doctest ExGrib.Grib1.Section4

  alias ExGrib.Grib1.Table11
  alias ExGrib.Grib1.Section4

  import ExGrib.Test.File, only: [file_contents: 2]

  describe "parse/1" do
    test "it returns data" do
      assert {:ok, %Section4{} = section, _} =
               Section4.parse(file_contents("forecast.grb", skip: [octets: 68]))

      assert %Section4{
               binary_scale_factor: -6,
               bits_per_value: 16,
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

    test "it errors on an unrecognised section" do
      assert :error = Section4.parse(<<"NOTAGRIB">>)
    end
  end
end
