#!/usr/bin/lua

--- Building model for AMI
-- ET model based on previous work of Leandro Salgueiro
-- @author Nils Schueler 
-- @release 06.11.2014
 
local data = ...                             -- instantiate the building with the provided data
local osmose = require 'osmose'
local building = osmose.Model('building_ET') 

--[[
Constants used in the ET. If this section is considered redundant, these values could simply be declared as parameters in the building.inputs section below.
--]]
building.values={
}

-- PARAMETERS (CST tags) related to the ET. Equivalent to osmose Matlab tags isVit = 1. 
building.inputs = { -- doc 
  supplyTemp = {default = data.supply_temp_heat, min = data.supply_temp_heat, max = data.supply_temp_heat, unit = 'C'},    -- data can be parsed to tags
  returnTemp = {default = data.return_temp_heat, min = data.return_temp_heat, max = data.return_temp_heat, unit = 'C'},    -- data can be parsed to tags
  load = {default = data.design_demand, min = data.design_demand, max = data.design_demand, unit = 'C'},    -- data can be parsed to tags
}

--[[
RESULTS (OFF tags) related to the ET. Equivalent to osmose Matlab tags isVit = 2.
To add a calculation use the declaration with "job" as below. To use the result of this calculation remember to add ().
--]]
building.outputs = { -- doc 
}

--[[
ADVANCED PARAMETERS (CST tags) related to the ET. Equivalent to osmose Matlab tags isVit = 3.
--]]
building.advanced = { -- doc 

	-- ####  ENERGY INTEGRATION DATA

	-- Delta T min for space and air heating  -- dtmin_2_space
	DT_min_rh = {default = 2, min = 0, max = 1, unit = 'K'}, 

	--Water
	WaterH = {default = 3, min = 0, max = 1, unit = 'K'},
	
   }

-- #################################### LOCATIONS ####################################
--building:addLocation -- ToDo

-- #################################### LAYERS ####################################
-- LAYERS declaration for balancing (mass, electricity,...)

-- building:addLayers {electricity = {type ='MassBalance', unit ='kW'}}
--building:addLayers {waste_water = {type ='MassBalance', unit ='m3/s'}}

-- #################################### UNITS ####################################

-- ########################## PROCESSES ##########################
building:addUnit("Heating", {type = 'Process'})

-- buildingAttributes = {'design demand','supply_temp_heat','return_temp_heat','dhw_average_demand [kW]'}

-- StreamNAME = qt {TIN, HIN, TOUT, HOUT, DtMin, heat transfer coefficient}
-- StreamNAME = ms ({LayerName, in/out, value})
building["Heating"]:addStreams {
RoomHeating = qt {'returnTemp', 0, 'supplyTemp', 'load', 'DT_min_rh', 'WaterH'},  -- data can be directly parsed to e.g. stream definition
}


-- ########################## UTILITIES ##########################
-- part: processes and utilities
building:addUnit("Boiler", {type = 'Utility', Fmax = 100000, Cost2 = 0.0033})
-- cost2: 100 kW * 0.1 CHF/kWh / .85 / 3600
building["Boiler"]:addStreams {
  Qout = qt {190, 100, 170, 0, 2} -- Reference size 100 kW
}

building:addUnit("Cooling", {type = 'Utility'})
building["Cooling"].Cost2 = 10
building["Cooling"]:addStreams({
  coolingSteam = {10,0,20,1,5,5}
  })
return building