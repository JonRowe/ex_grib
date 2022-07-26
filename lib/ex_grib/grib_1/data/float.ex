defmodule ExGrib.Grib1.Data.Float do
  @moduledoc """
  GRIB edition 1 does not use the IEEE 754 floating point standard.
  Instead, it uses a leading sign bit (s), a 7-bit exponent (A), and
  a 24-bit significand (B).  The represented value is then given by:

  R = (-1)^s * 2^-24 * B * 16^(A - 64)
  """

  def parse(
        <<s::integer-size(1)-unit(1), a::integer-size(7)-unit(1), b::integer-size(24)-unit(1)>>
      ) do
    -1 ** s * 2 ** -24 * b * 16 ** (a - 64)
  end
end
