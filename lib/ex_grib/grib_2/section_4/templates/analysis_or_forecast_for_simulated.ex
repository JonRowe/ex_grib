defmodule ExGrib.Grib2.Section4.Templates.AnalysisOrForecastForSimulated do
  @moduledoc """
  Template 4.32

  Analysis or forecast for simulatedal level or in a horizontal layer at a point in time for simulated (synthetic) satellite data

  Note :


  (1)  Instrument types code, a 16-bit value, stores the BUFR table 0 02 019 value,
  a 10-bit value, in the lowest ten bits.The upper three bits (bits 1-3) contain the
  polarization information, if known.The intervening three bits (4-6) are unused and
  set to 0.Bits 1-3 will have one of the following values:
   8192*0 = 000 = unknown or missing
   8192*1 = 001 = unpolarized
   8192*2 = 010 = horizontal linear polarization
   8192*3 = 011 = vertical linear polarization
   8192*4 = 100 = right circular polarization
   8192*5 = 101 = left circular polarization


  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp4-32.shtml
  """

  defstruct parameter_category: nil,
            parameter_number: nil,
            type_of_generating_process: nil,
            background_generating_process_identifier: nil,
            analysis_or_forecast_generating_process_identified: nil,
            hours_of_observational_data_cutoff_after_reference_time: nil,
            minutes_of_observational_data_cutoff_after_reference_time: nil,
            indicator_of_unit_of_time_range: nil,
            forecast_time_in_units_defined_by_octet: nil,
            number_of_contributing_spectral_bands: nil,
            spectral_bands: []

  defmodule SpectralBand do
    defstruct satellite_series_of_band_nb_code_table_0_02_020: nil,
              satellite_series_of_band_nb_code_table_0_01_007: nil,
              instrument_types_of_band_nb: nil,
              scale_factor_of_central_wave_number_of_band_nb: nil,
              scaled_value_of_central_wave_number_of_band_nb: nil
  end

  @spec get(binary()) :: no_return
  def get(<<
        # Parameter category (see Code Table 4.1)
        parameter_category::integer(),
        # Parameter number (see Code Table 4.2)
        parameter_number::integer(),
        # Type of generating process (see Code Table 4.3)
        type_of_generating_process::integer(),
        # Background generating process identifier (defined by originating centres)
        background_generating_process_identifier::integer(),
        analysis_or_forecast_generating_process_identified::integer(),
        # Hours of observational data cutoff after reference time (see Note 2)
        hours_of_observational_data_cutoff_after_reference_time::integer-size(16),
        # Minutes of observational data cutoff after reference time (see Note 2)
        minutes_of_observational_data_cutoff_after_reference_time::integer(),
        # Indicator of unit of time range (see Code table 4.4)
        indicator_of_unit_of_time_range::integer(),
        # Forecast time in units defined by octet 18
        forecast_time_in_units_defined_by_octet::integer-size(32),
        # Number of contributing spectral bands (NB)
        number_of_contributing_spectral_bands::integer(),
        # contains number_of_contributing_spectral_bands * 11 octets
        more::binary()
      >>) do
    {:ok, spectral_bands, rest} =
      process_spectral_bands(number_of_contributing_spectral_bands, more)

    template = %__MODULE__{
      parameter_category: parameter_category,
      parameter_number: parameter_number,
      type_of_generating_process: type_of_generating_process,
      background_generating_process_identifier: background_generating_process_identifier,
      analysis_or_forecast_generating_process_identified:
        analysis_or_forecast_generating_process_identified,
      hours_of_observational_data_cutoff_after_reference_time:
        hours_of_observational_data_cutoff_after_reference_time,
      minutes_of_observational_data_cutoff_after_reference_time:
        minutes_of_observational_data_cutoff_after_reference_time,
      indicator_of_unit_of_time_range: indicator_of_unit_of_time_range,
      forecast_time_in_units_defined_by_octet: forecast_time_in_units_defined_by_octet,
      number_of_contributing_spectral_bands: number_of_contributing_spectral_bands,
      spectral_bands: spectral_bands
    }

    {:ok, template, rest}
  end

  defp process_spectral_bands(0, rest), do: {:ok, [], rest}

  defp process_spectral_bands(n, binary) do
    <<
      satellite_series_of_band_nb_code_table_0_02_020::integer-size(16),
      satellite_series_of_band_nb_code_table_0_01_007::integer-size(16),
      instrument_types_of_band_nb::integer-size(16),
      scale_factor_of_central_wave_number_of_band_nb::integer(),
      scaled_value_of_central_wave_number_of_band_nb::integer-size(32),
      more::binary()
    >> = binary

    band = %SpectralBand{
      satellite_series_of_band_nb_code_table_0_02_020:
        satellite_series_of_band_nb_code_table_0_02_020,
      satellite_series_of_band_nb_code_table_0_01_007:
        satellite_series_of_band_nb_code_table_0_01_007,
      instrument_types_of_band_nb: instrument_types_of_band_nb,
      scale_factor_of_central_wave_number_of_band_nb:
        scale_factor_of_central_wave_number_of_band_nb,
      scaled_value_of_central_wave_number_of_band_nb:
        scaled_value_of_central_wave_number_of_band_nb
    }

    {:ok, next, rest} = process_spectral_bands(n - 1, more)
    {:ok, [band | next], rest}
  end
end
