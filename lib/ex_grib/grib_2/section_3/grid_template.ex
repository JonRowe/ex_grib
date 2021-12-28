defmodule ExGrib.Grib2.Section3.GridTemplate do
  @moduledoc """
  Table 3.1

  Returns the grib template to use based on the grib template number.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-1.shtml
  """

  alias ExGrib.Grib2.Section3.Templates

  @type id :: integer()
  @type t ::
          Templates.AlbersEqualArea
          | Templates.AzimuthRangeProjection
          | Templates.CrossSectionGridWithPointsEquallySpacedOnTheHorizontal
          | Templates.CubedSphereGnomonic
          | Templates.CurvilinearOrthogonalGrids
          | Templates.EquatorialAzimuthalEquidistantProjection
          | Templates.GaussianLatitudeLongitude
          | Templates.GeneralUnstructuredGrid
          | Templates.HovmollerDiagramWithPointsEquallySpacedOnTheHorizontal
          | Templates.LambertAzimuthalEqualAreaProjection
          | Templates.LambertConformal
          | Templates.LambertConformalWithModellingSubdomainsDefinition
          | Templates.Mercator
          | Templates.MercatorWithModellingSubdomainsDefinition
          | Templates.LatitudeLongitude
          | Templates.PolarStereographicProjection
          | Templates.PolarStereographicWithModellingSubdomainsDefinition
          | Templates.RotateLatitudeLongitude
          | Templates.RotatedGaussianLatitudeLongitude
          | Templates.RotatedSphericalHarmonicCoefficients
          | Templates.SpaceViewPerspectiveOrOrthographic
          | Templates.SpectralLambertConformalWithModellingSubdomainsDefinition
          | Templates.SpectralMercatorWithModellingSubdomainsDefinition
          | Templates.SpectralPolarStereographicWithModellingSubdomainsDefinition
          | Templates.SphericalHarmonicCoefficients
          | Templates.StretchedAndRotateLatitudeLongitude
          | Templates.StretchedAndRotatedGaussianLatitudeLongitude
          | Templates.StretchedAndRotatedSphericalHarmonicCoefficients
          | Templates.StretchedGaussianLatitudeLongitude
          | Templates.StretchedLatitudeLongitude
          | Templates.StretchedSphericalHarmonicCoefficients
          | Templates.TimeSectionGrid
          | Templates.TransverseMercator
          | Templates.TriangularGridBasedOnAnIcosahedron
          | Templates.VariableResolutionLatitudeLongitude
          | Templates.VariableResolutionRotatedLatitudeLongitude
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  # See Template 3.0. Also called Equidistant Cylindrical or Plate Caree.
  def get(0), do: Templates.LatitudeLongitude
  # See Template 3.1.
  def get(1), do: Templates.RotateLatitudeLongitude
  # See Template 3.2.
  def get(2), do: Templates.StretchedLatitudeLongitude
  # See Template 3.3.
  def get(3), do: Templates.StretchedAndRotateLatitudeLongitude
  # See Template 3.4.
  def get(4), do: Templates.VariableResolutionLatitudeLongitude
  # See Template 3.5.
  def get(5), do: Templates.VariableResolutionRotatedLatitudeLongitude
  def get(n) when n >= 6 and n <= 9, do: :reserved
  # See Template 3.10.
  def get(10), do: Templates.Mercator
  def get(11), do: :reserved
  # See Template 3.12.
  def get(12), do: Templates.TransverseMercator
  # See Template 3.13.
  def get(13), do: Templates.MercatorWithModellingSubdomainsDefinition
  def get(n) when n >= 14 and n <= 19, do: :reserved
  # See Template 3.20. Can be North or South.
  def get(20), do: Templates.PolarStereographicProjection
  def get(n) when n >= 21 and n <= 22, do: :reserved
  # See Template 3.23.
  def get(23), do: Templates.PolarStereographicWithModellingSubdomainsDefinition
  def get(n) when n >= 24 and n <= 29, do: :reserved
  # See Template 3.30. Can be Secant, Tangent, Conical, or Bipolar.
  def get(30), do: Templates.LambertConformal
  # See Template 3.31.
  def get(31), do: Templates.AlbersEqualArea
  def get(32), do: :reserved
  # See Template 3.33.
  def get(33), do: Templates.LambertConformalWithModellingSubdomainsDefinition
  def get(n) when n >= 34 and n <= 39, do: :reserved
  # See Template 3.40.
  def get(40), do: Templates.GaussianLatitudeLongitude
  # See Template 3.41.
  def get(41), do: Templates.RotatedGaussianLatitudeLongitude
  # See Template 3.42.
  def get(42), do: Templates.StretchedGaussianLatitudeLongitude
  # See Template 3.43.
  def get(43), do: Templates.StretchedAndRotatedGaussianLatitudeLongitude
  def get(n) when n >= 44 and n <= 49, do: :reserved
  # See Template 3.50.
  def get(50), do: Templates.SphericalHarmonicCoefficients
  # See Template 3.51.
  def get(51), do: Templates.RotatedSphericalHarmonicCoefficients
  # See Template 3.52.
  def get(52), do: Templates.StretchedSphericalHarmonicCoefficients
  # See Template 3.53.
  def get(53), do: Templates.StretchedAndRotatedSphericalHarmonicCoefficients
  def get(n) when n >= 54 and n <= 59, do: :reserved
  # See Template 3.60.
  def get(60), do: Templates.CubedSphereGnomonic
  # See Template 3.61.
  def get(61), do: Templates.SpectralMercatorWithModellingSubdomainsDefinition
  # See Template 3.62.
  def get(62), do: Templates.SpectralPolarStereographicWithModellingSubdomainsDefinition
  # See Template 3.63.
  def get(63), do: Templates.SpectralLambertConformalWithModellingSubdomainsDefinition
  def get(n) when n >= 64 and n <= 89, do: :reserved
  # See Template 3.90.
  def get(90), do: Templates.SpaceViewPerspectiveOrOrthographic
  def get(n) when n >= 91 and n <= 99, do: :reserved
  # See Template 3.100.
  def get(100), do: Templates.TriangularGridBasedOnAnIcosahedron
  # see Template 3.101.
  def get(101), do: Templates.GeneralUnstructuredGrid
  def get(n) when n >= 102 and n <= 109, do: :reserved
  # See Template 3.110.
  def get(110), do: Templates.EquatorialAzimuthalEquidistantProjection
  def get(n) when n >= 111 and n <= 119, do: :reserved
  # See Template 3.120.
  def get(120), do: Templates.AzimuthRangeProjection
  def get(n) when n >= 121 and n <= 139, do: :reserved
  # See Template 3.140.
  def get(140), do: Templates.LambertAzimuthalEqualAreaProjection
  def get(n) when n >= 141 and n <= 203, do: :reserved
  # See Template 3.204.
  def get(204), do: Templates.CurvilinearOrthogonalGrids
  def get(n) when n >= 205 and n <= 999, do: :reserved
  # See Template 3.1000.
  def get(1000), do: Templates.CrossSectionGridWithPointsEquallySpacedOnTheHorizontal
  def get(n) when n >= 1001 and n <= 1099, do: :reserved
  # See Template 3.1100.
  def get(1100), do: Templates.HovmollerDiagramWithPointsEquallySpacedOnTheHorizontal
  def get(n) when n >= 1101 and n <= 1199, do: :reserved
  # See Template 3.1200.
  def get(1200), do: Templates.TimeSectionGrid
  def get(n) when n >= 1201 and n <= 32767, do: :reserved
  def get(n) when n >= 32768 and n <= 65534, do: :reserved_for_local_use
  # See Template 3.32768. Arakawa Staggered E-Grid.
  def get(32768), do: Templates.RotateLatitudeLongitude
  # See Template 3.32769. Arakawa Non-E Staggered Grid.
  def get(32769), do: Templates.RotateLatitudeLongitude
  def get(65535), do: :missing
end
