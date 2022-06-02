defmodule ExGrib.Grib1.Table5 do
  @moduledoc """
  Time range indicator

  Notes:

    1 - For analysis products, or the first of a series of analysis products,
        the reference time (octets 13 to 17) indicates the valid time.

    2 - For forecast products, or the first of a series of forecast products,
        the reference time indicates the valid time of the analysis upon
        which the (first) forecast is based.

    3 - Initialized analysis products are allocated code figures distinct
        from those allocated to uninitialized analysis products.

    4 - Code figure 10 allows the period of a forecast to be extended over two
        octets; this is to assist with extended range forecasts.

    5 - Where products or a series of products are averaged or accumulated,
        the number involved is to be rep resented in octets 22 and 23 of
        Section 1, while any number missing is to be represented in octet 24.

    6 - Forecasts of the accumulation or difference of some quantity (e.g.
        quantitative precipitation forecasts), indicated by values of 4 or 5 in
        octet 21, have a product valid time given by the reference time + P2;
        the period of accumulation, or difference, can be calculated as P2 P1.

    7 - A few examples may help to clarify the use of Code table 5: For analysis
        products, P1 will be zero and the time range indicator will also be zero;
        for initialized products (sometimes called zero hour forecasts), P1 will
        be zero, but octet 21 will be set to 1.

        For forecasts, typically, P1 will contain the number of hours of the 
        forecast (the unit indicator given in octet 18 would be 1 - and octet 21
        would contain a zero.

        - Code value 115 would be used, typically, for multiple day mean forecasts,
          all derived from the same initial conditions.

        - Code value 117 would be used, typically, for Monte Carlo type calculations:
        many forecasts valid at the same time from different initial (reference) times.

        Averages, accumulations and differences get a somewhat specialized treatment.
        If octet 21 (Code table 5 - has a value between 2 and 5 (inclusive), then the
        reference time + P1 is the initial date/time and the reference time + P2 is
        the final date/time of the period over which averaging or accumulation takes.

  https://apps.ecmwf.int/codes/grib/format/grib1/ctable/5/
  """

  @type id :: integer()
  @type t ::
          :forecast_or_uninitialized_analysis_or_image_valid_for_reference_time
          | :initialized_analysis_product
          | :product_between_reference_time_plus_p1_and_reference_time_plus_p2
          | :average_reference_plus_p1_to_reference_plus_p2
          | :difference_p2_p1
          | :average_reference_minus_p1_to_reference_minus_p2
          | :average_reference_minus_p1_to_reference_plus_p2
          | :p1_occupies_octets_19_20
          | :climatological_mean_value
          | :average_of_n_forecasts_period_p1_interval_p2_from_reference_time
          | :average_of_n_forecasts_first_period_p1_intervals_p2
          | :average_of_n_forecasts_first_period_p1_subsequent_reduced_at_intervals_of_p2
          | :temporal_variance
          | :standard_deviation_of_n_forecasts
          | :average_of_n_analyses
          | :accumulation_reference_time_plus_p1_to_reference_time_plus_p2
          | :accumulation_of_n_forecasts_period_p1_interval_p2
          | :accumulation_of_n_forecasts_period_p1_then_p2
          | :accumulation_of_n_analyses_p2_interval
          | :missing
          | :reserved

  @spec get(id()) :: t()

  # Forecast product valid for reference time + P1 (P1 > 0), or Uninitialized analysis
  # product for reference time (P1 = 0), or Image product for reference time (P1 = 0)
  def get(0), do: :forecast_or_uninitialized_analysis_or_image_valid_for_reference_time

  # Initialized analysis product for reference time (P1 = 0)
  def get(1), do: :initialized_analysis_product

  # Product with a valid time ranging between reference time + P1 and reference time + P2
  def get(2), do: :product_between_reference_time_plus_p1_and_reference_time_plus_p2
  def get(3), do: :average_reference_plus_p1_to_reference_plus_p2

  # Accumulation (reference time + P1 to reference time + P2) product considered valid at reference time + P2
  def get(4), do: :accumulation_reference_time_plus_p1_to_reference_time_plus_p2

  # Difference (reference time + P2 minus reference time + P1) product considered valid at reference time + P2
  def get(5), do: :difference_p2_p1
  def get(6), do: :average_reference_minus_p1_to_reference_minus_p2
  def get(7), do: :average_reference_minus_p1_to_reference_plus_p2
  def get(n) when n >= 8 and n <= 9, do: :reserved

  # P1 occupies octets 19 and 20; product valid at reference time + P1
  def get(10), do: :p1_occupies_octets_19_20
  def get(n) when n >= 11 and n <= 50, do: :reserved

  # Climatological mean value: multiple year averages of quantities which are themselves means over some period
  # of time (P2) less than a year. The reference time (R) indicates the date and time of the start of a period
  # of time, given by R to R + P2, over which a mean is formed; N indicates the number of such period-means
  # that are averaged together to form the climatological value, assuming that the N period-mean fields are
  # separated by one year. The reference time indicates the start of the N-year climatology. If P1 = 0 then
  # the data averaged in the basic interval P2 are assumed to be continuous, i.e. all available data are
  # simply averaged together. If P1 = 1 (the unit of time - octet 18, Code table 4 - is not relevant here)
  # then the data averaged together in the basic interval P2 are valid only at the time (hour, minute)
  # given in the reference time, for all the days included in the P2 period. The units of P2 are given by
  # the contents of octet 18 and Code table 4.
  def get(51), do: :climatological_mean_value
  def get(n) when n >= 52 and n <= 112, do: :reserved

  # Average of N forecasts (or initialized analyses); each product has forecast period of P1 (P1 = 0 for initialized analyses); products have reference times at intervals of P2, beginning at the given reference time
  def get(113), do: :average_of_n_forecasts_period_p1_interval_p2_from_reference_time

  # Accumulation of N forecasts (or initialized analyses); each product has forecast period of P1 (P1 = 0
  # for initialized analyses); products have reference times at intervals of P2, beginning at the given reference time
  def get(114), do: :accumulation_of_n_forecasts_period_p1_interval_p2

  # Average of N forecasts, all with the same reference time; the first has a forecast period of P1, the remaining forecasts follow at intervals of P2
  def get(115), do: :average_of_n_forecasts_first_period_p1_intervals_p2

  # Accumulation of N forecasts, all with the same reference time; the first has a forecast period of P1, the remaining forecasts follow at intervals of P2
  def get(116), do: :accumulation_of_n_forecasts_period_p1_then_p2

  # Average of N forecasts; the first has a forecast period of P1, the subsequent ones have forecast periods reduced from the previous one by an interval of P2; the reference time for the first is given in octets 13 to 17, the subsequent ones have reference times increased from the previous one by an interval of P2. Thus all the forecasts have the same valid time, given by the initial reference time + P1
  def get(117), do: :average_of_n_forecasts_first_period_p1_subsequent_reduced_at_intervals_of_p2

  # Temporal variance, or covariance, of N initialized analyses; each product has forecast period of
  # P1 = 0; products have reference times at intervals of P2, beginning at the given reference time.
  def get(118), do: :temporal_variance

  # Standard deviation of N forecasts, all with the same reference time with respect to the time average of forecasts; the first forecast has a forecast period of P1, the remaining forecasts follow at intervals of P2
  def get(119), do: :standard_deviation_of_n_forecasts
  def get(n) when n >= 120 and n <= 122, do: :reserved

  # Average of N uninitialized analyses, starting at the reference time, at intervals of P2
  def get(123), do: :average_of_n_analyses

  # Accumulation of N uninitialized analyses, starting at the reference time, at intervals of P2
  def get(124), do: :accumulation_of_n_analyses_p2_interval

  # Standard deviation of N forecasts, all with the same reference time with respect to time average of the time tendency of forecasts; the first forecast has a forecast period of P1, the remaining forecasts follow at intervals of P2
  def get(125), do: :standard_deviation_of_n_forecasts
  def get(n) when n >= 126 and n <= 127, do: :reserved
  def get(n) when n >= 128 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
