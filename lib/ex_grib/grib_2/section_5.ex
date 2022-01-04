defmodule ExGrib.Grib2.Section5 do
  @moduledoc """
  Section 5

  Data representation section

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_sect5.shtml
  """

  alias ExGrib.Grib2.Section5.DataRepresentationTemplateNumber, as: Template

  defstruct number_of_data_points_with_values_in_section_7: :not_parsed, template: :not_parsed

  @type input :: binary()
  @type section ::
          %__MODULE__{
            number_of_data_points_with_values_in_section_7: integer(),
            template: Template.t()
          }

  @type t :: {:ok, section(), binary()} | :error

  @spec parse(input()) :: t()
  def parse(<<
        # Length of the section in octets (nn)
        _length_of_the_section_in_octets::integer-size(32),
        # Number of the section (5)
        5,
        # Number of data points where one or more values are specified in Section 7 when a bit map is present total number of data points when a bit map is absent.
        number_of_data_points_specified_in_section_7::integer-size(32),
        # Data representation template number (See Table 5.0)
        data_representation_template_number::integer-size(16),
        # Data representation template (See Template 5.X where X is the number given in octets 10-11)
        more::binary()
      >>) do
    {:ok, template, rest} =
      case Template.get(data_representation_template_number) do
        atom when atom in [:reserved, :reserved_for_local_use, :missing] -> {:ok, atom, more}
        module -> module.get(more)
      end

    section = %__MODULE__{
      number_of_data_points_with_values_in_section_7:
        number_of_data_points_specified_in_section_7,
      template: template
    }

    {:ok, section, rest}
  end

  def parse(_), do: :error
end
