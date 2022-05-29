defmodule ExGribTest do
  use ExUnit.Case

  alias ExGrib.Grib2

  doctest ExGrib

  import ExGrib.Test.File, only: [file_contents: 1]

  describe "parse_all/1" do
    test "it pulls out all the gribs" do
      assert {:ok, [%Grib2{} = grib | more_gribs]} =
               ExGrib.parse_all(file_contents("gfs_25km.grb2"))

      assert {:ok, ^grib, _more_data} = Grib2.parse(file_contents("gfs_25km.grb2"))

      assert length(more_gribs) == 2293
    end
  end
end
