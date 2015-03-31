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
lib.inputs = { 
 cooling_water_price = {default = 0.04, min=0, max=100000, unit = 'USD/m3'}, 
 elec_price_EU = {default = 0.16, min=0, max=100000, unit = 'USD/kWh'}, 
 
 elec_req_coolingwater = {default = 33, min=0, max=100000, unit = 'kWh/t'}, 
  
 COP_cooling2 = {default = 2.25, min=0, max=100000, unit = ''}, 
 COP_cooling3 = {default = 3.36, min=0, max=100000, unit = ''}, 
 COP_cooling4 = {default = 6.94, min=0, max=100000, unit = ''}, 
 
 cooling2_ref= {default = 100, min=0, max=100000, unit = 'kW'}, 
 cooling3_ref= {default = 100, min=0, max=100000, unit = 'kW'}, 
 cooling4_ref = {default = 100, min=0, max=100000, unit = 'kW'}, 
 
 
 }

-- ## Result (isVIT = 2)
lib.outputs = { 
  elec_unit_price1 = {unit = '$/h', job = "(cooling_water_price*0.24*3600) " }, 
  elec_unit_price2 = {unit = '$/h', job = "(elec_price_EU)*(cooling2_ref/COP_cooling2) " }, 
  elec_unit_price3 = {unit = '$/h', job = "(elec_price_EU)*(cooling3_ref/COP_cooling3) " }, 
  elec_unit_price4 = {unit = '$/h', job = "(elec_price_EU)*(cooling4_ref/COP_cooling4) " }, 
  
  elec_req_coolingwater2 = {unit = 'kW', job = "(cooling2_ref/COP_cooling2) " }, 
  elec_req_coolingwater3 = {unit = 'kW', job = "(cooling3_ref/COP_cooling3) " }, 
  elec_req_coolingwater4 = {unit = 'kW', job = "(cooling4_ref/COP_cooling4) " }, 
  }


lib:addLayers {electricity = {type ='MassBalance', unit ='kW'}}



lib:addUnit("Boiler", {type = 'Utility'})
lib["Boiler"].Fmax = 10000
lib["Boiler"].Fmin = 0.01
lib["Boiler"].Cost2 = 100
lib["Boiler"]:addStreams({boilingSteam = {1801, 1000, 1800, 0,5}})
lib["Boiler"].addToProblem = 0
 
 

lib:addUnit("Cooling", {type = 'Utility'})
lib["Cooling"].Fmax = 10000
lib["Cooling"].Fmin = 0.01
lib["Cooling"].Cost2 = 'elec_unit_price1'
lib["Cooling"]:addStreams({coolingSteam = {25,0,35,1003.2,5}, --100kW for cp = 4.18kJ/kgK, m =24kg/s and deltT = 10K

elec_in_cooling1 = ms{'electricity', 'in', 'elec_req_coolingwater'}

})

lib:addUnit("Cooling2", {type = 'Utility'})
lib["Cooling2"].Fmax = 10000
lib["Cooling2"].Fmin = 0
lib["Cooling2"].Cost2 = 'elec_unit_price2'
lib["Cooling2"]:addStreams({coolingSteam = {-50,0,-50,'cooling2_ref',5},
    
elec_in_cooling2 = ms{'electricity', 'in', 'elec_req_coolingwater2'}    
 
 })

lib:addUnit("Cooling3", {type = 'Utility'})
lib["Cooling3"].Fmax = 10000
lib["Cooling3"].Fmin = 0
lib["Cooling3"].Cost2 = 'elec_unit_price3'
lib["Cooling3"]:addStreams({coolingSteam = {-28,0,-28,'cooling3_ref',5},
    
elec_in_cooling3 = ms{'electricity', 'in', 'elec_req_coolingwater3'}    
 
})

lib:addUnit("Cooling4", {type = 'Utility'})
lib["Cooling4"].Fmax = 10000
lib["Cooling4"].Fmin = 0
lib["Cooling4"].Cost2 = 'elec_unit_price4'
lib["Cooling4"]:addStreams({coolingSteam = {5,0,5,'cooling4_ref',5},
    
elec_in_cooling4 = ms{'electricity', 'in', 'elec_req_coolingwater4'}    
 
})


return lib