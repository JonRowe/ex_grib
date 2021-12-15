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
end
