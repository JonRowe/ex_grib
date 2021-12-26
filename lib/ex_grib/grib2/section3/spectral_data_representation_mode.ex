defmodule ExGrib.Grib2.Section3.SpectralDataRepresentationMode do
  @moduledoc """
  Table 3.7

  Determines the mode of spectral data information, this will be 1 normally.

  The complex numbers Fnm (See Code Table 3.6) are stored for M>=0 as pairs of
  real numbers Re(Fnm), lm(Fnm) ordered with n increasing from m to N(m),
  first for m=0 and then for m=1, 2, ... M (see note below).

  Notes:

  1.  Values of N(m) for common truncation cases are as follows:

    Triangular:  M = J = K,    N(m) = J
    Rhomboidal:  K = J + M,    N(m) = J + m
    Trapezoidal: K = J, K > M, N(m) = J


  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-7.shtml
  """

  @type mode :: integer()
  @type t :: :set | :reserved | :missing

  @spec get(mode()) :: t()
  def get(1), do: :set
  def get(n) when n == 0 or (n >= 2 and n <= 254), do: :reserved
  def get(255), do: :missing
end
