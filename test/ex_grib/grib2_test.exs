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

      {:ok, 21, 1, _, :unknown, 1, _, 2021, 12, 12, 12, 0, 0, _, _, _} =
        Grib2.identification(rest)
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.identification(<<"NOTAGRIB">>)
    end
  end

  describe "local_use/1" do
    test "it skips the local use section" do
      assert {:ok, "NEXT"} = Grib2.local_use(<<0, 0, 0, 10, 2, "LOCAL", "NEXT">>)
    end

    test "it works with our sample file" do
      {:ok, _, _, next} = Grib2.header(file_contents("gfs_25km.grb2"))
      {:ok, _, _, _, _, _, _, _, _, _, _, _, _, _, _, rest} = Grib2.identification(next)
      {:ok, ^rest} = Grib2.local_use(rest)
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.local_use(<<"NOTAGRIB">>)
    end
  end
end
