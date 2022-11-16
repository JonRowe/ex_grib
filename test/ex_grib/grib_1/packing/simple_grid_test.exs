defmodule ExGrib.Grib1.Packing.SimpleGridTest do
  use ExUnit.Case, async: true

  alias ExGrib.Grib1.Section1
  alias ExGrib.Grib1.Table2
  alias ExGrib.Grib1.Table3

  import ExGrib.Test.File, only: [file_contents: 1, file_contents: 2]

  alias ExGrib.Grib1.Packing.SimpleGrid

  @height_above_ground %Table3{
    octet_10: :specified_height_level_above_ground,
    octet_11: :height_in_metres,
    octet_12: :continue
  }

  @isobaric %Table3{
    octet_10: :isobaric_surface,
    octet_11: :pressure_in_hpa,
    octet_12: :continue
  }

  describe "read/2" do
    test "it reads data according to the grid definition and returns decoded values" do
      assert {:ok, messages} = ExGrib.parse_all(file_contents("forecast.grb"))

      # Values here were looked up with eccodes
      #
      # Citation:
      # This data was decoded with XyGrib for comparison, and then by eccodes using:
      #
      # ```
      # grib_get -F"%2.12f" -pname,dataDate,step,level \
      #          -wname='<name>',step=12 -l 49.91,-5.946,1 \
      #          test/support/files/focrecast.grb`
      #
      # The values for forecast.grb at 12UTC on 2022-05-29 at 49.91°N 5.946°W are:
      #
      # Name           | XyGrib       | eccodes name              | level | eccodes
      # Wind 10m       | 137° 4.1 m/s | 10 metre U wind component | 10    | -2.749148368835449
      #                |              | 10 metre V wind component | 10    | 2.991506576538086
      # Cloud Cover    | 38%          | Total Cloud Cover         | 0     | 37.5
      # Precipitation  | 0.01 mm/h    | Precipitation rate        | 0     | 0.000003814697266
      # Temperature 2m | 286.9K       | 2 metre temperature       | 2     | 286.864990234375
      # Pressure MSL   | 1019.8hPa    | Mean sea level pressure   | 0     | 101985.421875
      #                |              | U component of wind       | 40    | -3.18966007232666
      #                |              |                           | 850   | -1.093749046325684
      #                |              | V component of wind       | 40    | 3.495977401733398
      #                |              |                           | 850   | -0.029908180236816
      #                |              | Temperature               | 850   | 275.570556640625

      assert %{
               wind_10m: {-2.749148368835449, 2.991506576538086},
               wind_40m: {-3.18966007232666, 3.4959774017333984},
               wind_iso: {-1.0937490463256836, -0.029908180236816406},
               cloud: 37.5,
               precipitation: 0.000003814697265625,
               temperature: 286.864990234375,
               temperature_iso: 275.570556640625,
               pressure: 101_985.421875
             } = %{
               wind_10m: {
                 read_wind(messages, :u_component_of_wind, level: 10),
                 read_wind(messages, :v_component_of_wind, level: 10)
               },
               wind_40m: {
                 read_wind(messages, :u_component_of_wind, level: 40),
                 read_wind(messages, :v_component_of_wind, level: 40)
               },
               wind_iso: {
                 read_wind(messages, :u_component_of_wind, level: 850, table_3: @isobaric),
                 read_wind(messages, :v_component_of_wind, level: 850, table_3: @isobaric)
               },
               cloud: read(messages, %Table2{parameter: :total_cloud_cover, unit: :percentage}),
               precipitation:
                 read(messages, %Table2{parameter: :precipitation_rate, unit: :kg_m2_s1}),
               temperature:
                 read(messages, %Table2{parameter: :temperature, unit: :k}, @height_above_ground),
               temperature_iso:
                 read(messages, %Table2{parameter: :temperature, unit: :k}, @isobaric),
               pressure: read(messages, %Table2{parameter: :pressure_reduced_to_msl, unit: :pa})
             }
    end

    test "it assigns values correctly to latitude / longitude" do
      assert {:ok, messages} = ExGrib.parse_all(file_contents("forecast.grb"))

      assert [message] =
               find_message(
                 messages,
                 %Table2{parameter: :temperature, unit: :k},
                 @height_above_ground
               )

      [["Latitude", "Longitude", "Value"] | expected_data] =
        file_contents("forecast_temperatures.csv", parse: :csv)

      parsed_data =
        Enum.map(SimpleGrid.read(message), &[&1.latitude / 1000, &1.longitude / 1000, &1.value])

      assert Enum.sort(parsed_data) == Enum.sort(expected_data)
    end
  end

  defp read_wind(messages, component, opts) do
    table_2 = %Table2{parameter: component, unit: :m_s1}
    table_3 = Keyword.get(opts, :table_3, @height_above_ground)
    height = Keyword.fetch!(opts, :level)

    messages
    |> Enum.filter(fn
      %{
        product_definition: %Section1{
          level: ^height,
          p1: 720,
          indicator_of_parameter: ^table_2,
          indicator_of_type_of_level: ^table_3
        }
      } ->
        true

      _ ->
        false
    end)
    |> find_value()
  end

  defp read(messages, table_2, table_3),
    do: messages |> find_message(table_2, table_3) |> find_value()

  defp read(messages, table_2), do: messages |> find_message(table_2) |> find_value()

  defp find_message(messages, table_2) do
    Enum.filter(messages, fn
      %{product_definition: %Section1{p1: 720, indicator_of_parameter: ^table_2}} -> true
      _ -> false
    end)
  end

  defp find_message(messages, table_2, table_3) do
    Enum.filter(messages, fn
      %{
        product_definition: %Section1{
          p1: 720,
          indicator_of_parameter: ^table_2,
          indicator_of_type_of_level: ^table_3
        }
      } ->
        true

      _ ->
        false
    end)
  end

  defp find_value(message) do
    message
    |> case do
      [one] -> one
      [] -> raise "Missing entry"
    end
    |> SimpleGrid.read()
    |> Enum.find_value(fn
      %{latitude: 49910, longitude: -5946, value: value} -> value
      %{latitude: _lat, longitude: _lon} -> false
    end)
  end
end
