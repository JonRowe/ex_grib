defmodule ExGrib.Grib2.Section4.Templates.SatelliteProduct do
  @moduledoc """
  Template 4.31

  Satellite product


    15 - Repeat the following 11 octets for each contributing band (nb = 1,NB)
  (15+11(nb-1)) - (16+11(nb-1)) Satellite series of band nb (code table
  defined by originating/generating centre)
  (17+11(nb-1)) - (18+11(nb-1)) Satellite series of
  band nb (code table defined by originating/generating centre)
  (19+11(nb-1)) - (20+11(nb-1)) Instrument types of band nb (code table defined by originating/generating centre)
  (21 +11(nb-1)) Scale factor of central wave number of band nb
  (22+11(nb-1)) - (25+11(nb-1))Scaled value of central wave number of band nb (units: m-1)

  WARNING THIS TEMPLATE WAS AUTOGENERATED AND IS LIKELY INCOMPLETE

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp4-31.shtml
  """

  defstruct parameter_category: nil,
            parameter_number: nil,
            type_of_generating_process: nil,
            observation_generating_process_identifier: nil,
            number_of_contributing_spectral_bands: nil

  @spec get(binary()) :: no_return
  def get(<<
        # Parameter category (see Code Table 4.1)
        parameter_category::integer(),
        # Parameter number (see Code Table 4.2)
        parameter_number::integer(),
        # Type of generating process (see Code Table 4.3)
        type_of_generating_process::integer(),
        # Observation generating process identifier (defined by originating centres)
        observation_generating_process_identifier::integer(),
        # Number of contributing spectral bands (NB)
        number_of_contributing_spectral_bands::integer(),
        rest::binary()
      >>) do
    template = %__MODULE__{
      parameter_category: parameter_category,
      parameter_number: parameter_number,
      type_of_generating_process: type_of_generating_process,
      observation_generating_process_identifier: observation_generating_process_identifier,
      number_of_contributing_spectral_bands: number_of_contributing_spectral_bands
    }

    {:ok, template, rest}
  end
end
