defmodule ExGrib.Grib2.Section4.Templates.AverageAccumulationAtIntervalsForAtmosphericChemicalConstituentsBasedOnADistributionFunction do
  @moduledoc """
  Template 4.67

  Average accumulation at intervals for atmospheric chemical constituents based on a distribution functionel or in ahorizontal layer in a continuous or non-continuous time interval foratmospheric chemical constituents based on a distribution function

  Notes:
  1. If Number of mode (N) > 1, then between X N fields with mode number I=1,...,N define the distribution function. X is number of variable
  parameters in the distribution function.
  2. For more information, see Part B, GRIB Attachment III.
  3. Hours greater than 65534 will be coded as 65534.
  4. The reference time in section 1 and the forecast time together define the beginning of the overall time interval.
  5. An increment of zero means that the statistical processing is the result of a continuous (or near continuous) process,
  not the processing of a number of discrete samples. Examples of such continuous processes are the temperatures measured
  by analogue maximum and minimum thermometers or thermographs, and the rainfall measured by a rain gauge.
  6. The reference and forecast times are successively set to their initial values plus or minus the increment, as defined
  by the type of time increment. For all but the innermost (last) time range, the next inner range is then processed using
  these reference and forecast times as the initial reference and forecast times.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp4-67.shtml
  """

  @spec get(binary()) :: no_return
  def get(_) do
    raise "Not implemented yet"
  end
end
