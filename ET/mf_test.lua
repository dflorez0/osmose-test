#!/usr/bin/lua
--[[------------------------------------------------------

  # Cooking Mixing

  The model class stores the elements of the energy technology
  such as  *utility*, *stream* and *operational costs*.
  
  
  TODO: 
        

--]]------------------------------------------------------

local osmose = require 'osmose'
local lib = osmose.Model 'mf_test'

lib:addLayers {wood = {type ='MassBalance', unit ='kW'}}
lib:addLayers {elec = {type ='MassBalance', unit ='kW'}}


lib:addUnit("mf_prc", {type = 'Process'})
lib["mf_prc"].Cost2 = 1
lib["mf_prc"]:addStreams({
   stream1 = qt{400,0,550,200,5},
   stream2 = qt{350,0,500,300,5},
   stream3 = qt{450,500,350,0,5},
  w1 = ms({'wood', 'in', 1000}), 
  w2 = ms({'elec', 'in', 1500})
})




lib:addUnit("mf_ut", {type = 'Utility'})
lib["mf_ut"].Cost2 = 1
lib["mf_ut"].Fmin = 0
lib["mf_ut"].Fmax = 10000
lib["mf_ut"]:addStreams({
  w2 = ms({'wood', 'out', 1})
})

lib:addUnit("mf_el", {type = 'Utility'})
lib["mf_el"].Cost2 = 1
lib["mf_el"].Fmin = 0
lib["mf_el"].Fmax = 10000
lib["mf_el"]:addStreams({
  w3 = ms({'elec', 'out', 1})
})




--lib["mf_prc"].addToProblem = 1
--lib["mf_ut"].addToProblem = 1
--

return lib
