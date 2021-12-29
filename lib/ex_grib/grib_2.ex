defmodule ExGrib.Grib2 do
  @moduledoc """
  Functions for working with Grib2 files.

  See: https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/
  """

  alias ExGrib.Grib2.Section0
  alias ExGrib.Grib2.Section1
  alias ExGrib.Grib2.Section3

  @type section_number :: integer()
  @type section_size :: integer()

  @spec header(Section0.input()) :: Section0.t()
  def header(input), do: Section0.parse(input)

  @spec identification(Section1.input()) :: Section1.t()
  def identification(input), do: Section1.parse(input)

  @spec local_use(binary()) :: {:ok, binary()} | :error
  def local_use(<<section_size::integer-size(32), 2, possibly_reserved::binary()>>) do
    if section_size > 0 do
      size_to_skip = section_size - 5
      <<_skip::binary-size(size_to_skip), rest::binary()>> = possibly_reserved
      {:ok, rest}
    else
      {:ok, possibly_reserved}
    end
  end

  # local use is sometimes missing
  def local_use(<<_section_size::integer-size(32), 3, _::binary>> = rest) do
    {:ok, rest}
  end

  def local_use(_), do: :error

  @spec grid_definition(Section3.input()) :: Section3.t()
  def grid_definition(binary), do: Section3.parse(binary)
end
