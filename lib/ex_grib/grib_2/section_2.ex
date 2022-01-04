defmodule ExGrib.Grib2.Section2 do
  @moduledoc """
  Section 2 is reserved for local use.

  Local use section

  Notes:

  1. Center=7 (NCEP), subcenter=14(NWS Meteorological Development Laboratory (MDL))
    uses octet 6 to indicate which local use table to use.

    For MDL, octet 6=1 indicates use: "MDL Template 2.1"

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_sect2.shtml
  """

  defstruct local: :not_parsed

  @type input :: binary()
  @type t :: {:ok, %__MODULE__{local: binary() | :none} | :not_present, binary()} | :error

  @spec parse(input()) :: t()
  def parse(<<section_size::integer-size(32), 2, possibly_reserved::binary()>>) do
    if section_size > 0 do
      local_size = section_size - 5
      <<local::binary-size(local_size), rest::binary()>> = possibly_reserved
      {:ok, %__MODULE__{local: local}, rest}
    else
      {:ok, %__MODULE__{local: :none}, possibly_reserved}
    end
  end

  # local use is sometimes missing
  def parse(<<_section_size::integer-size(32), n, _::binary>> = rest) when n > 2 and n < 9 do
    {:ok, :not_present, rest}
  end

  def parse(_), do: :error
end
