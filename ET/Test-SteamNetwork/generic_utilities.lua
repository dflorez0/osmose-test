#!/usr/bin/lua
--[[------------------------------------------------------

  # Cooking Mixing

  The model class stores the elements of the energy technology
  such as  *utility*, *stream* and *operational costs*.
  
  
  TODO: 
        

--]]------------------------------------------------------

local osmose = require 'osmose'
local lib = osmose.Model 'generic_utilities'

-- ## Inlet Parameters  (isVIT = 1)
lib.inputs = { }

-- ## Result (isVIT = 2)
lib.outputs = {  }



lib:addUnit("Boiler", {type = 'Utility', Fmax = 10000})
lib["Boiler"]:addStreams({
  boilingSteam = {1000-273, 1000, 999.9-273, 0,2},
  boilingSteam2 = {190, 0, 190, 100,2},
  boilingSteam3 = {110, 0, 110, 100,2},
  })

lib:addUnit("Cooling", {type = 'Utility'})
lib["Cooling"].Cost2 = 1000
lib["Cooling"]:addStreams({
  coolingSteam = {-10,0,-9.9,1000,2}
  })

lib:addLayers{Electricity = {type ='MassBalance', unit ='kW'}}
lib["Boiler"]:addStreams{				
				Elec_demand = ms({'Electricity', 'in', 100})}


lib:addUnit('Grid' , {type = 'Utility', Fmin = 0, Fmax= 10000, Cost2= -16.9*1e-6})
lib['Grid']:addStreams{["ms_Grid_elec"] = ms({'Electricity', 'out', 1})}

return lib