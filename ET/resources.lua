#!/usr/bin/lua
--[[------------------------------------------------------

  # Resources

 --]]------------------------------------------------------

local osmose = require 'osmose'
local lib = osmose.Model 'resources'

-- ## Inlet Parameters  (isVIT = 1)
lib.inputs = { }

-- ## Result (isVIT = 2)
lib.outputs = {  }

lib:addLayers {wood = {type ='MassBalance', unit ='kW'}}
lib:addLayers {electricity = {type ='MassBalance', unit ='kW'}}
lib:addLayers {meoh = {type ='MassBalance', unit ='kW'}}

lib:addUnit("resources_wood", {type = 'Utility'})
lib["resources_wood"]:addStreams{wood_out = ms({'wood', 'out', 1000}) } --%kW
lib["resources_wood"].Cost2 = 0.036  --%usd/kWh

lib:addUnit("product_wood", {type = 'Utility'})
lib["product_wood"]:addStreams{wood_in = ms({'wood', 'in', 1000}) } --%kW
lib["product_wood"].Cost2 = 0.03  --%usd/kWh

lib:addUnit("resources_electricity", {type = 'Utility'})
lib["resources_electricity"]:addStreams{electricity_out = ms({'electricity', 'out', 1000}) } --%kW
lib["resources_electricity"].Cost2 = 0.19  --%usd/kWh

lib:addUnit("product_electricity", {type = 'Utility'})
lib["product_electricity"]:addStreams{electricity_in = ms({'electricity', 'in', 1000}) } --%kW
lib["product_electricity"].Cost2 = 0.16  --%usd/kWh

lib:addUnit("resources_meoh", {type = 'Utility'})
lib["resources_meoh"]:addStreams{meoh_out = ms({'meoh', 'out', 1000}) } --%kW
lib["resources_meoh"].Cost2 = 0.095  --%usd/kWh

lib:addUnit("product_meoh", {type = 'Utility'})
lib["product_meoh"]:addStreams{meoh_in = ms({'meoh', 'in', 1000}) } --%kW
lib["product_meoh"].Cost2 = 0.09  --%usd/kWh

return lib