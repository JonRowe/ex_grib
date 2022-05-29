defmodule ExGrib.Grib1 do
  @moduledoc """
  Functions for working with Grib1 files.
  """

  alias ExGrib.Grib1.Section0

  @spec header(Section0.input()) :: Section0.t()
  def header(input), do: Section0.parse(input)
end
