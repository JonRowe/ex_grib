defmodule ExGrib.Grib1.Table0 do
  @moduledoc """
  Returns the name of the national / international originating
  centre (assigned by the WMO) from an integer in the GRIB.

  https://apps.ecmwf.int/codes/grib/format/grib1/centre/0/
  """

  @type id :: integer()
  @type t :: :atom

  @spec get(id()) :: t()
  def get(0), do: :wmo_secretariat
  def get(n) when n >= 2 and n <= 3, do: :melbourne
  def get(n) when n >= 4 and n <= 6, do: :moscow
  def get(7), do: :us_national_weather_service_national_centres_for_environmental_prediction
  def get(8), do: :us_national_weather_service_telecommunications_gateway
  def get(9), do: :us_national_weather_service_other
  def get(n) when n in [10, 11], do: :cairo
  def get(n) when n in [12, 13], do: :dakar
  def get(n) when n in [14, 15], do: :nairobi
  def get(16), do: :casablanca
  def get(17), do: :tunis
  def get(n) when n in [18, 19], do: :tunis_casablanca
  def get(20), do: :las_palmas
  def get(21), do: :algiers
  def get(22), do: :acmad
  def get(23), do: :mozambique_nmc
  def get(24), do: :pretoria
  def get(25), do: :la_reunion
  def get(n) when n in [26, 27], do: :khabarovsk
  def get(n) when n in [28, 29], do: :new_delhi
  def get(n) when n in [30, 31], do: :novosibirsk
  def get(32), do: :tashkent
  def get(33), do: :jeddah
  def get(n) when n in [34, 35], do: :tokyo_japan_meteorological_agency
  def get(36), do: :bangkok
  def get(37), do: :bator
  def get(n) when n in [38, 39], do: :beijing
  def get(40), do: :seoul
  def get(n) when n in [41, 42], do: :buenos_aires
  def get(n) when n in [43, 44], do: :brasilia
  def get(45), do: :santiago
  def get(46), do: :brazilian_space_agency_inpe
  def get(47), do: :colombia_nmc
  def get(48), do: :ecuador_nmc
  def get(49), do: :peru_nmc
  def get(50), do: :venezuela_nmc
  def get(51), do: :miami
  def get(52), do: :miami_rsmc_national_hurricane_center
  def get(n) when n in [53, 54], do: :montreal
  def get(55), do: :san_francisco
  def get(56), do: :arinc_centre
  def get(57), do: :us_air_force_air_force_global_weather_central
  def get(58), do: :fleet_numerical_meteorology_and_oceanography_center_monterey_ca
  def get(59), do: :the_noaa_forecast_systems_laboratory_boulder_co_usa
  def get(60), do: :united_states_national_centre_for_atmospheric_research
  def get(61), do: :service_argos_andover
  def get(62), do: :us_naval_oceanographic_office
  def get(63), do: :international_research_institute_for_climate_and_society
  def get(64), do: :honolulu
  def get(n) when n in [65, 66], do: :darwin
  def get(67), do: :melbourne
  def get(68), do: :reserved
  def get(n) when n in [69, 70], do: :wellington
  def get(71), do: :nadi
  def get(72), do: :singapore
  def get(73), do: :malaysia_nmc
  def get(n) when n in [74, 75], do: :uk_meteorological_office_exeter
  def get(76), do: :moscow
  def get(77), do: :reserved
  def get(n) when n in [78, 79], do: :offenbach
  def get(n) when n in [80, 81], do: :rome
  def get(n) when n in [82, 83], do: :norrkoping
  def get(n) when n in [84, 85], do: :toulouse
  def get(86), do: :helsinki
  def get(87), do: :belgrade
  def get(88), do: :oslo
  def get(89), do: :prague
  def get(90), do: :episkopi
  def get(91), do: :ankara
  def get(92), do: :frankfurt
  def get(93), do: :london
  def get(94), do: :copenhagen
  def get(95), do: :rota
  def get(96), do: :athens
  def get(97), do: :european_space_agency
  def get(98), do: :european_centre_for_mediumrange_weather_forecast
  def get(99), do: :de_bilt
  def get(100), do: :brazzaville
  def get(101), do: :abidjan
  def get(102), do: :libyan_arab_jamahiriya_nmc
  def get(103), do: :madagascar_nmc
  def get(104), do: :mauritius_nmc
  def get(105), do: :niger_nmc
  def get(106), do: :seychelles_nmc
  def get(107), do: :uganda_nmc
  def get(108), do: :tanzania_nmc
  def get(109), do: :zimbabwe_nmc
  def get(110), do: :hong_kong_china
  def get(111), do: :afghanistan_nmc
  def get(112), do: :bahrain_nmc
  def get(113), do: :bangladesh_nmc
  def get(114), do: :bhutan_nmc
  def get(115), do: :cambodia_nmc
  def get(116), do: :democratic_peoples_republic_of_korea_nmc
  def get(117), do: :islamic_republic_of_iran_nmc
  def get(118), do: :iraq_nmc
  def get(119), do: :kazakhstan_nmc
  def get(120), do: :kuwait_nmc
  def get(121), do: :kyrgyz_republic_nmc
  def get(122), do: :lao_peoples_democratic_republic_nmc
  def get(123), do: :macao_china
  def get(124), do: :maldives_nmc
  def get(125), do: :myanmar_nmc
  def get(126), do: :nepal_nmc
  def get(127), do: :oman_nmc
  def get(128), do: :pakistan_nmc
  def get(129), do: :qatar_nmc
  def get(130), do: :republic_of_yemen_nmc
  def get(131), do: :sri_lanka_nmc
  def get(132), do: :tajikistan_nmc
  def get(133), do: :turkmenistan_nmc
  def get(134), do: :united_arab_emirates_nmc
  def get(135), do: :uzbekistan_nmc
  def get(136), do: :socialist_republic_of_vietnam_nmc
  def get(n) when n >= 137 and n <= 139, do: :reserved
  def get(140), do: :bolivia_nmc
  def get(141), do: :guyana_nmc
  def get(142), do: :paraguay_nmc
  def get(143), do: :suriname_nmc
  def get(144), do: :uruguay_nmc
  def get(145), do: :french_guyana
  def get(146), do: :brazilian_navy_hydrographic_centre
  def get(147), do: :comision_nacional_de_actividades_espaciales
  def get(n) when n >= 148 and n <= 149, do: :reserved
  def get(150), do: :antigua_and_barbuda_nmc
  def get(151), do: :bahamas_nmc
  def get(152), do: :barbados_nmc
  def get(153), do: :belize_nmc
  def get(154), do: :british_caribbean_territories_centre
  def get(155), do: :san_jose
  def get(156), do: :cuba_nmc
  def get(157), do: :dominica_nmc
  def get(158), do: :dominican_republic_nmc
  def get(159), do: :el_salvador_nmc
  def get(160), do: :us_noaa_nesdis
  def get(161), do: :us_noaa_office_of_oceanic_and_atmospheric_research
  def get(162), do: :guatemala_nmc
  def get(163), do: :haiti_nmc
  def get(164), do: :honduras_nmc
  def get(165), do: :jamaica_nmc
  def get(166), do: :mexico
  def get(167), do: :netherlands_antilles_and_aruba_nmc
  def get(168), do: :nicaragua_nmc
  def get(169), do: :panama_nmc
  def get(170), do: :saint_lucia_nmc
  def get(171), do: :trinidad_and_tobago_nmc
  def get(172), do: :french_departments_in_ra_iv
  def get(173), do: :us_national_aeronautics_and_space_administration
  def get(174), do: :integrated_system_data_management_marine_environmental_data_service
  def get(n) when n >= 175 and n <= 189, do: :reserved
  def get(190), do: :cook_islands_nmc
  def get(191), do: :french_polynesia_nmc
  def get(192), do: :tonga_nmc
  def get(193), do: :vanuatu_nmc
  def get(194), do: :brunei_darussalam_nmc
  def get(195), do: :indonesia_nmc
  def get(196), do: :kiribati_nmc
  def get(197), do: :federated_states_of_micronesia_nmc
  def get(198), do: :new_caledonia_nmc
  def get(199), do: :niue
  def get(200), do: :papua_new_guinea_nmc
  def get(201), do: :philippines_nmc
  def get(202), do: :samoa_nmc
  def get(203), do: :solomon_islands_nmc
  def get(204), do: :national_institute_of_water_and_atmospheric_research_new_zealand
  def get(210), do: :frascati
  def get(211), do: :lannion
  def get(212), do: :lisboa
  def get(213), do: :reykjavik
  def get(214), do: :madrid
  def get(215), do: :zurich
  def get(216), do: :service_argos_toulouse
  def get(217), do: :bratislava
  def get(218), do: :budapest
  def get(219), do: :ljubljana
  def get(220), do: :warsaw
  def get(221), do: :zagreb
  def get(222), do: :albania_nmc
  def get(223), do: :armenia_nmc
  def get(224), do: :austria_nmc
  def get(225), do: :azerbaijan_nmc
  def get(226), do: :belarus_nmc
  def get(227), do: :belgium_nmc
  def get(228), do: :bosnia_and_herzegovina_nmc
  def get(229), do: :bulgaria_nmc
  def get(230), do: :cyprus_nmc
  def get(231), do: :estonia_nmc
  def get(232), do: :georgia_nmc
  def get(233), do: :dublin
  def get(234), do: :israel_nmc
  def get(235), do: :jordan_nmc
  def get(236), do: :latvia_nmc
  def get(237), do: :lebanon_nmc
  def get(238), do: :lithuania_nmc
  def get(239), do: :luxembourg
  def get(240), do: :malta_nmc
  def get(241), do: :monaco
  def get(242), do: :romania_nmc
  def get(243), do: :syrian_arab_republic_nmc
  def get(244), do: :the_former_yugoslav_republic_of_macedonia_nmc
  def get(245), do: :ukraine_nmc
  def get(246), do: :republic_of_moldova_nmc
  def get(247), do: :operational_programme_for_the_exchange_of_weather_radar_information
  def get(250), do: :consortium_for_small_scale_modelling
  def get(251), do: :meteorological_cooperation_on_operational_nwp
  def get(252), do: :max_planck_institute_for_meteorology
  def get(254), do: :eumetsat_operation_centre
  def get(255), do: :missing
end
