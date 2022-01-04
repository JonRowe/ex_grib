defmodule ExGrib.Grib2 do
  @moduledoc """
  Functions for working with Grib2 files.

  See: https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/
  """

  alias ExGrib.Grib2.Section0
  alias ExGrib.Grib2.Section1
  alias ExGrib.Grib2.Section2
  alias ExGrib.Grib2.Section3
  alias ExGrib.Grib2.Section4
  alias ExGrib.Grib2.Section5
  alias ExGrib.Grib2.Section6
  alias ExGrib.Grib2.Section7

  @type section_number :: integer()
  @type section_size :: integer()

  @spec header(Section0.input()) :: Section0.t()
  def header(input), do: Section0.parse(input)

  @spec identification(Section1.input()) :: Section1.t()
  def identification(input), do: Section1.parse(input)

  @spec local_use(Section2.input()) :: Section2.t()
  def local_use(input), do: Section2.parse(input)

  @spec grid_definition(Section3.input()) :: Section3.t()
  def grid_definition(binary), do: Section3.parse(binary)

  @spec product_definition(Section4.input()) :: Section4.t()
  def product_definition(binary), do: Section4.parse(binary)

  @spec data_representation(Section5.input()) :: Section5.t()
  def data_representation(binary), do: Section5.parse(binary)

  @spec bitmap(Section6.input()) :: Section6.t()
  def bitmap(binary), do: Section6.parse(binary)

  @spec data(Section7.input()) :: Section7.t()
  def data(binary), do: Section7.parse(binary)
end
