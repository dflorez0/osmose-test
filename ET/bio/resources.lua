#!/usr/bin/lua
--[[------------------------------------------------------

  # resources

--]]------------------------------------------------------

local osmose = require 'osmose'
local lib = osmose.Model 'resources'

lib.inputs = { 
-- input for CO2 tax 
co2tax = {default = 0.04, min=0, max=100000, unit = 'USD/kgCO2eq'}, 

-- inputs for prices of resources - Cost2
wood_price = {default = 0.04, unit = 'USD/kWh'},
sc_price = {default = 0.03, unit = 'USD/kg'},
elec_EU_price = {default = 0.16, unit = 'USD/kWh'},
enzymes_price = {default = 10, unit = 'USD/kg'},
freshwater_price = {default = 0.001, unit = 'USD/kg'},
ng_price = {default = 9.77, unit = 'USD/MMBtu'},


----------------------------------------------------------------------
-- inputs for reference size of units
wood_input = {default = 73952, min=0, max=100000, unit = 'kg/h'}, -- wet wood input HHV = 9936 kJ/kg
sugarcane_input = {default = 500000, min=0, max=1000000, unit = 'kg/h'}, 
elec_ref = {default = 100, min=0, max=100000, unit = 'kW'}, 
enzymes_ref = {default = 10, min=0, max=100000, unit = 'kg/h'}, 
freshwater_ref = {default = 100000, min=0, max=1000000, unit = 'kg/h'}, 
ng_ref = {default = 54000, min=0, max=100000, unit = 'kW'}, 
ammonia_ref = {default = 0.1, min=0, max=100000, unit = 'kg/h'}, 
sulfuric_acid_ref = {default = 1000, min=0, max=100000, unit = 'kg/h'}, 
phosphoric_acid_ref = {default = 1, min=0, max=100000, unit = 'kg/h'}, 
calcium_hydroxid_ref = {default = 100, min=0, max=100000, unit = 'kg/h'}, 
trimethylamine_ref = {default = 1, min=0, max=100000, unit = 'kg/h'}, 
methanol_ref = {default = 1000, min=0, max=100000, unit = 'kg/h'}, 
magnesium_chloride_ref = {default = 10, min=0, max=100000, unit = 'kg/h'}, 
ammonium_sulphate_ref = {default = 10, min=0, max=100000, unit = 'kg/h'}, 
calcium_chloride_ref = {default = 1, min=0, max=100000, unit = 'kg/h'}, 
sodium_hydroxide_ref = {default = 0.1, min=0, max=100000, unit = 'kg/h'}, 
H2KO4P_ref = {default = 10, min=0, max=1000, unit = 'kg/h'}, 

--inputs for CO2eq emission of the units- Impact2
wood_CO2eq = {default = 5.4809, min=0, max=100000, unit = 'kgCO2eq/m3'}, 
sugarcane_CO2eq = {default = 	0.022069, min=0, max=100000, unit = 'kgCO2eq/kg'}, 
elec_UCTE_CO2eq = {default = 0.5163, min=0, max=100000, unit = 'kgCO2eq/kWh'}, 
enzymes_EU27_CO2eq = {default = 10, min=0, max=100000, unit = 'kgCO2eq/kg'}, 
freshwater_CO2eq = {default = 0.00016755, min=0, max=100000, unit = 'kgCO2eq/kg'}, 
ng_CO2eq = {default = 0.218, min=0, max=100000, unit = 'kgCO2eq/kWh'}, 
ammonia_CO2eq = {default = 2.9016, min=0, max=100000, unit = 'kgCO2eq/kg'},
sulfuric_acid_CO2eq = {default = 0.12406, min=0, max=100000, unit = 'kgCO2eq/kg'},
phosphoric_acid_CO2eq = {default = 1.4206, min=0, max=100000, unit = 'kgCO2eq/kg'},
calcium_hydroxid_CO2eq = {default = 0.98383, min=0, max=100000, unit = 'kgCO2eq/kg'},
trimethylamine_CO2eq = {default = 2.4683, min=0, max=100000, unit = 'kgCO2eq/kg'},
methanol_CO2eq = {default = 0.74478, min=0, max=100000, unit = 'kgCO2eq/kg'},
magnesium_chloride_CO2eq = {default = 1.0593, min=0, max=100000, unit = 'kgCO2eq/kg'},
ammonium_sulphate_CO2eq = {default = 2.6941, min=0, max=100000, unit = 'kgCO2eq/kg'},
calcium_chloride_CO2eq = {default = 0.85455, min=0, max=100000, unit = 'kgCO2eq/kg'},
sodium_hydroxide_CO2eq = {default = 1.0975, min=0, max=100000, unit = 'kgCO2eq/kg'},
H2KO4P_CO2eq = {default = 2.3332, min=0, max=100000, unit = 'kgCO2eq/kg'},

--inputs - other parameters 
dens_wood = {default = 188.6, min=0, max=100000, unit = 'kg/m3'}, 
hhv_wood_50 = {default = 9736, min=0, max=100000, unit = 'kJ/kg'}, 

-- inputs biomass
atp_wood_input = {default = 0, min=0, max=100000, unit = '-'}, 
atp_sugarcane_input = {default = 1, min=0, max=100000, unit = '-'}, 

 -- prices not used yet !!!!
--var_price = {default = 2, min=0, max=10, unit = '$/Mult'},
--meoh_price = {default = 0.111, unit = 'USD/kWh'},
--elec_price_BR = {default = 0.16, unit = 'USD/kWh'},
--sng_price = {default = 0.052 , unit = 'USD/kWh'},
--ng_price = {default = 0.04, unit = 'USD/kWh'},
--diesel_price = {default = 2.06, unit = 'USD/L'},
--petrol_price = {default = 1.96, unit = 'USD/L'},
--ft_price = {default = 0.063, unit = 'USD/kWh'},
--biodiesel_price = {default = 0.063, unit = 'USD/kWh'},
--dme_price = {default = 0.07, unit = 'USD/kWh'},
--biogas_price = {default = 0.0364, unit = 'USD/kWh'},
--ethanol_price = {default = 0.943, unit = 'USD/L'},
--ethanol_price_BR = {default = 0.6, unit = 'USD/L'},
--ethanol_hydro_price = {default = 0.5409, unit = 'USD/L'},
--lignin_os = {default = 0.45, unit = 'USD/kg'},
--lignin_se = {default = 0.08, unit = 'USD/kg'},
--xylitol_price = {default = 10, unit = 'USD/kg'},
--succinic_price = {default = 5, unit = 'USD/kg'},
--nh3_price = {default = 0.46, unit = 'USD/kg'},
--ethylene_price = {default = 1.105, unit = 'USD/kg'},
--protein_price = {default = 0.9, unit = 'USD/kg'},


}

