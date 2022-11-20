defmodule ExGrib.Grib1.Packing.Simple do
  @moduledoc """
  """

  def parse(section, binary, decimal_scale_factor, opts \\ [])

  def parse(%{bits_per_value: n} = section, binary, d, opts) when byte_size(binary) * 8 >= n do
    <<raw_value::binary-size(n)-unit(1), rest::binary()-unit(1)>> = binary

    [
      parse_chunk(raw_value, section, d, Keyword.get(opts, :transform, true))
      | parse(section, rest, d, opts)
    ]
  end

  def parse(_, _, _, _), do: []

  defp transform(
         <<0b111111::size(6), _::integer-size(10)>>,
         %{data_flag: %{int_or_float: :float}},
         _
       ),
       do: :infinity

  defp transform(
         <<0b011111::size(6), _::integer-size(10)>>,
         %{data_flag: %{int_or_float: :float}},
         _
       ),
       do: :nan

  # The actual value Y (in the units of Code table 2) is linked to the coded value X,
  # the reference value R, the binary scale factor E and the decimal scale factor D by means of the following formula:
  #
  # Y × 10D = R + X × 2^E
  defp transform(
         raw,
         %{
           bits_per_value: n,
           reference_value: raw_r,
           data_flag: %{int_or_float: int_or_float},
           binary_scale_factor: e
         },
         d
       ) do
    <<x::integer-size(n)-unit(1)>> = raw

    r =
      case int_or_float do
        :int -> round(raw_r)
        :float -> raw_r
      end

    y_10d = r + x * 2.0 ** e
    y_10d / 10 ** d
  end

  defp parse_chunk(raw_value, _section, _d, false), do: raw_value
  defp parse_chunk(raw_value, section, d, true), do: transform(raw_value, section, d)
end
