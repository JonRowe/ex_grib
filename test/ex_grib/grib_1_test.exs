defmodule ExGrib.Grib1Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib1
  alias ExGrib.Grib1.Section0

  import ExGrib.Test.File, only: [file_contents: 1]

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

  describe "parse/1" do
    test "it pulls out a grib" do
      assert {:ok, %Grib1{} = grib, _more_data} = Grib1.parse(file_contents("forecast.grb"))

      assert %Grib1{
               header: %Section0{file_size: 7526},
               grid_definition: :not_parsed,
               product_definition: :not_parsed,
               bitmap: :not_parsed,
               data: :not_parsed
             } = grib
    end
  end
end
