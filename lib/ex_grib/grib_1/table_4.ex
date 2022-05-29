defmodule ExGrib.Grib1.Table4 do
  @moduledoc """
  Unit of time

  https://apps.ecmwf.int/codes/grib/format/grib1/ctable/4/
  """

  @type id :: integer()
  @type t ::
          :century
          | :day
          | :decade
          | :half_an_hour
          | :hour
          | :minute
          | :month
          | :normal
          | :quarter_of_an_hour
          | :reserved
          | :second
          | :six_hours
          | :three_hours
          | :twelve_hours
          | :year

  @spec get(id()) :: t()
  def get(0), do: :minute
  def get(1), do: :hour
  def get(2), do: :day
  def get(3), do: :month
  def get(4), do: :year
  def get(5), do: :decade
  # 30 years
  def get(6), do: :normal
  def get(7), do: :century
  def get(n) when n in [8, 9], do: :reserved
  def get(10), do: :three_hours
  def get(11), do: :six_hours
  def get(12), do: :twelve_hours
  def get(13), do: :quarter_of_an_hour
  def get(14), do: :half_an_hour
  def get(n) when n >= 15 and n <= 253, do: :reserved
  def get(254), do: :second
end
