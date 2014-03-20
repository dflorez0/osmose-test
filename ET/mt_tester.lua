#!/usr/bin/lua
--[[------------------------------------------------------

  # Cooking Mixing

  The model class stores the elements of the energy technology
  such as  *utility*, *stream* and *operational costs*.
  
  
  TODO: 
        

--]]------------------------------------------------------

local osmose = require 'osmose'
local lib = osmose.Model 'mt_tester'

-- ## Inlet Parameters  (isVIT = 1)
lib.inputs = { 
   stream1_load = {default = 200, min=1000, max=1000, unit = 'kW'},
   stream2_load = {default = 300, min=1000, max=1000, unit = 'kW'},
   stream3_load = {default = 500, min=1000, max=1000, unit = 'kW'},
   t_d = {default = 500, min=1000, max=1000, unit = 'h'},
  
  }

-- ## Result (isVIT = 2)
lib.outputs = {  }


lib:addUnit("mt_test", {type = 'Process'})

lib["mt_test"]:addStreams({
   stream1 = {400,0,550,'stream1_load',5},
   stream2 = {350,0,500,'stream2_load',5},
   stream2 = {450,'stream3_load',350,0,5},
})

return lib
