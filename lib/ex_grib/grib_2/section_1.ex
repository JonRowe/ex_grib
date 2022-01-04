defmodule ExGrib.Grib2.Section1 do
  @moduledoc """
  Section 1 contains identification information for a grib file.

  Identification section

  Notes:

  1. Local tables define those parts of the master table which are
    reserved for local use except for the case described below. In
    any case, the use of local tables in the messages are intended for
    non-local or international exchange is strongly discouraged.

  2. If octet 10 is set to 255 then only local tables are in use. In
    this case, the local table version number (octet 11) must not be
    zero nor missing.  Local tables may include entries from
    the entire range of the tables.

  3. If octet 11 is zero, octet 10 must contain a valid master table
    version number and only those parts of the tables not reserved
    for local use may be used.

  4. If octets 8-9 is zero, Not a sub-center, the originating/generating
    center is the center defined by octets 6-7.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_sect1.shtml
  """

  alias ExGrib.Grib2.Section1.Centre
  alias ExGrib.Grib2.Section1.GribType
  alias ExGrib.Grib2.Section1.ProductionStatus
  alias ExGrib.Grib2.Section1.ReferenceTime
  alias ExGrib.Grib2.Section1.SubCentre

  defstruct centre: :not_parsed,
            sub_centre: :not_parsed,
            local_version: :not_parsed,
            significance_of_reference_time: :not_parsed,
            year: :not_parsed,
            month: :not_parsed,
            day: :not_parsed,
            hour: :not_parsed,
            minute: :not_parsed,
            second: :not_parsed,
            production_status: :not_parsed,
            type: :not_parsed

  @type local_version :: integer()
  @type year() :: integer()
  @type month() :: integer()
  @type day() :: integer()
  @type hour() :: integer()
  @type minute() :: integer()
  @type second() :: integer()

  @typep section :: %__MODULE__{
           centre: Centre.t(),
           sub_centre: SubCentre.t(),
           local_version: local_version(),
           significance_of_reference_time: ReferenceTime.t(),
           year: year(),
           month: month(),
           day: day(),
           hour: hour(),
           minute: minute(),
           second: second(),
           production_status: ProductionStatus.t(),
           type: GribType.t()
         }

  @type input :: binary()
  @type t :: {:ok, section(), binary()} | :error

  @spec parse(input()) :: t()
  def parse(<<
        # Length of the section in octets (21 or N)
        size::integer-size(32),
        # Number of the section (1)
        1,
        # Identification of originating generating center (See Table 0) (See note 4)
        centre_id::integer-size(16),
        # Identification of originating generating subcenter (See Table C)
        sub_centre_id::integer-size(16),
        # GRIB master tables version number (currently 2) (See Table 1.0) (See note 1)
        2,
        # Version number of GRIB local tables used to augment Master Tables (see Table 1.1)
        local_version::integer(),
        # Significance of reference time (See Table 1.2)
        reference_time_id::integer(),
        # Year (4 digits)
        year::integer-size(16),
        month::integer(),
        day::integer(),
        hour::integer(),
        minute::integer(),
        second::integer(),
        # Production Status of Processed data in the GRIB message (See Table 1.3)
        production_status::integer(),
        # Type of processed data in this GRIB message (See Table 1.4)
        type::integer(),
        possible_reserved::binary()
      >>) do
    rest =
      if size > 21 do
        reserved_size = size - 21
        <<_reserved::binary-size(reserved_size), remaining::binary>> = possible_reserved
        remaining
      else
        possible_reserved
      end

    section = %__MODULE__{
      centre: Centre.get(centre_id),
      sub_centre: SubCentre.get(centre_id, sub_centre_id),
      local_version: local_version,
      significance_of_reference_time: ReferenceTime.get(reference_time_id),
      year: year,
      month: month,
      day: day,
      hour: hour,
      minute: minute,
      second: second,
      production_status: ProductionStatus.get(production_status),
      type: GribType.get(type)
    }

    {:ok, section, rest}
  end

  def parse(_), do: :error
end
