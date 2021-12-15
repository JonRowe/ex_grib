defmodule ExGrib.Grib2 do
  @moduledoc """
  Functions for working with Grib2 files.

  See: https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/
  """

  @spec header(binary()) :: {:ok, atom(), integer(), binary()} | :error
  def header(
        <<"GRIB", _reserved::binary-size(2), discipline, 2, file_size::integer-size(64),
          rest::binary>>
      ) do
    {:ok, match_discipline(discipline), file_size, rest}
  end

  def header(_), do: :error

  defp match_discipline(0), do: :meteorological
  defp match_discipline(1), do: :hydrological
  defp match_discipline(2), do: :land_surface
  defp match_discipline(3), do: :satellite_remote_sensing
  defp match_discipline(4), do: :space_weather
  defp match_discipline(n) when n >= 5 and n <= 9, do: :reserved
  defp match_discipline(10), do: :oceanographic
  defp match_discipline(n) when n >= 11 and n <= 191, do: :reserved
  defp match_discipline(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  defp match_discipline(255), do: :missing
end
