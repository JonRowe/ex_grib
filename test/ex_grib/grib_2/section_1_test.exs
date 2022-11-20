defmodule ExGrib.Grib2.Section1Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib2.Section1

  import ExGrib.Test.File, only: [file_contents: 2]

  describe "parse/1" do
    test "it returns the identification details of the grib" do
      assert {:ok, section, _} =
               Section1.parse(file_contents("gfs_25km.grb2", skip: [octets: 16]))

      assert %Section1{
               centre: :us_national_weather_service_ncep_wmc,
               sub_centre: :unknown,
               local_version: 1,
               significance_of_reference_time: :start_of_forecast,
               year: 2021,
               month: 12,
               day: 12,
               hour: 12,
               minute: 0,
               second: 0,
               production_status: :operational_products,
               type: :forecast_products
             } == section
    end

    test "it errors on an unrecognised section" do
      assert :error = Section1.parse(<<"NOTAGRIB">>)
    end
  end
end
