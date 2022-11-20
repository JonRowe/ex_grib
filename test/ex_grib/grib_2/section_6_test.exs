defmodule ExGrib.Grib2.Section6Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib2.Section6

  import ExGrib.Test.File, only: [file_contents: 2]

  describe "parse/1" do
    test "it returns bitmap data" do
      assert {:ok, %Section6{bit_map_data: "bitmap", bit_map_indicator: :bit_map_attached},
              "rest"} = Section6.parse(<<0, 0, 0, 12, 6, 0, "bitmap", "rest">>)
    end

    test "a grib with no bitmap will skip the bitmap data" do
      assert {:ok, %Section6{bit_map_data: :none, bit_map_indicator: :bit_map_does_not_apply}, _} =
               Section6.parse(file_contents("gfs_25km.grb2", skip: [octets: 164]))
    end

    test "it errors on an unrecognised section" do
      assert :error = Section6.parse(<<"NOTAGRIB">>)
    end
  end
end
