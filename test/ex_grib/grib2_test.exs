defmodule ExGrib.Grib2Test do
  use ExUnit.Case

  alias ExGrib.Grib2

  import ExGrib.Test.File, only: [file_contents: 1]

  doctest ExGrib.Grib2

  describe "header/1" do
    test "it returns the header of the grib" do
      assert {:ok, :meteorological, 188, _} = Grib2.header(file_contents("gfs_25km.grb2"))
    end

    test "it errors on unrecognised headers" do
      assert :error = Grib2.header(<<"NOTAGRIB">>)
    end
  end

  describe "identification/1" do
    test "it returns the identification details of the grib" do
      {:ok, _, _, rest} = Grib2.header(file_contents("gfs_25km.grb2"))

      {:ok, 21, 1, :us_national_weather_service_ncep_wmc, :unknown, 1, :start_of_forecast, 2021,
       12, 12, 12, 0, 0, :operational_products, :forecast_products,
       _} = Grib2.identification(rest)
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.identification(<<"NOTAGRIB">>)
    end
  end
end
