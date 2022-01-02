defmodule ExGrib.Grib2.Section4.Templates.PostProcessingIndividualEnsembleForecastControlAndPerturbedAtIntervals do
  @moduledoc """
  Template 4.73

  Post processing individual ensemble forecast control and perturbed at intervalsontal level or in a horizontal layer in a continuous or non-continuous time interval

  Note: 
  (1) The input process identifier shall have the value of the “analysis or forecast process identifier”
  of the original GRIB message used as input of the post-processing.
  (2) The input originating centre shall have the value of the “originating centre” of the original GRIB
  message used as input of the post-processing.
  (3) This identifies which post-processing technique was used. This is defined by the originating centre.
  (4) Hours greater than 65534 will be coded as 65534.
  (5) The reference time in section 1 and the forecast time together define the beginning of the overall time interval.
  (6) An increment of zero means that the statistical processing is the result of a continuous (or near continuous) process,
  not the processingeof a number of discrete samples. Examples of such continuous processes are the temperatures measured by
  analogue maximum and minimum thermometers or thermographs, and the rainfall measured by a rain gauge.
  (7) The reference and forecast times are successively set to their initial values plus or minus the increment,
  as defined by the type of time increment (one of octets 56, 68, 80, ...). For all but the innermost (last) time range,
  the next inner range is then processed using these reference and forecast times as the initial reference and
  forecast times.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp4-73.shtml
  """

  @spec get(binary()) :: no_return
  def get(_) do
    raise "Not implemented yet"
  end
end
