defmodule ExGrib.Grib1.Packing.SimpleTest do
  use ExUnit.Case, async: true

  alias ExGrib.Grib1.Packing.Simple
  alias ExGrib.Grib1.Section4
  alias ExGrib.Grib1.Table11

  describe "parse/4" do
    @table_11_float %Table11{int_or_float: :float}
    @table_11_int %Table11{int_or_float: :int}

    @section_4 %Section4{
      bits_per_value: 10,
      binary_scale_factor: -6,
      data_flag: @table_11_float,
      reference_value: 279.864990234375
    }

    @section_4_16bit %Section4{bits_per_value: 16, data_flag: @table_11_float}
    @section_4_int %Section4{@section_4 | data_flag: @table_11_int}

    test "it can suppress transforming values" do
      assert Simple.parse(@section_4, <<440::size(10)>>, 0, transform: false) == [
               <<440::size(10)>>
             ]
    end

    test "it transforms float values according to the reference value" do
      assert Simple.parse(@section_4, <<440::size(10)>>, 0) == [286.739990234375]
      assert Simple.parse(@section_4, <<440::size(10)>>, 1) == [28.6739990234375]

      assert Simple.parse(@section_4, <<440::size(10), 448::size(10)>>, 0) == [
               286.739990234375,
               286.864990234375
             ]
    end

    test "it transforms int values according to the rounded reference value" do
      assert Simple.parse(@section_4_int, <<448::size(10)>>, 0) == [287]

      # Note only the reference value is rounded so a float value would still produce a float
      assert Simple.parse(@section_4_int, <<440::size(10)>>, 0) == [286.875]
    end

    test "it translates 16bit infinity" do
      assert Simple.parse(@section_4_16bit, <<0b1111110101010101::size(16)>>, 0) == [
               :infinity
             ]
    end

    test "it translates 16bit nan" do
      assert Simple.parse(@section_4_16bit, <<0b0111110101010101::size(16)>>, 0) == [:nan]
    end

    test "it handles left over bits" do
      assert Simple.parse(%Section4{bits_per_value: 10}, <<0b0000>>, 0) == []
    end
  end
end
