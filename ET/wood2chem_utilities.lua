#!/usr/bin/lua
--[[------------------------------------------------------

  # Cooking Mixing

  The model class stores the elements of the energy technology
  such as  *utility*, *stream* and *operational costs*.
  
  
  TODO: 
        

--]]------------------------------------------------------

local osmose = require 'osmose'
local lib = osmose.Model 'wood2chem_utilities'

-- ## Inlet Parameters  (isVIT = 1)
lib.inputs = { }

-- ## Result (isVIT = 2)
lib.outputs = {  }



lib:addUnit("Boiler", {type = 'Utility'})
lib["Boiler"].Cost2 = 10
lib["Boiler"]:addStreams({
  boilingSteam = {1000+273, 100, 1000+273, 0,5}
  })

lib:addUnit("Cooling", {type = 'Utility'})
lib["Cooling"].Cost2 = 0
lib["Cooling"]:addStreams({
  coolingSteam = {25+273,0,26+274,100,5}
  })

return lib