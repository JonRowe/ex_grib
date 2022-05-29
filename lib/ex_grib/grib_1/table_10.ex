defmodule ExGrib.Grib1.Table10 do
  @moduledoc """
  Spectral data representation mode

  https://apps.ecmwf.int/codes/grib/format/grib1/ctable/10/
  """

  @type id :: integer()
  @type t :: :complex_packing | :indicates_spherical_harmonics_with_complex_packing

  @spec get(id()) :: t()
  # The complex numbers Xmn (see code figure 1, Code table 9 above) are stored for m >= 0
  # as pairs of real numbers Re(Xmn), Im(Xmn) ordered with n increasing from m to N(m),
  # first for m = 0 and then for m = 1, 2, . . . M.
  #
  # The real part of the (0.0) coefficient is stored in octets 12–15 of the Binary data
  # section. The imaginary part of the (0.0) coefficient and the remaining coefficients
  # are packed, and are stored in octets 16 onwards of the Binary data section. 
  def get(1), do: :complex_packing
  def get(2), do: :indicates_spherical_harmonics_with_complex_packing
end
