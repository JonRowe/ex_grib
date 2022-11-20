defmodule ExGrib.Grib2.Section0Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib2.Section0

  import ExGrib.Test.File, only: [file_contents: 1]

  describe "parse/1" do
    test "it returns the header of the grib" do
      assert {:ok, %Section0{discipline: :meteorological, file_size: 188}, _} =
               Section0.parse(file_contents("gfs_25km.grb2"))
    end

    test "it errors on unrecognised headers" do
      assert :error = Section0.parse(<<"NOTAGRIB">>)
    end
  end
end
