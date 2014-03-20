#!/usr/bin/lua
--[[------------------------------------------------------

  # MeOH from biomass gasification

--]]------------------------------------------------------

local osmose = require 'osmose'
local lib = osmose.Model 'ET.meoh'

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

-- ## Result (isVIT = 2)
lib.outputs = { -- doc
--meoh_out = {unit = 'kW', job = "meoh_out" },
  --  meoh_out = {unit = 'kW', job = "meoh_out" },
--elec_cons = {unit='kW', job="elec_cons"},
    -- To test addToProblem with a tag:
--  j1 = {job = '3-2'}
  }

lib:addLayers {electricity = {type ='MassBalance', unit ='kW'}}
lib:addLayers {wood = {type ='MassBalance', unit ='kW'}}
lib:addLayers {meoh = {type ='MassBalance', unit ='kW'}}


-- ## Advanced (isVIT = 3)
--meoh.advanced = {
 --   max_temp = {default = 20, min = 0, max = 100, unit = 'C'},
  --  water_h = {default = 1.136, min = 1, max = 2, unit = 'kW/m2 C'},
  --  source_temp = {default = 10, min = 0, max = 100, unit = 'C'},
  --  cleaning_agent_rate = {default = 5, min = 0, max = 100, unit = '%m/m'},
  --}
  
-- units
lib:addUnit({
            meohUnit = {type = 'Process',  Fmax= 1, Cost2=1 },
            Boiler = {type = 'Utility', Fmax=10000, Cost2=10},
			Cooling = {type = 'Utility', Fmax=10000, Cost2=1}
						
})

-- streams 
lib["meohUnit"]: addStreams ({
                             cold_stream = qt{400-273,0,800-273,1500,5} ,
                             hot_stream = qt{600-273,2000,300-273,0,5} 
--elec_balance1 = ms{'electricity', 'in', 'elec_cons'} ,
--elec_balance2 = ms{'electricity', 'out', '800'} ,
--wood_resource = ms{'wood', 'in', 'wood_in'}, 
--meoh_prod = ms{'meoh', 'out', 'meoh_out'} 
})

--lib["Boiler"].Cost2 = 10
lib["Boiler"]: addStreams({ 
                           heatingStream = {1200, 100, 1199, 0, 25}})
						   
lib["Cooling"]: addStreams({
                           coolingStream = {273,0,274,100,5}})

 --optional :
lib["meohUnit"].addToProblem = 1
lib["Boiler"].addToProblem = 1
lib["Cooling"].addToProblem = 1

return lib

