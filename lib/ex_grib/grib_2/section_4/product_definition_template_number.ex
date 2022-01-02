defmodule ExGrib.Grib2.Section4.ProductDefinitionTemplateNumber do
  @moduledoc """
  Table 4.0

  Product definition template number

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-0.shtml
  """

  alias ExGrib.Grib2.Section4.Templates

  @type id :: integer()
  @type t ::
          Templates.AnalysisOrForecast
          | Templates.AnalysisOrForecastError
          | Templates.AnalysisOrForecastForAerosol
          | Templates.AnalysisOrForecastForAtmosphericChemicalConstituents
          | Templates.AnalysisOrForecastForAtmosphericChemicalConstituentsBasedOnADistributionFunction
          | Templates.AnalysisOrForecastForSimulate
          | Templates.AverageAccumulationAtIntervalsForAerosol
          | Templates.AverageAccumulationAtIntervalsForAtmosphericChemicalConstituents
          | Templates.AverageAccumulationAtIntervalsForAtmosphericChemicalConstituentsBasedOnADistributionFunction
          | Templates.AverageAccumulationAtIntervalsForSpatioTemporalChangingTiles
          | Templates.AverageAccumulationExtremeValuesAtIntervals
          | Templates.AverageAccumulationExtremeValuesOrOtherStatisticallyProcessedValuesOverASpatialArea
          | Templates.CategoricalForecast
          | Templates.CategoricalForecastAtIntervals
          | Templates.CcittIa
          | Templates.CrossSectionOfAnalysisAndForecastAtAPointInTime
          | Templates.CrossSectionOfAnalysisAndForecastAveragedOrOtherwiseStatisticallyProcessedOverLatitudeOrLongitude
          | Templates.CrossSectionOfAveragedOrOtherwiseStatisticallyProcessedAnalysisOrForecastOverARangeOfTime
          | Templates.DerivedForecastsBasedOnAClusterOfEnsembleMembersOverACircularArea
          | Templates.DerivedForecastsBasedOnAClusterOfEnsembleMembersOverACircularAreaAtIntervals
          | Templates.DerivedForecastsBasedOnAClusterOfEnsembleMembersOverARectangularArea
          | Templates.DerivedForecastsBasedOnAClusterOfEnsembleMembersOverARectangularAreaAtIntervals
          | Templates.DerivedForecastsBasedOnAllEnsembleMembers
          | Templates.DerivedForecastsBasedOnAllEnsembleMembersAtIntervals
          | Templates.HovmollerTypeGridWithAveragingOrOtherStatisticalProcessing
          | Templates.HovmollerTypeGridWithNoAveragingOrOtherStatisticalProcessing
          | Templates.IndividualEnsembleForecastControlAndPerturbed
          | Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervals
          | Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervalsForAerosol
          | Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervalsForAtmosphericChemicalConstituents
          | Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervalsForAtmosphericChemicalConstituentsBasedOnADistributionFunction
          | Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervalsForSimulated
          | Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervalsForSpatioTemporalChangingTiles
          | Templates.IndividualEnsembleForecastControlAndPerturbedForAtmosphericChemicalConstituents
          | Templates.IndividualEnsembleForecastControlAndPerturbedForOpticalPropertiesOfAerosol
          | Templates.IndividualEnsembleForecastControlAndPerturbedForPartitionedParameters
          | Templates.IndividualEnsembleForecastControlAndPerturbedForSimulated
          | Templates.IndividualEnsembleForecastControlAndPerturbedForSpatioTemporalChangingTileParameters
          | Templates.IndividualEnsembleForecastControlAndPerturbedIntervalForAtmosphericChemicalConstituentsBasedOnADistributionFunction
          | Templates.IndividualEnsembleReforecastControlAndPerturbed
          | Templates.IndividualEnsembleReforecastControlAndPerturbedAtIntervals
          | Templates.PartitionedParameters
          | Templates.PercentileForecasts
          | Templates.PercentileForecastsAtIntervals
          | Templates.PostProcessingAnalysisOrForecast
          | Templates.PostProcessingAverageAccumulationExtremeValuesAtIntervals
          | Templates.PostProcessingIndividualEnsembleForecastControlAndPerturbed
          | Templates.PostProcessingIndividualEnsembleForecastControlAndPerturbedAtIntervals
          | Templates.ProbabilityForecasts
          | Templates.ProbabilityForecastsAtIntervals
          | Templates.RadarProduct
          | Templates.SatelliteProduct
          | Templates.SatelliteProductWithOrWithoutAssociatedQualityValues
          | Templates.SpatioTemporalChangingTiles
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  # Analysis or forecast at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.0)
  def get(0), do: Templates.AnalysisOrForecast

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.1)
  def get(1), do: Templates.IndividualEnsembleForecastControlAndPerturbed

  # Derived forecasts based on all ensemble members at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.2)
  def get(2), do: Templates.DerivedForecastsBasedOnAllEnsembleMembers

  # Derived forecasts based on a cluster of ensemble members over a rectangular area at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.3)
  def get(3), do: Templates.DerivedForecastsBasedOnAClusterOfEnsembleMembersOverARectangularArea

  # Derived forecasts based on a cluster of ensemble members over a circular area at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.4)
  def get(4), do: Templates.DerivedForecastsBasedOnAClusterOfEnsembleMembersOverACircularArea

  # Probability forecasts at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.5)
  def get(5), do: Templates.ProbabilityForecasts

  # Percentile forecasts at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.6)
  def get(6), do: Templates.PercentileForecasts

  # Analysis or forecast error at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.7)
  def get(7), do: Templates.AnalysisOrForecastError

  # Average accumulation extreme values or other statistically processed values at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.8)
  def get(8), do: Templates.AverageAccumulationExtremeValuesAtIntervals

  # Probability forecasts at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.9)
  def get(9), do: Templates.ProbabilityForecastsAtIntervals

  # Percentile forecasts at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.10)
  def get(10), do: Templates.PercentileForecastsAtIntervals

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.11)
  def get(11), do: Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervals

  # Derived forecasts based on all ensemble members at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.12)
  def get(12), do: Templates.DerivedForecastsBasedOnAllEnsembleMembersAtIntervals

  # Derived forecasts based on a cluster of ensemble members over a rectangular area at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.13)
  def get(13),
    do: Templates.DerivedForecastsBasedOnAClusterOfEnsembleMembersOverARectangularAreaAtIntervals

  # Derived forecasts based on a cluster of ensemble members over a circular area at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.14)
  def get(14),
    do: Templates.DerivedForecastsBasedOnAClusterOfEnsembleMembersOverACircularAreaAtIntervals

  # Average accumulation extreme values or other statistically-processed values over a spatial area at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.15)
  def get(15),
    do:
      Templates.AverageAccumulationExtremeValuesOrOtherStatisticallyProcessedValuesOverASpatialArea

  def get(n) when n >= 16 and n <= 19, do: :reserved
  # Radar product  (see Template 4.20)
  def get(20), do: Templates.RadarProduct
  def get(n) when n >= 21 and n <= 29, do: :reserved

  # Satellite product  (see Template 4.30) NOTE: This template is deprecated. Template 4.31 should be used instead.
  def get(30), do: Templates.SatelliteProduct
  # Satellite product  (see Template 4.31)
  def get(31), do: Templates.SatelliteProduct

  # Analysis or forecast at a horizontal level or in a horizontal layer at a point in time for simulate (synthetic) satellite data (see Template 4.32)
  def get(32), do: Templates.AnalysisOrForecastForSimulate

  # Individual Ensemble Forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time for simulated (synthetic) satellite data (see Template 4.33)
  def get(33), do: Templates.IndividualEnsembleForecastControlAndPerturbedForSimulated

  # Individual Ensemble Forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous interval for simulated (synthetic) satellite data(see Template 4.34)
  def get(34), do: Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervalsForSimulated
  # Satellite product with or without associated quality values (see Template 4.35)
  def get(35), do: Templates.SatelliteProductWithOrWithoutAssociatedQualityValues
  def get(n) when n >= 36 and n <= 39, do: :reserved

  # Analysis or forecast at a horizontal level or in a horizontal layer at a point in time for atmospheric chemical constituents.  (see Template 4.40)
  def get(40), do: Templates.AnalysisOrForecastForAtmosphericChemicalConstituents

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time for atmospheric chemical constituents.  (see Template 4.41)
  def get(41),
    do: Templates.IndividualEnsembleForecastControlAndPerturbedForAtmosphericChemicalConstituents

  # Average accumulation and or extreme values or other statistically processed values at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for atmospheric chemical constituents.  (see Template 4.42)
  def get(42), do: Templates.AverageAccumulationAtIntervalsForAtmosphericChemicalConstituents

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for atmospheric chemical constituents.  (see Template 4.43)
  def get(43),
    do:
      Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervalsForAtmosphericChemicalConstituents

  # Analysis or forecast at a horizontal level or in a horizontal layer at a point in time for aerosol.  (see Template 4.44)
  def get(44), do: Templates.AnalysisOrForecastForAerosol

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for aerosol.  (see Template 4.45)
  def get(45), do: Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervalsForAerosol

  # Average accumulation and or extreme values or other statistically processed values at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for aerosol.  (see Template 4.46)
  def get(46), do: Templates.AverageAccumulationAtIntervalsForAerosol

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for aerosol.  (see Template 4.47)
  def get(47), do: Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervalsForAerosol

  # Analysis or forecast at a horizontal level or in a horizontal layer at a point in time for aerosol.  (see Template 4.48)
  def get(48), do: Templates.AnalysisOrForecastForAerosol

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time for optical properties of aerosol. (see Template 4.49)
  def get(49),
    do: Templates.IndividualEnsembleForecastControlAndPerturbedForOpticalPropertiesOfAerosol

  def get(50), do: :reserved

  # Categorical forecast at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.51)
  def get(51), do: Templates.CategoricalForecast
  def get(52), do: :reserved

  # Partitioned parameters at a horizontal level or horizontal layer at a point in time.  (see Template 4.53)
  def get(53), do: Templates.PartitionedParameters

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time for partitioned parameters.   (see Template 4.54)
  def get(54), do: Templates.IndividualEnsembleForecastControlAndPerturbedForPartitionedParameters

  # Spatio-temporal changing tiles at a horizontal level or horizontal layer at a point in time (see Template 4.55)
  def get(55), do: Templates.SpatioTemporalChangingTiles

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time for spatio-temporal changing tile parameters.   (see Template 4.56)
  def get(56),
    do:
      Templates.IndividualEnsembleForecastControlAndPerturbedForSpatioTemporalChangingTileParameters

  # Analysis or forecast at a horizontal level or in a horizontal layer at a point in time for atmospheric chemical constituents based on a distribution function (see Template 4.57)
  def get(57),
    do: Templates.AnalysisOrForecastForAtmosphericChemicalConstituentsBasedOnADistributionFunction

  # Individual Ensemble Forecast Control and Perturbed at a horizontal level or in a horizontal layer at a point in time interval for Atmospheric Chemical Constituents based on a distribution function (see Template 4.58)
  def get(58),
    do:
      Templates.IndividualEnsembleForecastControlAndPerturbedIntervalForAtmosphericChemicalConstituentsBasedOnADistributionFunction

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time for spatio-temporal changing tile parameters (corrected version of template 4.56 - See Template 4.59)
  def get(59),
    do:
      Templates.IndividualEnsembleForecastControlAndPerturbedForSpatioTemporalChangingTileParameters

  # Individual Ensemble Reforecast control and perturbed at a horizontal level or in a horizontal layer at a point in time. (see Template 4.60)
  def get(60), do: Templates.IndividualEnsembleReforecastControlAndPerturbed

  # Individual Ensemble Reforecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval (see Template 4.61)
  def get(61), do: Templates.IndividualEnsembleReforecastControlAndPerturbedAtIntervals

  # Average Accumulation and or Extreme values or other Statistically-processed values at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for spatio-temporal changing tiles at a horizontal level or horizontal layer at a point in time (see Template 4.62)
  def get(62), do: Templates.AverageAccumulationAtIntervalsForSpatioTemporalChangingTiles

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for spatio-temporal changing tiles (see Template 4.63)
  def get(63),
    do:
      Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervalsForSpatioTemporalChangingTiles

  def get(n) when n >= 64 and n <= 66, do: :reserved

  # Average accumulation and or extreme values or other statistically processed values at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for atmospheric chemical constituents based on a distribution function (see Template 4.67)
  def get(67),
    do:
      Templates.AverageAccumulationAtIntervalsForAtmosphericChemicalConstituentsBasedOnADistributionFunction

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for atmospheric chemical constituents based on a distribution function. (see Template 4.68)
  def get(68),
    do:
      Templates.IndividualEnsembleForecastControlAndPerturbedAtIntervalsForAtmosphericChemicalConstituentsBasedOnADistributionFunction

  def get(69), do: :reserved

  # Post-processing analysis or forecast at a horizontal level or in a horizontal layer at a point in time. (see Template 4.70)
  def get(70), do: Templates.PostProcessingAnalysisOrForecast

  # Post-processing individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time. (see Template 4.71)
  def get(71), do: Templates.PostProcessingIndividualEnsembleForecastControlAndPerturbed

  # Post-processing average accumulation extreme values or other statistically processed values at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval. (see Template 4.72)
  def get(72), do: Templates.PostProcessingAverageAccumulationExtremeValuesAtIntervals

  # Post-processing individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval. (see Template 4.73)
  def get(73),
    do: Templates.PostProcessingIndividualEnsembleForecastControlAndPerturbedAtIntervals

  def get(n) when n >= 74 and n <= 90, do: :reserved

  # Categorical forecast at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.91)
  def get(91), do: Templates.CategoricalForecastAtIntervals
  def get(n) when n >= 92 and n <= 253, do: :reserved
  # CCITT IA5 character string  (see Template 4.254)
  def get(254), do: Templates.CcittIa
  def get(n) when n >= 255 and n <= 999, do: :reserved
  # Cross-section of analysis and forecast at a point in time.  (see Template 4.1000)
  def get(1000), do: Templates.CrossSectionOfAnalysisAndForecastAtAPointInTime

  # Cross-section of averaged or otherwise statistically processed analysis or forecast over a range of time.  (see Template 4.1001)
  def get(1001),
    do:
      Templates.CrossSectionOfAveragedOrOtherwiseStatisticallyProcessedAnalysisOrForecastOverARangeOfTime

  # Cross-section of analysis and forecast averaged or otherwise statistically-processed over latitude or longitude.  (see Template 4.1002)
  def get(1002),
    do:
      Templates.CrossSectionOfAnalysisAndForecastAveragedOrOtherwiseStatisticallyProcessedOverLatitudeOrLongitude

  def get(n) when n >= 1003 and n <= 1099, do: :reserved
  # Hovmoller-type grid with no averaging or other statistical processing  (see Template 4.1100)
  def get(1100), do: Templates.HovmollerTypeGridWithNoAveragingOrOtherStatisticalProcessing
  # Hovmoller-type grid with averaging or other statistical processing  (see Template 4.1101)
  def get(1101), do: Templates.HovmollerTypeGridWithAveragingOrOtherStatisticalProcessing
  def get(n) when n >= 1102 and n <= 32767, do: :reserved
  def get(n) when n >= 32768 and n <= 65534, do: :reserved_for_local_use
  def get(65535), do: :missing
end
