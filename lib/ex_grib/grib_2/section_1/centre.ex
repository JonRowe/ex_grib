defmodule ExGrib.Grib2.Section1.Centre do
  @moduledoc """
  Returns the name of the national / international originating
  centre (assigned by the WMO) from an integer in the GRIB.

  https://www.nco.ncep.noaa.gov/pmb/docs/on388/table0.html
  """

  @type id :: integer()
  @type t ::
          :melbourne_wmc
          | :moscow_wmc
          | :us_national_weather_service_ncep_wmc
          | :us_national_weather_service_nwstg_wmc
          | :us_national_weather_service_other_wmc
          | :cairo_rmsc_rafc
          | :dakar_rmsc_rafc
          | :nairobi_rmsc_rafc
          | :casablanca_rmsc
          | :tunis_rmsc
          | :tunis_casablanca_rmsc
          | :las_palmas_rafc
          | :algiers_rmsc
          | :acmad
          | :mozambique_nmc
          | :pretoria_rmsc
          | :la_reunion_rmsc
          | :khabarovsk_rmsc
          | :new_delhi_rsmc_rafc
          | :novosibirsk_rmsc
          | :tashkent_rmsc
          | :jeddah_rmsc
          | :tokyo_rsmc_japanese_meteorological_agency
          | :bankok
          | :ulan_bator
          | :beijing_rmsc
          | :seoul
          | :buenos_aires_rsmc_rafc
          | :brasilia_rmsc_rafc
          | :santiago
          | :brazilian_space_agency_inpe
          | :columbia_nmc
          | :ecuador_nmc
          | :peru_nmc
          | :venezuela_nmc
          | :miami_rmsc_rafc
          | :canadian_meteorological_service_montreal_rmsc
          | :san_francisco
          | :arinc_center
          | :us_air_force_air_force_global_weather_center
          | :fleet_numerical_meteorology_and_oceanography_center_monterey_ca_usa
          | :the_noaa_forecast_systems_lab_boulder_co_usa
          | :national_center_for_atmospheric_research_ncar_boulder_co
          | :service_argos_landover__md_usa
          | :us_naval_oceanographic_office
          | :international_research_institude_for_climate_and_society
          | :honolulu
          | :darwin_rmsc
          | :melbourne_rmsc
          | :reserved
          | :wellington_rmsc_rafc
          | :nadi_rmsc
          | :singapore
          | :malaysia_nmc
          | :uk_met_office_exeter_rmsc
          | :moscow_rsmc_rafc
          | :reserved
          | :offenbach_rsmc
          | :rome_rsmc
          | :norrkoping
          | :french_weather_service_toulouse
          | :helsinki
          | :belgrade
          | :oslo
          | :prague
          | :episkopi
          | :ankara
          | :frankfurt_main_rafc
          | :london_wafc
          | :copenhagen
          | :rota
          | :athens
          | :european_space_agency_esa
          | :european_center_for_medium_range_weather_forecasts_rmsc
          | :de_bilt_netherlands
          | :brazzaville
          | :abidjan
          | :libyan_arab_jamahiriya_nmc
          | :madagascar_nmc
          | :mauritius_nmc
          | :niger_nmc
          | :seychelles_nmc
          | :uganda_nmc
          | :united_republic_of_tanzania_nmc
          | :zimbabwe_nmc
          | :hong_kong
          | :afghanistan_nmc
          | :bahrain_nmc
          | :bangladesh_nmc
          | :bhutan_nmc
          | :cambodia_nmc
          | :democratic_peoples_republic_of_korea_nmc
          | :islamic_republic_of_iran_nmc
          | :iraq_nmc
          | :kazakhstan_nmc
          | :kuwait_nmc
          | :kyrgyz_republic_nmc
          | :lao_peoples_democratic_republic_nmc
          | :macao_china
          | :maldives_nmc
          | :myanmar_nmc
          | :nepal_nmc
          | :oman_nmc
          | :pakistan_nmc
          | :qatar_nmc
          | :yemen_nmc
          | :sri_lanka_nmc
          | :tajikistan_nmc
          | :turkmenistan_nmc
          | :united_arab_emirates_nmc
          | :uzbekistan_nmc
          | :viet_nam_nmc
          | :reserved
          | :bolivia_nmc
          | :guyana_nmc
          | :paraguay_nmc
          | :suriname_nmc
          | :uruguay_nmc
          | :french_guyana
          | :brazilian_navy_hydrographic_center
          | :national_commission_on_space_activities_argentina
          | :brazilian_department_of_airspace_control_decea
          | :reserved
          | :antigua_and_barbuda_nmc
          | :bahamas_nmc
          | :barbados_nmc
          | :belize_nmc
          | :british_caribbean_territories_center
          | :san_jose
          | :cuba_nmc
          | :dominica_nmc
          | :dominican_republic_nmc
          | :el_salvador_nmc
          | :us_noaa_nesdis
          | :us_noaa_office_of_oceanic_and_atmospheric_research
          | :guatemala_nmc
          | :haiti_nmc
          | :honduras_nmc
          | :jamaica_nmc
          | :mexico_city
          | :netherlands_antilles_and_aruba_nmc
          | :nicaragua_nmc
          | :panama_nmc
          | :saint_lucia_nmc
          | :trinidad_and_tobago_nmc
          | :french_departments_in_ra_iv
          | :us_national_aeronautics_and_space_administration_nasa
          | :integrated_system_data_management_marine_environmental_data_service_isdm_meds_canada
          | :reserved
          | :us_cooperative_institude_for_meteorological_satellite_studies
          | :reserved
          | :cook_islands_nmc
          | :french_polynesia_nmc
          | :tonga_nmc
          | :vanuatu_nmc
          | :brunei_nmc
          | :indonesia_nmc
          | :kiribati_nmc
          | :federated_states_of_micronesia_nmc
          | :new_caledonia_nmc
          | :niue
          | :papua_new_guinea_nmc
          | :philippines_nmc
          | :samoa_nmc
          | :solomon_islands_nmc
          | :narional_institude_of_water_and_atmospheric_research_new_zealand
          | :reserved
          | :frascati_esa_esrin
          | :lanion
          | :lisbon
          | :reykjavik
          | :madrid
          | :zurich
          | :service_argos_toulouse
          | :bratislava
          | :budapest
          | :ljubljana
          | :warsaw
          | :zagreb
          | :albania_nmc
          | :armenia_nmc
          | :austria_nmc
          | :azerbaijan_nmc
          | :belarus_nmc
          | :belgium_nmc
          | :bosnia_and_herzegovina_nmc
          | :bulgaria_nmc
          | :cyprus_nmc
          | :estonia_nmc
          | :georgia_nmc
          | :dublin
          | :israel_nmc
          | :jordan_nmc
          | :latvia_nmc
          | :lebanon_nmc
          | :lithuania_nmc
          | :luxembourg
          | :malta_nmc
          | :monaco
          | :romania_nmc
          | :syrian_arab_republic_nmc
          | :the_former_yugoslav_republic_of_macedonia_nmc
          | :ukraine_nmc
          | :republic_of_moldova_nmc
          | :operational_programme_for_the_exchange_of_weather_radar_information_opera_eumetnet
          | :reserved
          | :consortium_for_small_scale_modelling_cosmo
          | :reserved
          | :eumetsat_operations_center
          | :missing_value

  @spec get(id()) :: t()
  def get(n) when n >= 1 and n <= 3, do: :melbourne_wmc
  def get(n) when n >= 4 and n <= 6, do: :moscow_wmc
  def get(7), do: :us_national_weather_service_ncep_wmc
  def get(8), do: :us_national_weather_service_nwstg_wmc
  def get(9), do: :us_national_weather_service_other_wmc
  def get(n) when n in [10, 11], do: :cairo_rmsc_rafc
  def get(n) when n in [12, 13], do: :dakar_rmsc_rafc
  def get(n) when n in [14, 15], do: :nairobi_rmsc_rafc
  def get(16), do: :casablanca_rmsc
  def get(17), do: :tunis_rmsc
  def get(n) when n in [18, 19], do: :tunis_casablanca_rmsc
  def get(20), do: :las_palmas_rafc
  def get(21), do: :algiers_rmsc
  def get(22), do: :acmad
  def get(23), do: :mozambique_nmc
  def get(24), do: :pretoria_rmsc
  def get(25), do: :la_reunion_rmsc
  def get(n) when n in [26, 27], do: :khabarovsk_rmsc
  def get(n) when n in [28, 29], do: :new_delhi_rsmc_rafc
  def get(n) when n in [30, 31], do: :novosibirsk_rmsc
  def get(32), do: :tashkent_rmsc
  def get(33), do: :jeddah_rmsc
  def get(n) when n in [34, 35], do: :tokyo_rsmc_japanese_meteorological_agency
  def get(36), do: :bankok
  def get(37), do: :ulan_bator
  def get(n) when n in [38, 39], do: :beijing_rmsc
  def get(40), do: :seoul
  def get(n) when n in [41, 42], do: :buenos_aires_rsmc_rafc
  def get(n) when n in [43, 44], do: :brasilia_rmsc_rafc
  def get(45), do: :santiago
  def get(46), do: :brazilian_space_agency_inpe
  def get(47), do: :columbia_nmc
  def get(48), do: :ecuador_nmc
  def get(49), do: :peru_nmc
  def get(50), do: :venezuela_nmc
  def get(n) when n in [51, 52], do: :miami_rmsc_rafc
  def get(n) when n in [53, 54], do: :canadian_meteorological_service_montreal_rmsc
  def get(55), do: :san_francisco
  def get(56), do: :arinc_center
  def get(57), do: :us_air_force_air_force_global_weather_center
  def get(58), do: :fleet_numerical_meteorology_and_oceanography_center_monterey_ca_usa
  def get(59), do: :the_noaa_forecast_systems_lab_boulder_co_usa
  def get(60), do: :national_center_for_atmospheric_research_ncar_boulder_co
  def get(61), do: :service_argos_landover__md_usa
  def get(62), do: :us_naval_oceanographic_office
  def get(63), do: :international_research_institude_for_climate_and_society
  def get(64), do: :honolulu
  def get(n) when n in [65, 66], do: :darwin_rmsc
  def get(67), do: :melbourne_rmsc
  def get(68), do: :reserved
  def get(n) when n in [69, 70], do: :wellington_rmsc_rafc
  def get(71), do: :nadi_rmsc
  def get(72), do: :singapore
  def get(73), do: :malaysia_nmc
  def get(n) when n in [74, 75], do: :uk_met_office_exeter_rmsc
  def get(76), do: :moscow_rsmc_rafc
  def get(77), do: :reserved
  def get(n) when n in [78, 79], do: :offenbach_rsmc
  def get(n) when n in [80, 81], do: :rome_rsmc
  def get(n) when n in [82, 83], do: :norrkoping
  def get(n) when n in [84, 85], do: :french_weather_service_toulouse
  def get(86), do: :helsinki
  def get(87), do: :belgrade
  def get(88), do: :oslo
  def get(89), do: :prague
  def get(90), do: :episkopi
  def get(91), do: :ankara
  def get(92), do: :frankfurt_main_rafc
  def get(93), do: :london_wafc
  def get(94), do: :copenhagen
  def get(95), do: :rota
  def get(96), do: :athens
  def get(97), do: :european_space_agency_esa
  def get(98), do: :european_center_for_medium_range_weather_forecasts_rmsc
  def get(99), do: :de_bilt_netherlands
  def get(100), do: :brazzaville
  def get(101), do: :abidjan
  def get(102), do: :libyan_arab_jamahiriya_nmc
  def get(103), do: :madagascar_nmc
  def get(104), do: :mauritius_nmc
  def get(105), do: :niger_nmc
  def get(106), do: :seychelles_nmc
  def get(107), do: :uganda_nmc
  def get(108), do: :united_republic_of_tanzania_nmc
  def get(109), do: :zimbabwe_nmc
  def get(110), do: :hong_kong
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
  def get(130), do: :yemen_nmc
  def get(131), do: :sri_lanka_nmc
  def get(132), do: :tajikistan_nmc
  def get(133), do: :turkmenistan_nmc
  def get(134), do: :united_arab_emirates_nmc
  def get(135), do: :uzbekistan_nmc
  def get(136), do: :viet_nam_nmc
  def get(n) when n >= 137 and n <= 139, do: :reserved
  def get(140), do: :bolivia_nmc
  def get(141), do: :guyana_nmc
  def get(142), do: :paraguay_nmc
  def get(143), do: :suriname_nmc
  def get(144), do: :uruguay_nmc
  def get(145), do: :french_guyana
  def get(146), do: :brazilian_navy_hydrographic_center
  def get(147), do: :national_commission_on_space_activities_argentina
  def get(148), do: :brazilian_department_of_airspace_control_decea
  def get(149), do: :reserved
  def get(150), do: :antigua_and_barbuda_nmc
  def get(151), do: :bahamas_nmc
  def get(152), do: :barbados_nmc
  def get(153), do: :belize_nmc
  def get(154), do: :british_caribbean_territories_center
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
  def get(166), do: :mexico_city
  def get(167), do: :netherlands_antilles_and_aruba_nmc
  def get(168), do: :nicaragua_nmc
  def get(169), do: :panama_nmc
  def get(170), do: :saint_lucia_nmc
  def get(171), do: :trinidad_and_tobago_nmc
  def get(172), do: :french_departments_in_ra_iv
  def get(173), do: :us_national_aeronautics_and_space_administration_nasa

  def get(174),
    do: :integrated_system_data_management_marine_environmental_data_service_isdm_meds_canada

  def get(175), do: :reserved
  def get(176), do: :us_cooperative_institude_for_meteorological_satellite_studies
  def get(n) when n >= 177 and n <= 189, do: :reserved
  def get(190), do: :cook_islands_nmc
  def get(191), do: :french_polynesia_nmc
  def get(192), do: :tonga_nmc
  def get(193), do: :vanuatu_nmc
  def get(194), do: :brunei_nmc
  def get(195), do: :indonesia_nmc
  def get(196), do: :kiribati_nmc
  def get(197), do: :federated_states_of_micronesia_nmc
  def get(198), do: :new_caledonia_nmc
  def get(199), do: :niue
  def get(200), do: :papua_new_guinea_nmc
  def get(201), do: :philippines_nmc
  def get(202), do: :samoa_nmc
  def get(203), do: :solomon_islands_nmc
  def get(204), do: :narional_institude_of_water_and_atmospheric_research_new_zealand
  def get(n) when n >= 205 and n <= 209, do: :reserved
  def get(210), do: :frascati_esa_esrin
  def get(211), do: :lanion
  def get(212), do: :lisbon
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

  def get(247),
    do: :operational_programme_for_the_exchange_of_weather_radar_information_opera_eumetnet

  def get(n) when n in [248, 249], do: :reserved
  def get(250), do: :consortium_for_small_scale_modelling_cosmo
  def get(n) when n in [251, 253], do: :reserved
  def get(254), do: :eumetsat_operations_center
  def get(255), do: :missing_value
end
