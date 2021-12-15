defmodule ExGrib.Grib2 do
  @moduledoc """
  Functions for working with Grib2 files.

  See: https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/
  """

  alias ExGrib.Grib2.Discipline

  @spec header(binary()) :: {:ok, atom(), integer(), binary()} | :error
  def header(
        <<"GRIB", _reserved::binary-size(2), discipline, 2, file_size::integer-size(64),
          rest::binary>>
      ) do
    {:ok, Discipline.get(discipline), file_size, rest}
  end

  def header(_), do: :error
end
