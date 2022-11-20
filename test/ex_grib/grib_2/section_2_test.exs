defmodule ExGrib.Grib2.Section2Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib2.Section2

  import ExGrib.Test.File, only: [file_contents: 2]

  describe "parse/1" do
    test "it captures the local use section" do
      assert {:ok, %Section2{local: "LOCAL"}, "NEXT"} =
               Section2.parse(<<0, 0, 0, 10, 2, "LOCAL", "NEXT">>)
    end

    test "it works with our sample file" do
      file = file_contents("gfs_25km.grb2", skip: [octets: 37])
      {:ok, :not_present, ^file} = Section2.parse(file)
    end

    test "it errors on an unrecognised section" do
      assert :error = Section2.parse(<<"NOTAGRIB">>)
    end
  end
end
