defmodule ExGrib.Grib1.Section1 do
  @moduledoc """
  Section 1: Product Definition

  Notes:
    - 1 Inclusion of the Section 2 Grid description section (GDS) is the preferred method of defining a grid.

    - 2 Where octet 7 defines a catalogued grid, that grid should also be defined in Section 2, provided the
        flag in octet 8 indicates inclusion of Section 2.

    - 3 Octet 7 must be set to 255 to indicate a non-catalogued grid, in which case the grid will be defined
        in Section 2.

    - 4 A negative value of D shall be indicated by setting the high-order bit (bit 1) in the left-hand octet to 1 (on).
    - 5 If a Grid description section is not included, then any u- or v-components of vector quantities in the message are to be resolved relative to the specified grid in the direction of increasing x and y (or i and j) coordinates respectively. If a Grid description section is included in the message, which is the preferred option, then octet 17 of the GDS and Code table 7 will contain component resolution information.
    - 6 To specify year 2000, octet 13 of the section (year of the century) shall contain a value equal to 100 and octet 25 of the section (Century of reference time data) shall contain a value equal to 20. To specify year 2001, octet 13 of the section shall contain a value equal to 1 and octet 25 of the section shall contain a value equal to 21 (by International Convention, the date of 1 January 2000 is the first day of the hundredth year of the twentieth century and the date of 1 January 2001 is the first day of the first year of the twenty-first century); it is to be noted also that year 2000 is a leap year and that 29 February 2000 exists.

  https://apps.ecmwf.int/codes/grib/format/grib1/sections/1/
  """

  alias ExGrib.Grib1.Table0
  alias ExGrib.Grib1.Table1
  alias ExGrib.Grib1.Table2
  alias ExGrib.Grib1.Table3
  alias ExGrib.Grib1.Table4
  alias ExGrib.Grib1.Table5

  @type input :: binary()
  @typep section ::
           %__MODULE__{
             section_length: integer(),
             table_version: integer(),
             centre: Table0.t(),
             generating_process_identifier: integer(),
             grid_definition: integer(),
             section_1_flags: Table1.t(),
             indicator_of_parameter: Table2.t(),
             indicator_of_type_of_level: Table3.t(),
             # _indicator_level::integer-size(16),
             year_of_century: integer(),
             month: integer(),
             day: integer(),
             hour: integer(),
             minute: integer(),
             unit_of_time_range: Table4.t(),
             p1: integer(),
             p2: integer(),
             time_range_indicator: Table5.t(),
             number_included_in_average: integer(),
             number_missing_from_averages_or_accumulations: integer(),
             century_of_reference_time_of_data: integer(),
             sub_centre: Table0.t(),
             decimal_scale_factor: any()
           }
  @type t :: {:ok, section()} | :error

  defstruct centre: :not_parsed,
            century_of_reference_time_of_data: :not_parsed,
            day: :not_parsed,
            decimal_scale_factor: :not_parsed,
            generating_process_identifier: :not_parsed,
            grid_definition: :not_parsed,
            hour: :not_parsed,
            indicator_of_parameter: :not_parsed,
            indicator_of_type_of_level: :not_parsed,
            minute: :not_parsed,
            month: :not_parsed,
            number_included_in_average: :not_parsed,
            number_missing_from_averages_or_accumulations: :not_parsed,
            p1: :not_parsed,
            p2: :not_parsed,
            section_1_flags: :not_parsed,
            section_length: :not_parsed,
            sub_centre: :not_parsed,
            table_version: :not_parsed,
            time_range_indicator: :not_parsed,
            unit_of_time_range: :not_parsed,
            year_of_century: :not_parsed

  @spec parse(input()) :: t()
  def parse(<<
        # Length of section
        section_length::integer-size(24),
        # GRIB tables Version No. (currently 3 for international exchange) Version numbers 128-254 are reserved for local use
        table_version::integer(),
        # Identification of originating/generating centre (see Code table 0 = Common Code table C1 in Part C/c.)
        centre::integer,
        # Generating process identification number (allocated by originating centre)
        generating_process_identifier::integer(),
        # Grid definition (Number of grid used from catalogue defined by originating centre)
        grid_definition::integer(),
        # Flag (see Regulation 92.3.2 and Code table 1)
        section_1_flags::binary-size(1),
        # Indicator of parameter (see Code table 2)
        indicator_of_parameter::integer(),
        # Indicator of type of level (see Code table 3)
        indicator_of_type_of_level::integer(),
        # Height, pressure, etc. of levels (see Code table 3)
        _indicator_level::integer-size(16),
        # Year of century
        year_of_century::integer(),
        # Month Reference time of data date and time of
        month::integer(),
        # Day start of averaging or accumulation period
        day::integer(),
        # Hour
        hour::integer(),
        # Minute
        minute::integer(),
        # Indicator of unit of time range (see Code table 4)
        unit_of_time_range::integer(),
        # P1 Period of time (number of time units) (0 for analyses or initialized analyses). Units of time given by octet 18
        p1::integer(),
        # P2 Period of time (number of time units); or Time interval between successive analyses, initialized analyses or forecasts, undergoing averaging or accumulation. Units of time given by octet 18
        p2::integer(),
        # Time range indicator (see Code table 5)
        time_range_indicator::integer(),
        # Number included in average, when octet 21 (Code table 5) indicates an average or accumulation; otherwise set to zero
        number_included_in_average::integer-size(16),
        # Number missing from averages or accumulations
        number_missing_from_averages_or_accumulations::integer(),
        # Century of reference time of data
        century_of_reference_time_of_data::integer(),
        # Sub-centre identification (see common Code table C1 in Part C/c., Note (3))
        sub_centre::integer(),
        # Units decimal scale factor (D) (signed)
        decimal_scale_factor::binary-size(2),
        more::binary()
      >>) do
    remaining_octets = section_length - 28

    # There are various reserved octets, 12 are reserved but need not be present,
    # then octets 41-nn are reserved for originating centre use if those previous
    # 12 are provided, we only care about skipped to the right point currently.
    <<_reserved::binary-size(remaining_octets), rest::binary()>> = more

    section = %__MODULE__{
      section_length: section_length,
      table_version: table_version,
      centre: Table0.get(centre),
      generating_process_identifier: generating_process_identifier,
      grid_definition: grid_definition,
      section_1_flags: Table1.get(section_1_flags),
      indicator_of_parameter: Table2.get(indicator_of_parameter),
      indicator_of_type_of_level: Table3.get(indicator_of_type_of_level),
      year_of_century: year_of_century,
      month: month,
      day: day,
      hour: hour,
      minute: minute,
      unit_of_time_range: Table4.get(unit_of_time_range),
      p1: p1,
      p2: p2,
      time_range_indicator: Table5.get(time_range_indicator),
      number_included_in_average: number_included_in_average,
      number_missing_from_averages_or_accumulations:
        number_missing_from_averages_or_accumulations,
      century_of_reference_time_of_data: century_of_reference_time_of_data,
      sub_centre: Table0.get(sub_centre),
      decimal_scale_factor: decimal_scale_factor
    }

    {:ok, section, rest}
  end

  def parse(_), do: :error
end
