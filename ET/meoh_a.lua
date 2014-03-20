#!/usr/bin/lua
--[[------------------------------------------------------

  # meoh_a

--]]------------------------------------------------------

local osmose = require 'osmose'
local lib = osmose.Model 'meoh_a'

lib.values={
  air_cp=1.007,--;% kJ/kg/C 
  water_cp=4.18,--;% kJ/kg/C 
  water_h = 0.5,--%kW/m2 K
  ice_cp=2.09,--;% kj/kg/C 
  water_molarmass=18,--; % g/mol 
  air_molarmass=29,--;% g/mol
}

lib.inputs = { -- doc
  
  wood_in = {default = 20000, min = 10, max = 100000, unit = 'kW'},
  meoh_out = {default = 11220, min = 10, max = 100000, unit = 'kW'},
  inv_usd = {default = 27000000, min = 10, max = 100000000, unit = 'usd'},
  elec_cons = {default = 960, min = 10, max = 10000, unit = 'kW'},
  
  ms_index = {default = 1390, min = 10, max = 10000, unit = '-'},
    sf_5_400 = {default = 0.7, min = 0, max = 10, unit = '-'},
 }
 
lib.outputs = {  }


lib:addLayers {wood = {type ='MassBalance', unit ='kW'}}
lib:addLayers {meoh = {type ='MassBalance', unit ='kW'}}
lib:addLayers {electricity = {type ='MassBalance', unit='kW'}}



lib:addUnit("meoh_aUnit", {type = 'Process', addToProblem= 1})

lib["meoh_aUnit"]:addStreams{ hs1 = qt { 600+273, 1000, 500+273, 0, 5 , 'water_h'} }
lib["meoh_aUnit"]:addStreams{ cs1 = qt { 45+273, 0, 500+273, 1000, 5,'water_h'} }  

lib["meoh_aUnit"]:addStreams{ ee1 = ms({'electricity', 'in', 'elec_cons'}) }
--lib["meoh_aUnit"]:addStreams{ ee2 = ms({'electricity', 'out', 'elec_cons'}) }

lib["meoh_aUnit"]:addStreams{w1 = ms({'wood', 'in', 'wood_in'}) }
--lib["meoh_aUnit"]:addStreams{w2 = ms({'wood', 'out', 'wood_in'}) }

--lib["meoh_aUnit"]:addStreams{meoh2 = ms({'meoh', 'out', 'meoh_out'}) }
lib["meoh_aUnit"]:addStreams{meoh1 = ms({'meoh', 'out', 'meoh_out'}) }



-- optional :
lib["meoh_aUnit"].addToProblem = 1

return lib

