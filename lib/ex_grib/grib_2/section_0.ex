defmodule ExGrib.Grib2.Section0 do
  @moduledoc """
  Section 0 contains the header for a Grib file.

  Indicator section

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_sect0.shtml
  """

  alias ExGrib.Grib2.Section0.Discipline

  defstruct discipline: :not_parsed, file_size: :not_parsed

  @type file_size :: integer()
  @type input :: binary()
  @type t ::
          {:ok, %__MODULE__{discipline: Discipline.t(), file_size: file_size()}, binary()}
          | :error

  @spec parse(input()) :: t()
  def parse(<<
        "GRIB",
        _reserved::binary-size(2),
        discipline,
        2,
        file_size::integer-size(64),
        rest::binary
      >>) do
    {:ok, %__MODULE__{discipline: Discipline.get(discipline), file_size: file_size}, rest}
  end

  def parse(_), do: :error
end
