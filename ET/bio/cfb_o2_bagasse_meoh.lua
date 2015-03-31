#!/usr/bin/lua
--[[------------------------------------------------------

  # template

--]]------------------------------------------------------
--require ("mobdebug").start()

local osmose = require 'osmose'
local lib = osmose.Model 'cfb_o2_bagasse_meoh'
-- Gasification of bagasse using CFB gasifier with O2 and Steam
-- Pretreatment with air dryer
-- syngas hot cleaning included
-- bagasse composition (%wt dry) C: 50% ; H: 6%; N: 1%; O: 43%
-- bagasse HHVdry = 19119kJ/kg ; HHVwet = 9560kJ/kg 

lib.values={
  air_cp=1.007,--;% kJ/kg/C 
  water_cp=4.18,--;% kJ/kg/C 
  ice_cp=2.09,--;% kj/kg/C 
  water_molarmass=18,--; % g/mol 
  air_molarmass=29,--;% g/mol
}


lib.inputs = {
 i = {default = 0.06, min=0, max=1000, unit = '-'},
year_hours = {default = 8760, min=0, max=10000, unit = 'h/y'},
working_hours = {default = 7884, min=0, max=10000, unit = 'h/y'},
lifetime = {default = 25, min=0, max=1000, unit = 'years'}, 
CEPCI_ref = {default = 567.3, min=0, max=1000, unit = ''},
CEPCI_new = {default = 575, min=0, max=1000, unit = ''},
CAPEX = {default = 1731942+19798778 , min=0, max=1000, unit = 'USD'}, -- 1731942USD Dryer;  19798778USD Gasifier; 
CAPEX_synthesis = {default = 37950742+33259562 , min=0, max=1000000, unit = 'USD'}, --  37950742USD Hot cleaning; 33259562USD MeOH Synthesis and Upgrade 


--Dryer
tin1 = {default = 25, min=0, max=1000, unit = 'C'}, -- air preheated in the pumping process
tout1 = {default = 200, min=0, max=1000, unit = 'C'},
deltah1 = {default = 14598.5, min=0, max=100000, unit = 'kW'},
deltaT1 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h1 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
 
 -- Steam production for gasification
 -- water pre-heating
tin2 = {default = 25, min=0, max=1000, unit = 'C'},
tout2 = {default = 224, min=0, max=1000, unit = 'C'},
deltah2 = {default = 1684, min=0, max=1000, unit = 'kW'},
deltaT2 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h2 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- water vaporization
tin3 = {default = 224, min=0, max=1000, unit = 'C'},
tout3 = {default = 224, min=0, max=1000, unit = 'C'},
deltah3 = {default = 3650, min=0, max=1000, unit = 'kW'},
deltaT3 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h3 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- steam superheating
tin4 = {default = 224, min=0, max=1000, unit = 'C'},
tout4 = {default = 450, min=0, max=1000, unit = 'C'},
deltah4 = {default = 1075, min=0, max=1000, unit = 'kW'},
deltaT4 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h4 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
 
 --Hot cleaning part
 -- Steam production - water pre-heating
tin5 = {default = 25, min=0, max=1000, unit = 'C'},
tout5 = {default = 224, min=0, max=1000, unit = 'C'},
deltah5 = {default = 4094  , min=0, max=1000, unit = 'kW'},
deltaT5 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h5 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Steam production - water vaporization
tin6 = {default = 224, min=0, max=1000, unit = 'C'},
tout6 = {default = 224, min=0, max=1000, unit = 'C'},
deltah6 = {default = 8842, min=0, max=1000, unit = 'kW'},
deltaT6 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h6 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Steam production - steam superheating
tin7 = {default = 224, min=0, max=1000, unit = 'C'},
tout7 = {default = 850, min=0, max=1000, unit = 'C'},
deltah7 = {default = 7015, min=0, max=1000, unit = 'kW'},
deltaT7 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h7 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Reformer 1
tin8 = {default = 850, min=0, max=1000, unit = 'C'},
tout8 = {default = 850, min=0, max=1000, unit = 'C'},
deltah8 = {default = 9076, min=0, max=1000, unit = 'kW'},
deltaT8 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h8 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Reformer 2
tin9 = {default = 850, min=0, max=1000, unit = 'C'},
tout9 = {default = 850, min=0, max=1000, unit = 'C'},
deltah9 = {default = 763, min=0, max=1000, unit = 'kW'},
deltaT9 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h9 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

--Cold cleaning part 
 
tin9 = {default = 850, min=0, max=1000, unit = 'C'},
tout9 = {default = 150, min=0, max=1000, unit = 'C'},
deltah9 = {default = -29012, min=0, max=1000, unit = 'kW'},
deltaT9 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h9 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

tin10 = {default = 150, min=0, max=1000, unit = 'C'},
tout10 = {default = 250, min=0, max=1000, unit = 'C'},
deltah10 = {default = 8632, min=0, max=1000, unit = 'kW'},
deltaT10 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h10 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
 
--Char burner
-- air pre-heating
tin11 = {default = 25, min=0, max=1000, unit = 'C'},
tout11 = {default = 400, min=0, max=1000, unit = 'C'},
deltah11 = {default = 668, min=0, max=1000, unit = 'kW'},
deltaT11 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h11 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- radiation part
tin12 = {default = 1000, min=0, max=1000, unit = 'C'},
tout12 = {default = 1000, min=0, max=1000, unit = 'C'},
deltah12 = {default = -2990, min=0, max=10000, unit = 'kW'},
deltaT12 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h12 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- convection part
tin13 = {default = 1000, min=0, max=1000, unit = 'C'},
tout13 = {default = 90, min=0, max=1000, unit = 'C'},
deltah13 = {default = -1885, min=0, max=10000, unit = 'kW'},
deltaT13 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h13 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

 -- MeOH Synthesis
 -- syngas cooling before CO2 removal
tin14 = {default = 176, min=0, max=1000, unit = 'C'},
tout14 = {default = 68, min=0, max=1000, unit = 'C'},
deltah14 = {default = -1607  , min=0, max=10000, unit = 'kW'},
deltaT14 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h14 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- syngas heating after CO2 removal
tin15 = {default = 54, min=0, max=1000, unit = 'C'},
tout15 = {default = 68, min=0, max=1000, unit = 'C'},
deltah15 = {default = 146, min=0, max=1000, unit = 'kW'},
deltaT15 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h15 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- heating before synthesis
tin16 = {default = 68, min=0, max=1000, unit = 'C'},
tout16 = {default = 260, min=0, max=1000, unit = 'C'},
deltah16 = {default = 10317, min=0, max=10000, unit = 'kW'},
deltaT16 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h16 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

tin17 = {default = 333.6, min=0, max=1000, unit = 'C'},
tout17 = {default = 260, min=0, max=1000, unit = 'C'},
deltah17 = {default = -2225.3, min=0, max=10000, unit = 'kW'},
deltaT17 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h17 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

tin18 = {default = 318, min=0, max=1000, unit = 'C'},
tout18 = {default = 260, min=0, max=1000, unit = 'C'},
deltah18 = {default = -2094, min=0, max=10000, unit = 'kW'},
deltaT18 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h18 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

tin19 = {default = 310, min=0, max=1000, unit = 'C'},
tout19 = {default = 260, min=0, max=1000, unit = 'C'},
deltah19 = {default = -2130, min=0, max=100000, unit = 'kW'},
deltaT19 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h19 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

tin20 = {default = 303.4, min=0, max=1000, unit = 'C'},
tout20 = {default = 25, min=0, max=1000, unit = 'C'},
deltah20 = {default = -16969, min=0, max=100000, unit = 'kW'},
deltaT20 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h20 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'},

tin21 = {default = 27.5, min=0, max=1000, unit = 'C'},
tout21 = {default = 68, min=0, max=1000, unit = 'C'},
deltah21 = {default = 1654, min=0, max=10000, unit = 'kW'},
deltaT21 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h21 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

-- CO2 removal 3.7 MJ/kg of CO2 at 150"C 
tin22 = {default = 150, min=0, max=1000, unit = 'C'},
tout22 = {default = 150, min=0, max=1000, unit = 'C'},
deltah22 = {default = 14408, min=0, max=100000, unit = 'kW'},
deltaT22 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h22 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

-- MeOH Upgrade
 tin23 = {default = 25, min=0, max=1000, unit = 'C'},
tout23 = {default = 31.6, min=0, max=1000, unit = 'C'},
deltah23 = {default = 52, min=0, max=100000, unit = 'kW'},
deltaT23 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h23 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

tin24 = {default = 35.3, min=0, max=1000, unit = 'C'},
tout24 = {default = 113.5, min=0, max=1000, unit = 'C'},
deltah24 = {default = 1056, min=0, max=100000, unit = 'kW'},
deltaT24 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h24 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

tin25 = {default = 131.4, min=0, max=1000, unit = 'C'},
tout25 = {default = 85, min=0, max=1000, unit = 'C'},
deltah25 = {default = -570, min=0, max=100000, unit = 'kW'},
deltaT25 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h25 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- MeOH cooling
tin26 = {default = 83, min=0, max=1000, unit = 'C'},
tout26 = {default = 25, min=0, max=1000, unit = 'C'},
deltah26 = {default = -3665, min=0, max=100000, unit = 'kW'},
deltaT26 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h26 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Columns
-- Reboilers
tin27 = {default = 131, min=0, max=1000, unit = 'C'},
tout27 = {default = 131, min=0, max=1000, unit = 'C'},
deltah27 = {default = 403, min=0, max=100000, unit = 'kW'},
deltaT27 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h27 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

tin28 = {default = 120, min=0, max=1000, unit = 'C'},
tout28 = {default = 120, min=0, max=1000, unit = 'C'},
deltah28 = {default = 6105, min=0, max=100000, unit = 'kW'},
deltaT28 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h28 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

 -- Columns
-- Condensers
tin29 = {default = 105, min=0, max=1000, unit = 'C'},
tout29 = {default = 105, min=0, max=1000, unit = 'C'},
deltah29 = {default = -186, min=0, max=100000, unit = 'kW'},
deltaT29 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h29 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

tin30 = {default = 83, min=0, max=1000, unit = 'C'},
tout30 = {default = 83, min=0, max=1000, unit = 'C'},
deltah30 = {default = -3058, min=0, max=100000, unit = 'kW'},
deltaT30 = {default = 5, min=0, max=1000, unit = 'K'}, 
st_h30 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
 
 -- Burner 1
 -- Off gas methanol synthesis
-- Gas heating
tin31 = {default = 68, min=0, max=1000, unit = 'C'},
tout31 = {default = 389, min=0, max=1000, unit = 'C'},
deltah31 = {default = 666, min=0, max=100000, unit = 'kW'},
deltaT31 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h31 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
 -- Air preheating
tin32 = {default = 25, min=0, max=1000, unit = 'C'},
tout32 = {default = 400, min=0, max=1000, unit = 'C'},
deltah32 = {default = 2071, min=0, max=100000, unit = 'kW'},
deltaT32 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h32 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Radiation part
tin33 = {default = 1000, min=0, max=1000, unit = 'C'},
tout33 = {default = 1000, min=0, max=1000, unit = 'C'},
deltah33 = {default = -12424, min=0, max=100000, unit = 'kW'},
deltaT33 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h33 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Convection part
tin34 = {default = 1000, min=0, max=1000, unit = 'C'},
tout34 = {default = 90, min=0, max=1000, unit = 'C'},
deltah34 = {default = -7092, min=0, max=100000, unit = 'kW'},
deltaT34 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h34 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

-- Burner 2
 -- Off gas methanol distillation (upgrade)
-- Gas heating
tin35 = {default = 35, min=0, max=1000, unit = 'C'},
tout35 = {default = 158, min=0, max=1000, unit = 'C'},
deltah35 = {default = 8, min=0, max=100000, unit = 'kW'},
deltaT35 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h35 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
 -- Air preheating
tin36 = {default = 25, min=0, max=1000, unit = 'C'},
tout36 = {default = 400, min=0, max=1000, unit = 'C'},
deltah36 = {default = 69, min=0, max=100000, unit = 'kW'},
deltaT36 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h36 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Radiation part
tin37 = {default = 1000, min=0, max=1000, unit = 'C'},
tout37 = {default = 1000, min=0, max=1000, unit = 'C'},
deltah37 = {default = -358, min=0, max=100000, unit = 'kW'},
deltaT37 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h37 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Convection part
tin38 = {default = 1000, min=0, max=1000, unit = 'C'},
tout38 = {default = 90, min=0, max=1000, unit = 'C'},
deltah38 = {default = -251, min=0, max=100000, unit = 'kW'},
deltaT38 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h38 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

-- Burner 3
 -- Off gas methanol distillation (upgrade)
-- Gas heating
tin39 = {default = 105, min=0, max=1000, unit = 'C'},
tout39 = {default = 178, min=0, max=1000, unit = 'C'},
deltah39 = {default = 16, min=0, max=100000, unit = 'kW'},
deltaT39 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h39 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
 -- Air preheating
tin40 = {default = 25, min=0, max=1000, unit = 'C'},
tout40 = {default = 400, min=0, max=1000, unit = 'C'},
deltah40 = {default = 223, min=0, max=100000, unit = 'kW'},
deltaT40 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h40 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Radiation part
tin41 = {default = 1000, min=0, max=1000, unit = 'C'},
tout41 = {default = 1000, min=0, max=1000, unit = 'C'},
deltah41 = {default = -1190, min=0, max=100000, unit = 'kW'},
deltaT41 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h41 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Convection part
tin42 = {default = 1000, min=0, max=1000, unit = 'C'},
tout42 = {default = 90, min=0, max=1000, unit = 'C'},
deltah42 = {default = -839, min=0, max=100000, unit = 'kW'},
deltaT42 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h42 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 

-- Raw Syngas Burner
 -- Air preheating
tin43 = {default = 25, min=0, max=1000, unit = 'C'},
tout43 = {default = 400, min=0, max=1000, unit = 'C'},
deltah43 = {default = 102, min=0, max=100000, unit = 'kW'},
deltaT43 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h43 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Radiation part
tin44 = {default = 1000, min=0, max=1000, unit = 'C'},
tout44 = {default = 1000, min=0, max=1000, unit = 'C'},
deltah44 = {default = -518, min=0, max=100000, unit = 'kW'},
deltaT44 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h44 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
-- Convection part
tin45 = {default = 1000, min=0, max=1000, unit = 'C'},
tout45 = {default = 90, min=0, max=1000, unit = 'C'},
deltah45 = {default = -402, min=0, max=100000, unit = 'kW'},
deltaT45 = {default = 25, min=0, max=1000, unit = 'K'}, 
st_h45 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 



}

