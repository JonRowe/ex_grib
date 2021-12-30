defmodule ExGrib.Grib2.Section4.WindGeneratedWaveSpectralDescription do
  @moduledoc """
  Table 4.235

  Wind generated wave spectral description

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-235.shtml
  """

  @type id :: integer()
  @type t ::
          :generalized_partition
          | :total_wave_spectrum
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  # Total Wave Spectrum (combined wind waves and swell)
  def get(0), do: :total_wave_spectrum
  def get(1), do: :generalized_partition
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
