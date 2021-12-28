defmodule ExGrib.Grib2.Section3.ResolutionAndComponentFlags do
  @moduledoc """
  Table 3.3

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-3.shtml
  """

  @type input :: binary()
  @type t ::
          {:i_direction_increments_not_given
           | :i_direction_increments_given,
           :j_direction_increments_not_given
           | :j_direction_increments_given, :uv_relative_to_east_and_north | :uv_relative_to_xy}
          | :error

  @spec get(input()) :: t()
  def get(
        <<_::bits-size(1), _::bits-size(1), i::integer-size(1), j::integer-size(1),
          uv::integer-size(1), 0, 0, 0>>
      ) do
    {i_direction_increments(i), j_direction_increments(j), uv_relative(uv)}
  end

  def get(_), do: :error

  defp i_direction_increments(0), do: :i_direction_increments_not_given
  defp i_direction_increments(1), do: :i_direction_increments_given

  defp j_direction_increments(0), do: :j_direction_increments_not_given
  defp j_direction_increments(1), do: :j_direction_increments_given

  defp uv_relative(0), do: :uv_relative_to_east_and_north
  defp uv_relative(1), do: :uv_relative_to_xy
end