lib.outputs = { 
CAPEX_h = {unit = 'USD/h', job = "(CAPEX*CEPCI_new/CEPCI_ref)*(i*(i+1)^lifetime)/(((i+1)^lifetime)-1)/year_hours" }, 
CAPEX_synthesis_h = {unit = 'USD/h', job = "(CAPEX_synthesis*CEPCI_new/CEPCI_ref)*(i*(i+1)^lifetime)/(((i+1)^lifetime)-1)/year_hours" }, 
}

lib:addLayers {electricity = {type ='MassBalance', unit ='kW'}}
lib:addLayers {bagasse_50 = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {syngas_cfb_o2 = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {freshwater = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {wastewater = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {methanol = {type ='MassBalance', unit ='kg/h'}}

-- units
lib:addUnit("cfb_o2_meoh", {type = 'Utility'})
lib["cfb_o2_meoh"].Fmax = 10000
--lib["cfb_o2_meoh"].Fmin = 0.01
lib["cfb_o2_meoh"].Cinv2 = 'CAPEX_h' -- USD 
lib["cfb_o2_meoh"]:addStreams({
    stream1 = {'tin1', 0, 'tout1', 'deltah1' , 'deltaT1', 'st_h1'},
    stream2 = {'tin2', 0, 'tout2', 'deltah2' , 'deltaT2', 'st_h2'},
    stream3 = {'tin3', 0, 'tout3', 'deltah3' , 'deltaT3', 'st_h3'},
    stream4 = {'tin4', 0, 'tout4', 'deltah4' , 'deltaT4', 'st_h4'},
    
    bagasse = ms{'bagasse_50' , 'in', 37092},
    elec_in = ms{'electricity', 'in', 952  + 1285}, --952 kW pumping power ; --1285kW ASU power (O2 production) Ref. 1080 KJ/kg O2; 
    vapour_gasifier_in  = ms{'freshwater', 'in', 7128 } , -- vapour to gasifier 
    rawsyngas_out = ms{'syngas_cfb_o2' , 'out', 33225},  
    })
    
lib:addUnit("meoh_synthesis", {type = 'Utility'})
lib["meoh_synthesis"].Fmax = 10000
--lib["cfb_o2_meoh"].Fmin = 0.01
lib["meoh_synthesis"].Cinv2 = 'CAPEX_synthesis_h' -- USD 
lib["meoh_synthesis"]:addStreams({
    stream5 = {'tin5', 0, 'tout5', 'deltah5' , 'deltaT5', 'st_h5'},
    stream6 = {'tin6', 0, 'tout6', 'deltah6' , 'deltaT6', 'st_h6'},
    stream7 = {'tin7', 0, 'tout7', 'deltah7' , 'deltaT7', 'st_h7'},
    stream8 = {'tin8', 0, 'tout8', 'deltah8' , 'deltaT8', 'st_h8'},
    stream9 = {'tin9', 0, 'tout9', 'deltah9' , 'deltaT9', 'st_h9'},
    stream10 = {'tin10', 0, 'tout10', 'deltah10' , 'deltaT10', 'st_h10'},
    stream11 = {'tin11', 0, 'tout11', 'deltah11' , 'deltaT11', 'st_h11'},
    stream12 = {'tin12', 0, 'tout12', 'deltah12' , 'deltaT12', 'st_h12'},
    stream13 = {'tin13', 0, 'tout13', 'deltah13' , 'deltaT13', 'st_h13'},
    stream14 = {'tin14', 0, 'tout14', 'deltah14' , 'deltaT14', 'st_h14'},
    stream15 = {'tin15', 0, 'tout15', 'deltah15' , 'deltaT15', 'st_h15'},
    stream16 = {'tin16', 0, 'tout16', 'deltah16' , 'deltaT16', 'st_h16'},
    stream17 = {'tin17', 0, 'tout17', 'deltah17' , 'deltaT17', 'st_h17'},
    stream18 = {'tin18', 0, 'tout18', 'deltah18' , 'deltaT18', 'st_h18'},
    stream19 = {'tin19', 0, 'tout19', 'deltah19' , 'deltaT19', 'st_h19'},
    stream20 = {'tin20', 0, 'tout20', 'deltah20' , 'deltaT20', 'st_h20'},
    stream21 = {'tin21', 0, 'tout21', 'deltah21' , 'deltaT21', 'st_h21'},
    stream22 = {'tin22', 0, 'tout22', 'deltah22' , 'deltaT22', 'st_h22'},
    stream23 = {'tin23', 0, 'tout23', 'deltah23' , 'deltaT23', 'st_h23'},
    stream24 = {'tin24', 0, 'tout24', 'deltah24' , 'deltaT24', 'st_h24'},
    stream25 = {'tin25', 0, 'tout25', 'deltah25' , 'deltaT25', 'st_h25'},
    stream26 = {'tin26', 0, 'tout26', 'deltah26' , 'deltaT26', 'st_h26'},
    stream27 = {'tin27', 0, 'tout27', 'deltah27' , 'deltaT27', 'st_h27'},
    stream28 = {'tin28', 0, 'tout28', 'deltah28' , 'deltaT28', 'st_h28'},
    stream29 = {'tin29', 0, 'tout29', 'deltah29' , 'deltaT29', 'st_h29'},
    stream30 = {'tin30', 0, 'tout30', 'deltah30' , 'deltaT30', 'st_h30'},
    stream31 = {'tin31', 0, 'tout31', 'deltah31' , 'deltaT31', 'st_h31'},
    stream32 = {'tin32', 0, 'tout32', 'deltah32' , 'deltaT32', 'st_h32'},
    stream33 = {'tin33', 0, 'tout33', 'deltah33' , 'deltaT33', 'st_h33'},
    stream34 = {'tin34', 0, 'tout34', 'deltah34' , 'deltaT34', 'st_h34'},
    stream35 = {'tin35', 0, 'tout35', 'deltah35' , 'deltaT35', 'st_h35'},
    stream36 = {'tin36', 0, 'tout36', 'deltah36' , 'deltaT36', 'st_h36'},
    stream37 = {'tin37', 0, 'tout37', 'deltah37' , 'deltaT37', 'st_h37'},
    stream38 = {'tin38', 0, 'tout38', 'deltah38' , 'deltaT38', 'st_h38'},
    stream39 = {'tin39', 0, 'tout39', 'deltah39' , 'deltaT39', 'st_h39'},
    stream40 = {'tin40', 0, 'tout40', 'deltah40' , 'deltaT40', 'st_h40'},
    stream41 = {'tin41', 0, 'tout41', 'deltah41' , 'deltaT41', 'st_h41'},
    stream42 = {'tin42', 0, 'tout42', 'deltah42' , 'deltaT42', 'st_h42'}, 
    
    
    
    
    raw_syngas_synthesis = ms{'syngas_cfb_o2' , 'in', 32868},
    vapour_reforming_in  = ms{'freshwater', 'in', 17255} , -- vapour_hotcleaning
    elec_in = ms{'electricity', 'in', 1987 + 3894 - 773  }, -- 1987kW compression of syngas; 3894 kW CO2 removal; 773kW expansion off gases before burning 
    meoh_out = ms{'methanol' , 'out', 9901},  
    wastewater_out = ms{'wastewater' , 'out', 21801 + 807},  --21800kg/h cold cleaning ww; 807 kg/h distallation ww
    
        })

-- units
lib:addUnit("syngas_burner", {type = 'Utility'})
lib["syngas_burner"].Fmax = 1000
--lib["cfb_o2_meoh"].Fmin = 0.01
lib["syngas_burner"].Cinv2 = 0 -- USD 
  lib["syngas_burner"]:addStreams({
  
  stream43 = {'tin43', 0, 'tout43', 'deltah43' , 'deltaT43', 'st_h43'},
  stream44 = {'tin44', 0, 'tout44', 'deltah44' , 'deltaT44', 'st_h44'},
  stream45 = {'tin45', 0, 'tout45', 'deltah45' , 'deltaT45', 'st_h45'},
  
  raw_syngas_burner = ms{'syngas_cfb_o2' , 'in', 300},
    })

  
return lib

