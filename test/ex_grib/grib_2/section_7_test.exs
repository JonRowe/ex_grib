defmodule ExGrib.Grib2.Section7Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib2.Section7

  import ExGrib.Test.File, only: [file_contents: 2]

  describe "parse/1" do
    test "it returns data" do
      assert {:ok, %Section7{}, _} =
               Section7.parse(file_contents("gfs_25km.grb2", skip: [octets: 170]))
    end

    test "it errors on an unrecognised section" do
      assert :error = Section7.parse(<<"NOTAGRIB">>)
    end
  end
end
