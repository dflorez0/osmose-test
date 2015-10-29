#!/usr/bin/lua
--[[------------------------------------------------------

  # Derived from generic_utilities

-- example for how to define parameters/variables/equations for GLPK in Osmose

--]]------------------------------------------------------

local osmose = require 'osmose'
local lib = osmose.Model 'generic_utilities'

-- ## Inlet Parameters  (isVIT = 1)
lib.inputs = { }

-- ## Result (isVIT = 2)
lib.outputs = {  }

-- for further explanations see the comments in osmose.Model
lib:addEquations{
  Distance_Constraint = { statement = "subject to Distance_Constraint{t in Time}: \n\t Total_Distance[t] = sum {u in Units} Units_Distance[u,t];", param = {}, addToProblem=1, type ='ampl'} 
}

lib:addVariables {
  Total_Distance = {indexedOver = {'Time'}, constraints = '>= 0'}, 
}

lib:addParameters {
  Units_Distance = {indexedOver = {'Unit', 'Time'}, type = 'integer', defaultValue = 1, constraints = '>= 0, < 10000'}, 
}

lib:addParameterData {
  Units_Distance = {value = 2, indexedOver = {'Units','Time'}, unitName = 'Boiler'},
}

lib:addUnit("Boiler", {type = 'Utility'})
lib["Boiler"].Cost2 = 10
lib["Boiler"]:addStreams({
  boilingSteam = {120, 100, 119, 0,5}
  })

lib:addUnit("Cooling", {type = 'Utility'})
lib["Cooling"]:addStreams({
  coolingSteam = {3,0,30,100,3}
  })

return lib