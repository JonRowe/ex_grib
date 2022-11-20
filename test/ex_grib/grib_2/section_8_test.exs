defmodule ExGrib.Grib2.Section8Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib2.Section8

  import ExGrib.Test.File, only: [file_contents: 2]

  describe "parse/1" do
    test "it returns :ok if a valid end of file" do
      assert {:ok, :end_of_file} = Section8.parse("7777")
    end

    test "it returns {:ok, :more_data, data} if a valid end of grib but not end of file" do
      assert {:ok, :more_data, _} =
               Section8.parse(file_contents("gfs_25km.grb2", skip: [octets: 184]))
    end

    test "it errors on an unrecognised section" do
      assert :error = Section8.parse(<<"NOTAGRIB">>)
    end
  end
end
