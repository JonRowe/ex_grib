defmodule ExGribTest do
  use ExUnit.Case

  alias ExGrib.Grib1
  alias ExGrib.Grib2

  doctest ExGrib

  import ExGrib.Test.File, only: [file_contents: 1]

  describe "find/2" do
    test "it finds messages matching the query" do
      assert {:ok, messages} = ExGrib.parse_all(file_contents("forecast.grb"), read_data: true)
      assert length(ExGrib.find(messages, parameter: :temperature)) == 112
    end
  end

  describe "parse_all/1" do
    test "it pulls out all the gribs in grib1 format" do
      assert {:ok, [%Grib1{} = grib | more_gribs]} =
               ExGrib.parse_all(file_contents("forecast.grb"))

      assert {:ok, ^grib, _more_data} = Grib1.parse(file_contents("forecast.grb"))

      assert length(more_gribs) == 615
    end

    test "it pulls out all the gribs in grib2 format" do
      assert {:ok, [%Grib2{} = grib | more_gribs]} =
               ExGrib.parse_all(file_contents("gfs_25km.grb2"))

      assert {:ok, ^grib, _more_data} = Grib2.parse(file_contents("gfs_25km.grb2"))

      assert length(more_gribs) == 2293
    end
  end

  describe "with a valid grib 1" do
    test "it reads data according to the grid definition and returns decoded values" do
      assert {:ok, messages} = ExGrib.parse_all(file_contents("forecast.grb"), read_data: true)

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
                 read(messages, parameter: :u_component_of_wind, level: 10),
                 read(messages, parameter: :v_component_of_wind, level: 10)
               },
               wind_40m: {
                 read(messages, parameter: :u_component_of_wind, level: 40),
                 read(messages, parameter: :v_component_of_wind, level: 40)
               },
               wind_iso: {
                 read(messages, parameter: :u_component_of_wind, type_of_level: :isobaric_surface),
                 read(messages, parameter: :v_component_of_wind, type_of_level: :isobaric_surface)
               },
               cloud: read(messages, parameter: :total_cloud_cover),
               precipitation: read(messages, parameter: :precipitation_rate),
               temperature: read(messages, parameter: :temperature, level: 2),
               temperature_iso:
                 read(messages, parameter: :temperature, type_of_level: :isobaric_surface),
               pressure: read(messages, parameter: :pressure_reduced_to_msl)
             }
    end
  end

  defp read(messages, query) do
    [message] = ExGrib.find(messages, Keyword.put(query, :time, ~N[2022-05-29 12:00:00]))
    Enum.at(message.section_4.data, Grib1.index(message, 49910, -5946))
  end
end
