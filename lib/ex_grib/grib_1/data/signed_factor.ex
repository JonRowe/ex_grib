defmodule ExGrib.Grib1.Data.SignedFactor do
  @moduledoc """
  These values use 1 in the leading bit to indicate negative values but
  are otherwise straightforward integers.
  """

  @spec parse(binary()) :: integer()
  def parse(<<0::size(1)-unit(1), value::integer-size(15)-unit(1)>>), do: value
  def parse(<<1::size(1)-unit(1), value::integer-size(15)-unit(1)>>), do: -1 * value
end
