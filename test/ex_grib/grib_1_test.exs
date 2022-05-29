defmodule ExGrib.Grib1Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib1
  alias ExGrib.Grib1.Section0

  import ExGrib.Test.File, only: [file_contents: 1]

  doctest ExGrib.Grib1

  describe "header/1" do
    test "it returns the header of the grib" do
      assert {:ok, %Section0{file_size: 7526}, _} = Grib1.header(file_contents("forecast.grb"))
    end

    test "it errors on unrecognised headers" do
      assert :error = Grib1.header(<<"NOTAGRIB">>)
    end
  end
end
