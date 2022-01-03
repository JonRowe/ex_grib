defmodule ExGrib.Grib2.Section5.DataRepresentationTemplateNumber do
  @moduledoc """
  Table 5.0

  Data representation template number

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table5-0.shtml
  """

  alias ExGrib.Grib2.Section5.Templates

  @type id :: integer()
  @type t ::
          Templates.GridPointDataComplexPacking
          | Templates.GridPointDataComplexPackingAndSpatialDifferencing
          | Templates.GridPointDataIeeeFloatingPointData
          | Templates.GridPointDataJpeg
          | Templates.GridPointDataPngCompression
          | Templates.GridPointDataSimplePacking
          | Templates.GridPointDataSimplePackingWithLogarithmPreProcessing
          | Templates.MatrixValueAtGridPointSimplePacking
          | Templates.RunLengthPackingWithLevelValues
          | Templates.SpectralDataComplexPacking
          | Templates.SpectralDataSimplePacking
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  # Grid Point Data - Simple Packing (see Template 5.0)
  def get(0), do: Templates.GridPointDataSimplePacking
  # Matrix Value at Grid Point - Simple Packing (see Template 5.1)
  def get(1), do: Templates.MatrixValueAtGridPointSimplePacking
  # Grid Point Data - Complex Packing (see Template 5.2)
  def get(2), do: Templates.GridPointDataComplexPacking
  # Grid Point Data - Complex Packing and Spatial Differencing (see Template 5.3)
  def get(3), do: Templates.GridPointDataComplexPackingAndSpatialDifferencing
  # Grid Point Data - IEEE Floating Point Data (see Template 5.4)
  def get(4), do: Templates.GridPointDataIeeeFloatingPointData
  def get(n) when n >= 5 and n <= 39, do: :reserved
  # Grid Point Data - JPEG2000 Compression (see Template 5.40)
  def get(40), do: Templates.GridPointDataJpeg
  # Grid Point Data - PNG Compression (see Template 5.41)
  def get(41), do: Templates.GridPointDataPngCompression
  def get(n) when n >= 42 and n <= 49, do: :reserved
  # Spectral Data - Simple Packing (see Template 5.50)
  def get(50), do: Templates.SpectralDataSimplePacking
  # Spectral Data - Complex Packing (see Template 5.51)
  def get(51), do: Templates.SpectralDataComplexPacking
  def get(n) when n >= 52 and n <= 60, do: :reserved
  # Grid Point Data - Simple Packing With Logarithm Pre-processing (see Template 5.61)
  def get(61), do: Templates.GridPointDataSimplePackingWithLogarithmPreProcessing
  def get(n) when n >= 62 and n <= 199, do: :reserved
  # Run Length Packing With Level Values (see Template 5.200)
  def get(200), do: Templates.RunLengthPackingWithLevelValues
  def get(n) when n >= 201 and n <= 49151, do: :reserved
  def get(n) when n >= 49152 and n <= 65534, do: :reserved_for_local_use
  def get(65535), do: :missing
end
