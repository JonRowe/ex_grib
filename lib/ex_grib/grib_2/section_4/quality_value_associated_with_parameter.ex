defmodule ExGrib.Grib2.Section4.QualityValueAssociatedWithParameter do
  @moduledoc """
  Table 4.16

  Quality value associated with parameter

  Notes:

  (1) When a non-missing value is used from this code table, the original data value is a quality value associated
      with the parameter defined by octets 10 and 11 of the product definition template.
  (2) The original data value is a non-dimensional number from 0 to 1, where 0 indicates no confidence and 1
      indicates maximal confidence.
  (3) The original data value is defined by Code table 4.244 Table 244
  (4) The original data value is a non-dimensional number without units.
  (5) The original data value is in the same units as the parameter defined by
      octets 10 and 11 of the product definition template.


  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-16.shtml
  """

  @type id :: integer()
  @type t ::
          :confidence_index
          | :correlation_of_product_with_used_calibration_product
          | :quality_indicator
          | :random_error
          | :standard_deviation
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  # Confidence index (see Note 2)
  def get(0), do: :confidence_index
  # Quality indicator (see Note 3 and see Code Table 244)
  def get(1), do: :quality_indicator
  # Correlation of Product with used Calibration Product (see Note 4)
  def get(2), do: :correlation_of_product_with_used_calibration_product
  # Standard deviation (see Note 5)
  def get(3), do: :standard_deviation
  # Random error (see Note 5)
  def get(4), do: :random_error
  def get(n) when n >= 5 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
