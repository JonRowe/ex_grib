defmodule ExGrib.Grib2.Section3.SpectralDataRepresentationType do
  @moduledoc """
  Table 3.6

  Spectral data representation type

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-6.shtml
  """

  @type input :: integer()
  @type t :: :legendre | :bi_fourier | :error

  @spec get(input()) :: t()
  def get(1), do: :legendre
  def get(2), do: :bi_fourier
  def get(_), do: :error
end
