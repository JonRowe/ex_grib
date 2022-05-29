defmodule ExGrib.Grib1.Table1 do
  @moduledoc """
  Flags relative to section 2 and 3

  https://apps.ecmwf.int/codes/grib/format/grib1/flag/1/
  """

  @type id :: binary()
  @type t :: %__MODULE__{section_2: ommited_or_included(), section_3: ommited_or_included()}
  @type ommited_or_included :: :ommited | :included

  defstruct section_2: :not_parsed, section_3: :not_parsed

  @spec get(id()) :: t()
  def get(<<section_2::integer-size(1), section_3::integer-size(1), _other::integer-size(6)>>) do
    %__MODULE__{section_2: ommited?(section_2), section_3: ommited?(section_3)}
  end

  defp ommited?(0), do: :ommited
  defp ommited?(1), do: :included
end
