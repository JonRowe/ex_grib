defmodule ExGrib.Grib1.Section5Test do
  use ExUnit.Case, async: true

  doctest ExGrib.Grib1.Section5

  alias ExGrib.Grib1.Section5

  describe "parse/1" do
    test "it returns for the end of file" do
      assert {:ok, :end_of_file} == Section5.parse("7777")
    end

    test "it returns more data for the end of message" do
      assert {:ok, :more_data, "abc"} == Section5.parse("7777abc")
    end

    test "it returns error for gibberish" do
      assert :error == Section5.parse("711")
    end
  end
end
