defmodule ExGrib.Grib2 do
  @moduledoc """
  Functions for working with Grib2 files.

  See: https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/
  """

  alias ExGrib.Grib2.Centre
  alias ExGrib.Grib2.Discipline
  alias ExGrib.Grib2.GribType
  alias ExGrib.Grib2.ProductionStatus
  alias ExGrib.Grib2.ReferenceTime
  alias ExGrib.Grib2.SubCentre

  @type file_size :: integer()
  @type local_version :: integer()
  @type section_number :: integer()
  @type section_size :: integer()
  @type reference_time_significance :: integer()
  @type year() :: integer()
  @type month() :: integer()
  @type day() :: integer()
  @type hour() :: integer()
  @type minute() :: integer()
  @type second() :: integer()

  @spec header(binary()) :: {:ok, Discipline.t(), file_size(), binary()} | :error
  def header(
        <<"GRIB", _reserved::binary-size(2), discipline, 2, file_size::integer-size(64),
          rest::binary>>
      ) do
    {:ok, Discipline.get(discipline), file_size, rest}
  end

  def header(_), do: :error

  @spec identification(binary()) ::
          {:ok, section_size(), section_number(), Centre.t(), SubCentre.t(), local_version(),
           ReferenceTime.t(), year(), month(), day(), hour(), minute(), second(),
           ProductionStatus.t(), GribType.t(), binary()}
          | :error
  def identification(<<
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

  def identification(_), do: :error
end
