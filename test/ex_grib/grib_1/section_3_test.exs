defmodule ExGrib.Grib1.Section3Test do
  use ExUnit.Case, async: true

  doctest ExGrib.Grib1.Section3

  alias ExGrib.Grib1.Section3

  import ExGrib.Test.File, only: [file_contents: 2]

  describe "parse/1" do
    test "it returns bitmap" do
      # This is junk because this grib doesn't contain a bitmap...
      assert {:ok, %Section3{}, _} =
               Section3.parse(file_contents("forecast.grb", skip: [octets: 68]))
    end

    test "it errors on an unrecognised section" do
      assert :error = Section3.parse(<<"NOPE">>)
    end
  end
end