lib.outputs = { 
  
  wood_unit_price = {unit = '$/h', job = "(wood_price*wood_input*hhv_wood_50*(1/3600)) " }, 
  elec_unit_price = {unit = '$/h', job = "(elec_EU_price*elec_ref) " }, 
  enzymes_unit_price = {unit = '$/h', job = "(enzymes_price*enzymes_ref) " }, 
  freshwater_unit_price = {unit = '$/h', job = "(freshwater_price*freshwater_ref) " }, 
  ng_unit_price = {unit = '$/h', job = "((ng_price*0.003412)*ng_ref) " }, 
  
  sugarcane_unit_price = {unit = '$/h', job = "(sc_price*sugarcane_input) " }, 
  
  
  wood_unit_impact = {unit = 'kgCO2eq/h', job = "((co2tax*wood_CO2eq/dens_wood)*wood_input) " }, 
  elec_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*elec_UCTE_CO2eq*elec_ref) " }, 
  enzymes_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*enzymes_EU27_CO2eq*enzymes_ref) " },
  freshwater_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*freshwater_CO2eq*freshwater_ref) " }, 
  ng_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*ng_CO2eq*ng_ref) " }, 
  ammonia_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*ammonia_CO2eq*ammonia_ref) " }, 
  sulfuric_acid_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*sulfuric_acid_CO2eq*sulfuric_acid_ref) " }, 
  phosphoric_acid_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*phosphoric_acid_CO2eq*phosphoric_acid_ref) " }, 
  calcium_hydroxid_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*calcium_hydroxid_CO2eq*calcium_hydroxid_ref) " }, 
  trimethylamine_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*trimethylamine_CO2eq*trimethylamine_ref) " }, 
  methanol_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*methanol_CO2eq*methanol_ref) " }, 
  magnesium_chloride_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*magnesium_chloride_CO2eq*magnesium_chloride_ref) " }, 
  ammonium_sulphate_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*ammonium_sulphate_CO2eq*ammonium_sulphate_ref) " }, 
  calcium_chloride_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*calcium_chloride_CO2eq*calcium_chloride_ref) " }, 
  sodium_hydroxide_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*sodium_hydroxide_CO2eq*sodium_hydroxide_ref) " }, 
  H2KO4P_unit_impact = {unit = 'kgCO2eq/h', job = "(co2tax*H2KO4P_CO2eq*H2KO4P_ref) " }, 
  sugarcane_unit_impact = {unit = 'kgCO2eq/h', job = "((co2tax*sugarcane_CO2eq)*sugarcane_input) " }, 


  atp_wood_biomass =  {unit = '-', job = "atp_wood_input" },
  atp_sugarcane_biomass =  {unit = '-', job = "atp_sugarcane_input" }, 


}

