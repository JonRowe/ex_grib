defmodule ExGrib.Grib2.Section1 do
  @moduledoc """
  Section 1 contains identification information for a grib file.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_sect1.shtml
  """

  alias ExGrib.Grib2
  alias ExGrib.Grib2.Section1.Centre
  alias ExGrib.Grib2.Section1.GribType
  alias ExGrib.Grib2.Section1.ProductionStatus
  alias ExGrib.Grib2.Section1.ReferenceTime
  alias ExGrib.Grib2.Section1.SubCentre

  @type local_version :: integer()
  @type reference_time_significance :: integer()
  @type year() :: integer()
  @type month() :: integer()
  @type day() :: integer()
  @type hour() :: integer()
  @type minute() :: integer()
  @type second() :: integer()

  @type input :: binary()
  @type t ::
          {:ok, Grib2.section_size(), Grib2.section_number(), Centre.t(), SubCentre.t(),
           local_version(), ReferenceTime.t(), year(), month(), day(), hour(), minute(), second(),
           ProductionStatus.t(), GribType.t(), binary()}
          | :error

  @spec parse(input()) :: t()
  def parse(<<
        size::integer-size(32),
        number::integer,
        centre_id::integer-size(16),
        sub_centre_id::integer-size(16),
        2,
        local_version::integer(),
        reference_time_id::integer(),
        year::integer-size(16),
        month::integer(),
        day::integer(),
        hour::integer(),
        minute::integer(),
        second::integer(),
        production_status::integer(),
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

    {:ok, size, number, Centre.get(centre_id), SubCentre.get(centre_id, sub_centre_id),
     local_version, ReferenceTime.get(reference_time_id), year, month, day, hour, minute, second,
     ProductionStatus.get(production_status), GribType.get(type), rest}
  end

  def parse(_), do: :error
end
