defmodule ExGrib.Grib1Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib1
  alias ExGrib.Grib1.Section0
  alias ExGrib.Grib1.Section1
  alias ExGrib.Grib1.Table1
  alias ExGrib.Grib1.Table2
  alias ExGrib.Grib1.Table3

  import ExGrib.Test.File, only: [file_contents: 1, file_contents: 2]

  doctest ExGrib.Grib1

  describe "detect/1" do
    test "it returns true when binary contains a grib1 header" do
      assert true == Grib1.detect(file_contents("forecast.grb"))
    end

    test "it returns false otherwise" do
      assert false == Grib1.detect(file_contents("gfs_25km.grb2"))
    end
  end

  describe "header/1" do
    test "it returns the header of the grib" do
      assert {:ok, %Section0{file_size: 7526}, _} = Grib1.header(file_contents("forecast.grb"))
    end

    test "it errors on unrecognised headers" do
      assert :error = Grib1.header(<<"NOTAGRIB">>)
    end
  end

  describe "product_definition/1" do
    test "it returns the production_definition of the grib" do
      assert {:ok, section_1, _} =
               Grib1.product_definition(file_contents("forecast.grb", skip: [octets: 8]))

      assert %Section1{
               centre: :missing,
               century_of_reference_time_of_data: 21,
               day: 29,
               decimal_scale_factor: <<0, 0>>,
               generating_process_identifier: 74,
               grid_definition: 255,
               hour: 0,
               indicator_of_parameter: %Table2{parameter: :pressure_reduced_to_msl, unit: :pa},
               indicator_of_type_of_level: %Table3{
                 octet_10: :mean_sea_level,
                 octet_11: :not_set,
                 octet_12: :not_set
               },
               minute: 0,
               month: 5,
               number_included_in_average: 0,
               number_missing_from_averages_or_accumulations: 0,
               p1: 180,
               p2: 0,
               section_1_flags: %Table1{section_2: :included, section_3: :ommited},
               section_length: 28,
               sub_centre: :wmo_secretariat,
               table_version: 2,
               time_range_indicator:
                 :forecast_or_uninitialized_analysis_or_image_valid_for_reference_time,
               unit_of_time_range: :minute,
               year_of_century: 22
             } = section_1
    end

    test "it errors on unrecognised headers" do
      assert :error = Grib1.header(<<"NOTAGRIB">>)
    end
  end

  describe "parse/1" do
    test "it pulls out a grib" do
      assert {:ok, %Grib1{} = grib, _more_data} = Grib1.parse(file_contents("forecast.grb"))

      assert %Grib1{
               header: %Section0{file_size: 7526},
               grid_definition: :not_parsed,
               product_definition: section_1,
               bitmap: :not_parsed,
               data: :not_parsed
             } = grib

      assert %Section1{
               centre: :missing,
               century_of_reference_time_of_data: 21,
               day: 29,
               decimal_scale_factor: <<0, 0>>,
               generating_process_identifier: 74,
               grid_definition: 255,
               hour: 0,
               indicator_of_parameter: %Table2{parameter: :pressure_reduced_to_msl, unit: :pa},
               indicator_of_type_of_level: %Table3{
                 octet_10: :mean_sea_level,
                 octet_11: :not_set,
                 octet_12: :not_set
               },
               minute: 0,
               month: 5,
               number_included_in_average: 0,
               number_missing_from_averages_or_accumulations: 0,
               p1: 180,
               p2: 0,
               section_1_flags: %Table1{section_2: :included, section_3: :ommited},
               section_length: 28,
               sub_centre: :wmo_secretariat,
               table_version: 2,
               time_range_indicator:
                 :forecast_or_uninitialized_analysis_or_image_valid_for_reference_time,
               unit_of_time_range: :minute,
               year_of_century: 22
             } = section_1
    end
  end
end
