defmodule ExGrib.Grib2.Section4.AerosolType do
  @moduledoc """
  Table 4.233

  Aerosol type

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-233.shtml
  """

  @type id :: integer()
  @type t ::
          :acetic_acid
          | :aceto_nitrile
          | :aerosol_high_absorption
          | :aerosol_low_absorption
          | :all_nitrogen_oxides
          | :alpha_hexachlorocyclohexane
          | :alpha_pinene
          | :ammonia
          | :ammonium
          | :ammonium_dry
          | :anthropogenic_non_methane_volatile_organic_compounds_expressed_as_carbon
          | :atomic_bromide
          | :atomic_chlorine
          | :atomic_nitrogen
          | :atomic_oxygen
          | :benzene
          | :beta_pinene
          | :biogenic_non_methane_volatile_organic_compounds_expressed_as_carbon
          | :black_carbon_dry
          | :black_carbon_hydrophilic_dry
          | :black_carbon_hydrophobic_dry
          | :bromine_chloride
          | :bromine_monoxide
          | :bromine_nitrate
          | :butanes
          | :carbon_dioxide
          | :carbon_monoxide
          | :carbon_tetrachloride
          | :cfc
          | :chlorine_dioxide
          | :chlorine_monoxide
          | :chlorine_nitrate
          | :dichlorine_peroxide
          | :dimethyl_sulphide
          | :dinitrogen_pentoxide
          | :divalent_mercury
          | :dust_dry
          | :elemental_mercury
          | :ethane
          | :ethanol
          | :ethene
          | :ethyne
          | :formaldehyde
          | :formic_acid
          | :halon
          | :hcc
          | :hcfc
          | :hexachlorobiphenyl
          | :hexachlorocyclohexane
          | :hox_radical
          | :hydrogen_bromide
          | :hydrogen_chloride
          | :hydrogen_cyanide
          | :hydrogen_peroxide
          | :hydroperoxyl_radical
          | :hydroxyl_radical
          | :hypobromous_acid
          | :hypochlorous_acid
          | :isoprene
          | :limonene
          | :lumped_alkanes
          | :lumped_alkenes
          | :lumped_aromatic_coumpounds
          | :lumped_oxygenated_hydrocarbons
          | :lumped_terpenes
          | :mercury_dry
          | :methane
          | :methanol
          | :methyl_bromide
          | :methyl_chloride
          | :methyl_hydroperoxide
          | :methyl_peroxy_radical
          | :molecular_hydrogen
          | :nitrate_dry
          | :nitrate_hydrophilic_dry
          | :nitrate_hydrophobic_dry
          | :nitrate_radical
          | :nitric_acid
          | :nitric_acid_trihydrate
          | :nitrogen_dioxide
          | :nitrogen_monoxide
          | :nitrous_acid
          | :nitrous_oxide
          | :non_methane_volatile_organic_compounds_expressed_as_carbon
          | :nox_expressed_as_nitrogen
          | :oxygen
          | :ozone
          | :particulate_organic_matter_dry
          | :particulate_organic_matter_hydrophilic_dry
          | :particulate_organic_matter_hydrophobic_dry
          | :passive_ozone
          | :peroxyacetyl_nitrate
          | :peroxynitric_acid
          | :primary_particulate_organic_matter_dry
          | :propane
          | :propene
          | :radioactive_pollutant
          | :radon
          | :sea_salt_dry
          | :secondary_particulate_organic_matter_dry
          | :smoke_high_absorption
          | :smoke_low_absorption
          | :sulphate
          | :sulphate_dry
          | :sulphur_dioxide
          | :toluene
          | :total_aerosol
          | :total_inorganic_and_organic_peroxy_radicals
          | :total_inorganic_bromine
          | :total_inorganic_bromine_except_hbr
          | :total_inorganic_chlorine
          | :total_inorganic_chlorine_except_hcl
          | :volcanic_ash
          | :water_in_ambient
          | :water_vapour
          | :xylene
          | :reserved
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :ozone
  def get(1), do: :water_vapour
  def get(2), do: :methane
  def get(3), do: :carbon_dioxide
  def get(4), do: :carbon_monoxide
  def get(5), do: :nitrogen_dioxide
  def get(6), do: :nitrous_oxide
  def get(7), do: :formaldehyde
  def get(8), do: :sulphur_dioxide
  def get(9), do: :ammonia
  def get(10), do: :ammonium
  def get(11), do: :nitrogen_monoxide
  def get(12), do: :atomic_oxygen
  def get(13), do: :nitrate_radical
  def get(14), do: :hydroperoxyl_radical
  def get(15), do: :dinitrogen_pentoxide
  def get(16), do: :nitrous_acid
  def get(17), do: :nitric_acid
  def get(18), do: :peroxynitric_acid
  def get(19), do: :hydrogen_peroxide
  def get(20), do: :molecular_hydrogen
  def get(21), do: :atomic_nitrogen
  def get(22), do: :sulphate
  def get(23), do: :radon
  def get(24), do: :elemental_mercury
  def get(25), do: :divalent_mercury
  def get(26), do: :atomic_chlorine
  def get(27), do: :chlorine_monoxide
  def get(28), do: :dichlorine_peroxide
  def get(29), do: :hypochlorous_acid
  def get(30), do: :chlorine_nitrate
  def get(31), do: :chlorine_dioxide
  def get(32), do: :atomic_bromide
  def get(33), do: :bromine_monoxide
  def get(34), do: :bromine_chloride
  def get(35), do: :hydrogen_bromide
  def get(36), do: :hypobromous_acid
  def get(37), do: :bromine_nitrate
  def get(38), do: :oxygen
  def get(n) when n >= 39 and n <= 9999, do: :reserved
  def get(10000), do: :hydroxyl_radical
  def get(10001), do: :methyl_peroxy_radical
  def get(10002), do: :methyl_hydroperoxide
  def get(10003), do: :reserved
  def get(10004), do: :methanol
  def get(10005), do: :formic_acid
  def get(10006), do: :hydrogen_cyanide
  def get(10007), do: :aceto_nitrile
  def get(10008), do: :ethane
  # Ethene (= Ethylene)
  def get(10009), do: :ethene
  # Ethyne (= Acetylene)
  def get(10010), do: :ethyne
  def get(10011), do: :ethanol
  def get(10012), do: :acetic_acid
  def get(10013), do: :peroxyacetyl_nitrate
  def get(10014), do: :propane
  def get(10015), do: :propene
  def get(10016), do: :butanes
  def get(10017), do: :isoprene
  def get(10018), do: :alpha_pinene
  def get(10019), do: :beta_pinene
  def get(10020), do: :limonene
  def get(10021), do: :benzene
  def get(10022), do: :toluene
  def get(10023), do: :xylene
  def get(n) when n >= 10024 and n <= 10499, do: :reserved
  def get(10500), do: :dimethyl_sulphide
  def get(n) when n >= 10501 and n <= 20000, do: :reserved
  def get(20001), do: :hydrogen_chloride
  # CFC-11
  def get(20002), do: :cfc
  # CFC-12
  def get(20003), do: :cfc
  # CFC-113
  def get(20004), do: :cfc
  # CFC-113a
  def get(20005), do: :cfc
  # CFC-114
  def get(20006), do: :cfc
  # CFC-115
  def get(20007), do: :cfc
  # HCFC-22
  def get(20008), do: :hcfc
  # HCFC-141b
  def get(20009), do: :hcfc
  # HCFC-142b
  def get(20010), do: :hcfc
  # Halon-1202
  def get(20011), do: :halon
  # Halon-1211
  def get(20012), do: :halon
  # Halon-1301
  def get(20013), do: :halon
  # Halon-2402
  def get(20014), do: :halon
  # Methyl Chloride (HCC-40)
  def get(20015), do: :methyl_chloride
  # Carbon Tetrachloride (HCC-10)
  def get(20016), do: :carbon_tetrachloride
  # HCC-140a
  def get(20017), do: :hcc
  # Methyl Bromide (HBC-40B1)
  def get(20018), do: :methyl_bromide
  # Hexachlorocyclohexane (HCH)
  def get(20019), do: :hexachlorocyclohexane
  def get(20020), do: :alpha_hexachlorocyclohexane
  # Hexachlorobiphenyl (PCB-153)
  def get(20021), do: :hexachlorobiphenyl
  def get(n) when n >= 20022 and n <= 29999, do: :reserved
  # Radioactive Pollutant (Tracer, defined by originating centre)
  def get(30000), do: :radioactive_pollutant
  def get(n) when n >= 30001 and n <= 50000, do: :reserved
  # HOx Radical (OH+HO2)
  def get(60000), do: :hox_radical
  # Total Inorganic and Organic Peroxy Radicals (HO2+RO2)
  def get(60001), do: :total_inorganic_and_organic_peroxy_radicals
  def get(60002), do: :passive_ozone
  def get(60003), do: :nox_expressed_as_nitrogen
  # All Nitrogen Oxides (NOy) Expressed As Nitrogen
  def get(60004), do: :all_nitrogen_oxides
  def get(60005), do: :total_inorganic_chlorine
  def get(60006), do: :total_inorganic_bromine
  # Total Inorganic Chlorine Except HCl, ClONO2: ClOx
  def get(60007), do: :total_inorganic_chlorine_except_hcl
  # Total Inorganic Bromine Except Hbr, BrONO2:BrOx
  def get(60008), do: :total_inorganic_bromine_except_hbr
  def get(60009), do: :lumped_alkanes
  def get(60010), do: :lumped_alkenes
  def get(60011), do: :lumped_aromatic_coumpounds
  def get(60012), do: :lumped_terpenes
  def get(60013), do: :non_methane_volatile_organic_compounds_expressed_as_carbon
  def get(60014), do: :anthropogenic_non_methane_volatile_organic_compounds_expressed_as_carbon
  def get(60015), do: :biogenic_non_methane_volatile_organic_compounds_expressed_as_carbon
  def get(60016), do: :lumped_oxygenated_hydrocarbons
  def get(n) when n >= 60017 and n <= 61999, do: :reserved
  def get(62000), do: :total_aerosol
  def get(62001), do: :dust_dry
  def get(62002), do: :water_in_ambient
  def get(62003), do: :ammonium_dry
  def get(62004), do: :nitrate_dry
  def get(62005), do: :nitric_acid_trihydrate
  def get(62006), do: :sulphate_dry
  def get(62007), do: :mercury_dry
  def get(62008), do: :sea_salt_dry
  def get(62009), do: :black_carbon_dry
  def get(62010), do: :particulate_organic_matter_dry
  def get(62011), do: :primary_particulate_organic_matter_dry
  def get(62012), do: :secondary_particulate_organic_matter_dry
  def get(62013), do: :black_carbon_hydrophilic_dry
  def get(62014), do: :black_carbon_hydrophobic_dry
  def get(62015), do: :particulate_organic_matter_hydrophilic_dry
  def get(62016), do: :particulate_organic_matter_hydrophobic_dry
  def get(62017), do: :nitrate_hydrophilic_dry
  def get(62018), do: :nitrate_hydrophobic_dry
  def get(62019), do: :reserved
  def get(62020), do: :smoke_high_absorption
  def get(62021), do: :smoke_low_absorption
  def get(62022), do: :aerosol_high_absorption
  def get(62023), do: :aerosol_low_absorption
  def get(62024), do: :reserved
  def get(62025), do: :volcanic_ash
  def get(n) when n >= 62017 and n <= 65534, do: :reserved
  def get(65535), do: :missing
end
