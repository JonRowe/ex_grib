defmodule ExGrib.Grib1.Table9 do
  @moduledoc """
  Spectral data representation type

  https://apps.ecmwf.int/codes/grib/format/grib1/ctable/9/
  """

  @type id :: integer()
  @type t ::
          :associated_legendre_polynomials_of_the_first_kind_with_normalization_such_that_the_integral_equals_one

  @spec get(id()) :: t()
  def get(1),
    do:
      :associated_legendre_polynomials_of_the_first_kind_with_normalization_such_that_the_integral_equals_one
end
