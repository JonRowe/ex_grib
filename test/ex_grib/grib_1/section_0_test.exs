defmodule ExGrib.Grib1.Section0Test do
  use ExUnit.Case, async: true

  doctest ExGrib.Grib1.Section0

  alias ExGrib.Grib1.Section0

  import ExGrib.Test.File, only: [file_contents: 1]

  describe "parse/1" do
    test "it returns the header of the grib" do
      assert {:ok, %Section0{file_size: 7526}, _} = Section0.parse(file_contents("forecast.grb"))
    end

    test "it errors on unrecognised headers" do
      assert :error = Section0.parse(<<"NOTAGRIB">>)
    end
  end
end
