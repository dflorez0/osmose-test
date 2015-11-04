#!/usr/bin/lua
--[[------------------------------------------------------

  # MeOH from biomass gasification

--]]------------------------------------------------------

local osmose = require 'osmose'
local lib = osmose.Model 'ET.meoh'

--local cost_boiler = function(model)
--  local cost = 0
--  if model.equipmentcost then
--    local cost_defaults = require 'equipmentcost.cost_defaults'
--    local cost = cost_defaults(model.equipmentcost)
--    local cost_total = require 'lib.equipmentcost.cost_CoalBoiler'(cost, 100, 20, 0)
--    return cost.GR
--  else
--    return cost
--  end
  
--end

lib.values={
  air_cp=1.007,--;% kJ/kg/C 
  water_cp=4.18,--;% kJ/kg/C 
  ice_cp=2.09,--;% kj/kg/C 
 water_molarmass=18,--; % g/mol 
  air_molarmass=29,--;% g/mol
}

lib.inputs = {  
  wood_in = {default = 20000, min = 100, max = 10000, unit = 'kW'},
  inv_usd = {default = 27000000, min = 100, max = 100000000, unit = 'usd'},
  meoh_out = {default = 11220, min = 100, max = 100000, unit = 'kW'},
  ms_index = {default = 1390, min = 10, max = 10000, unit = '-'},
  elec_cons = {default = 960, min = 100, max = 10000, unit = 'kW'},
  sf_5_400 = {default = 0.7, min = 0, max = 1, unit = '-'},
}

-- units
lib:addUnits({
            meohUnit = {type = 'Process',  Fmax= 1, Cost2=1 },
            Boiler = {type = 'Utility', Fmax=1000, Cost2=0, Cinv1 = 0, Cinv2 = 0 },
            Cooling = {type = 'Utility', Fmax=1000, Cost2=0}
						
})

-- streams 
lib["meohUnit"]: addStreams ({
                             cold_stream = qt{400,0,800,15000,5} ,
                             hot_stream = qt{300,2000,100,0,5}
})

--lib["Boiler"].Cost2 = 10
lib["Boiler"]: addStreams({ 
                           heatingStream = {1000, 100, 999, 0, 25}})
						   
lib["Cooling"]: addStreams({
                           coolingStream = {10,0,35,100,5}})

return lib