lib:addLayers {wood_50 = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {electricity = {type ='MassBalance', unit ='kW'}}
lib:addLayers {enzymes = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {freshwater = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {naturalgas = {type ='MassBalance', unit ='kW'}}
lib:addLayers {oxygen= {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {dipe = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {acetonit = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {sulfuric_acid = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {phosphoric_acid = {type ='MassBalance', unit ='kg/h'}} 
lib:addLayers {calciumhydroxid = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {Methanol = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {bacteria_clostridia = {type ='MassBalance', unit ='kg/h'}}  
lib:addLayers {magnesium_chloride = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {ammonium_sulphate = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {H2KO4P = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {ammonia = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {calcium_chloride = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {sodium_hydroxide = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {Mesitylene_solvent = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {ecoli = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {n_octanol = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {trimethylamine = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {wood_fuel = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {sugarcane = {type ='MassBalance', unit ='kg/h'}}


-- PROCESS units
--[[
lib:addUnit("wood" , {type = 'Process' , AddToProblem= 1 })
--lib["wood"].Fmax = 10000
--lib["wood"].Fmin = 0
lib["wood"].Cost2 = 'wood_unit_price'
lib["wood"].Impact2 = 'wood_unit_impact'
lib["wood"]:addStreams ({wood_out = ms({'wood_50', 'out', 'wood_input' }) }) -- equivalent to 200MW biomass
]]--

lib:addUnit("sugarcane" , {type = 'Process' })
--lib["sugarcane"].Fmax = 10000
--lib["sugarcane"].Fmin = 0
lib["sugarcane"].Cost2 = 'sugarcane_unit_price'
lib["sugarcane"].Impact2 = 'sugarcane_unit_impact'
lib["sugarcane"]:addStreams ({wood_out = ms({'sugarcane', 'out', 'sugarcane_input', AddToProblem='atp_sugarcane_biomass'}) }) 


-- units
lib:addUnit("wood_fuel" , {type = 'Utility' })
lib["wood_fuel"].Fmax = 10000
lib["wood_fuel"].Fmin = 0
lib["wood_fuel"].Cost2 = 'wood_unit_price'
lib["wood_fuel"].Impact2 = 'wood_unit_impact'
lib["wood_fuel"]:addStreams ({wood_out = ms({'wood_fuel', 'out', 'wood_input', AddToProblem=1 }) }) -- equivalent to 200MW biomass

-- units
lib:addUnit("electricity" , {type = 'Utility'} )
lib["electricity"].Fmax = 1000
lib["electricity"].Fmin = 0
lib["electricity"].Cost2 = 'elec_unit_price'
lib["electricity"].Impact2 = 'elec_unit_impact'
lib["electricity"]:addStreams({electricity_out = ms({'electricity', 'out', 'elec_ref', AddToProblem=1}) })
-- units
lib:addUnit("enzymes" , {type = 'Utility'} )
lib["enzymes"].Fmax = 1000
lib["enzymes"].Fmin = 0
lib["enzymes"].Cost2 = 'enzymes_unit_price'
lib["enzymes"].Impact2 = 'enzymes_unit_impact'
lib["enzymes"]:addStreams({enzymes_out = ms({'enzymes', 'out', 'enzymes_ref', AddToProblem=1}) })
-- units
lib:addUnit("freshwater" , {type = 'Utility'} )
lib["freshwater"].Fmax = 10000
lib["freshwater"].Fmin = 0
lib["freshwater"].Cost2 = 'freshwater_unit_price'
lib["freshwater"].Impact2 = 'freshwater_unit_impact'
lib["freshwater"]:addStreams({freshwater_out = ms({'freshwater', 'out', 'freshwater_ref', AddToProblem=1}) })

-- units
lib:addUnit("naturalgas" , {type = 'Utility'} )
lib["naturalgas"].Fmax = 10000
lib["naturalgas"].Fmin = 0
lib["naturalgas"].Cost2 = 'ng_unit_price'
lib["naturalgas"].Impact2 = 'ng_unit_impact'
lib["naturalgas"]:addStreams({naturalgas_out = ms({'naturalgas', 'out', 'ng_ref', AddToProblem=1}) })
---------------------------------------------------------------------------------------------------------------

lib:addUnit("oxygen" , {type = 'Utility'} )
lib["oxygen"].Fmax = 10000
lib["oxygen"].Fmin = 0
lib["oxygen"].Cost2 = 0
lib["oxygen"]:addStreams({oxygen_out = ms({'oxygen', 'out', 100000, AddToProblem=1}) })

lib:addUnit("dipe" , {type = 'Utility'} )
lib["dipe"].Fmax = 10000
lib["dipe"].Fmin = 0
lib["dipe"].Cost2 = 0
lib["dipe"]:addStreams({dipe_out = ms({'dipe', 'out', 100000, AddToProblem=1}) })

lib:addUnit("acetonit" , {type = 'Utility'} )
lib["acetonit"].Fmax = 10000
lib["acetonit"].Fmin = 0
lib["acetonit"].Cost2 = 0
lib["acetonit"]:addStreams({acetonit_out = ms({'acetonit', 'out', 100000, AddToProblem=1}) })

lib:addUnit("sulfuric_acid" , {type = 'Utility'} )
lib["sulfuric_acid"].Fmax = 10000
lib["sulfuric_acid"].Fmin = 0
lib["sulfuric_acid"].Cost2 = 0
lib["sulfuric_acid"].Impact2 = 'sulfuric_acid_unit_impact'
lib["sulfuric_acid"]:addStreams({sulfuric_acid_out = ms({'sulfuric_acid', 'out', 'sulfuric_acid_ref', AddToProblem=1}) })

lib:addUnit("phosphoric_acid" , {type = 'Utility'} )
lib["phosphoric_acid"].Fmax = 10000
lib["phosphoric_acid"].Fmin = 0
lib["phosphoric_acid"].Cost2 = 0
lib["phosphoric_acid"].Impact2 = 'phosphoric_acid_unit_impact'
lib["phosphoric_acid"]:addStreams({phosporic_acid_out = ms({'phosphoric_acid', 'out', 'phosphoric_acid_ref', AddToProblem=1}) })

lib:addUnit("calciumhydroxid" , {type = 'Utility'} )
lib["calciumhydroxid"].Fmax = 10000
lib["calciumhydroxid"].Fmin = 0
lib["calciumhydroxid"].Cost2 = 0
lib["calciumhydroxid"].Impact2 = 'calcium_hydroxid_unit_impact'
lib["calciumhydroxid"]:addStreams({calciumhydroxid_out = ms({'calciumhydroxid', 'out', 'calcium_hydroxid_ref', AddToProblem=1}) })

lib:addUnit("Methanol" , {type = 'Utility'} )
lib["Methanol"].Fmax = 10000
lib["Methanol"].Fmin = 0
lib["Methanol"].Cost2 = 0
lib["Methanol"].Impact2 = 'methanol_unit_impact'
lib["Methanol"]:addStreams({Methanol_out = ms({'Methanol', 'out', 'methanol_ref', AddToProblem=1}) })

--lib:addUnit("glucose_06" , {type = 'Utility'} )---???????-----------------
--lib["glucose_06"].Fmax = 10000
--lib["glucose_06"].Fmin = 0
--lib["glucose_06"].Cost2 = 0
--lib["glucose_06"]:addStreams({glucose_06_out = ms({'glucose_06', 'out', 100000, AddToProblem=1}) })

lib:addUnit("bacteria_clostridia" , {type = 'Utility'} )
lib["bacteria_clostridia"].Fmax = 10000
lib["bacteria_clostridia"].Fmin = 0
lib["bacteria_clostridia"].Cost2 = 0
lib["bacteria_clostridia"]:addStreams({bacteria_clostridia_out = ms({'bacteria_clostridia', 'out', 1, AddToProblem=1}) })

lib:addUnit("magnesium_chloride" , {type = 'Utility'} )
lib["magnesium_chloride"].Fmax = 10000
lib["magnesium_chloride"].Fmin = 0
lib["magnesium_chloride"].Cost2 = 0
lib["magnesium_chloride"].Impact2 = 'magnesium_chloride_unit_impact'
lib["magnesium_chloride"]:addStreams({magnesium_chloride_out = ms({'magnesium_chloride', 'out', 'magnesium_chloride_ref', AddToProblem=1}) })

lib:addUnit("ammonium_sulphate" , {type = 'Utility'} )
lib["ammonium_sulphate"].Fmax = 10000
lib["ammonium_sulphate"].Fmin = 0
lib["ammonium_sulphate"].Cost2 = 0
lib["ammonium_sulphate"].Impact2 = 'ammonium_sulphate_unit_impact'
lib["ammonium_sulphate"]:addStreams({ammonium_sulphate_out = ms({'ammonium_sulphate', 'out', 'ammonium_sulphate_ref', AddToProblem=1}) })

lib:addUnit("H2KO4P" , {type = 'Utility'} )
lib["H2KO4P"].Fmax = 10000
lib["H2KO4P"].Fmin = 0
lib["H2KO4P"].Cost2 = 0
lib["H2KO4P"].Impact2 = 'H2KO4P_unit_impact'
lib["H2KO4P"]:addStreams({H2KO4P_out = ms({'H2KO4P', 'out', 'H2KO4P_ref', AddToProblem=1}) })

lib:addUnit("ammonia" , {type = 'Utility'} )
lib["ammonia"].Fmax = 10000
lib["ammonia"].Fmin = 0
lib["ammonia"].Cost2 = 0
lib["ammonia"].Impact2 = 'ammonia_unit_impact'
lib["ammonia"]:addStreams({ammonia_out = ms({'ammonia', 'out', 'ammonia_ref', AddToProblem=1}) })

lib:addUnit("calcium_chloride" , {type = 'Utility'} )
lib["calcium_chloride"].Fmax = 10000
lib["calcium_chloride"].Fmin = 0
lib["calcium_chloride"].Cost2 = 0
lib["calcium_chloride"].Impact2 = 'calcium_chloride_unit_impact'
lib["calcium_chloride"]:addStreams({calcium_chloride_out = ms({'calcium_chloride', 'out', 'calcium_chloride_ref', AddToProblem=1}) })

lib:addUnit("sodium_hydroxide" , {type = 'Utility'} )
lib["sodium_hydroxide"].Fmax = 10000
lib["sodium_hydroxide"].Fmin = 0
lib["sodium_hydroxide"].Cost2 = 0
lib["sodium_hydroxide"].Impact2 = 'sodium_hydroxide_unit_impact'
lib["sodium_hydroxide"]:addStreams({sodium_hydroxide_out = ms({'sodium_hydroxide', 'out', 'sodium_hydroxide_ref', AddToProblem=1}) })

lib:addUnit("Mesitylene_solvent" , {type = 'Utility'} )
lib["Mesitylene_solvent"].Fmax = 10000
lib["Mesitylene_solvent"].Fmin = 0
lib["Mesitylene_solvent"].Cost2 = 0
lib["Mesitylene_solvent"]:addStreams({Mesitylene_solvent_out = ms({'Mesitylene_solvent', 'out', 1, AddToProblem=1}) })

lib:addUnit("ecoli" , {type = 'Utility'} )
lib["ecoli"].Fmax = 10000
lib["ecoli"].Fmin = 0
lib["ecoli"].Cost2 = 0
lib["ecoli"]:addStreams({ecoli_out = ms({'ecoli', 'out', 1, AddToProblem=1}) })

lib:addUnit("n_octanol" , {type = 'Utility'} )
lib["n_octanol"].Fmax = 10000
lib["n_octanol"].Fmin = 0
lib["n_octanol"].Cost2 = 0
lib["n_octanol"]:addStreams({n_octanol_out = ms({'n_octanol', 'out', 1000, AddToProblem=1}) })

lib:addUnit("trimethylamine" , {type = 'Utility'} )
lib["trimethylamine"].Fmax = 10000
lib["trimethylamine"].Fmin = 0
lib["trimethylamine"].Cost2 = 1
lib["trimethylamine"].Impact2 = 'trimethylamine_unit_impact'
lib["trimethylamine"]:addStreams({trimethylamine_out = ms({'trimethylamine', 'out', 'trimethylamine_ref', AddToProblem=1}) })




return lib
