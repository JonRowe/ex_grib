defmodule ExGrib.Grib1.Section0 do
  @moduledoc """
  Section 0 contains the header for a Grib file.

  Indicator section

  https://apps.ecmwf.int/codes/grib/format/grib1/sections/0/
  """

  @type file_size :: integer()
  @type input :: binary()
  @type t :: {:ok, %__MODULE__{file_size: file_size()}, binary()} | :error

  defstruct file_size: :not_parsed

  @spec parse(input()) :: t()
  def parse(<<
        "GRIB",
        file_size::integer-size(24),
        1,
        rest::binary
      >>) do
    {:ok, %__MODULE__{file_size: file_size}, rest}
  end

  def parse(_), do: :error
end
