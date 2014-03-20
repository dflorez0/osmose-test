#!/usr/bin/lua
--[[------------------------------------------------------

  # IPESE ski workshop
  # building model - ET file
  # The model is a simplified representation of a building having with processes (space heating, hot water, electricity, waste water) and utilities (gas boiler, CCGT power plant, heat pump, cold water utility).
  # 19.03.2014
  # Stefano Moret, Leandro Salgueiro 

--]]------------------------------------------------------

local osmose = require 'osmose'
local building = osmose.Model 'building_ET' 

--[[

Constants used in the ET. If this section is considered redundant, these values could simply be declared as parameters in the building.inputs section below.

--]]

building.values={
	CpAir=1.005, 			--[kJ/kg/K]
	CpAirVol=1.2, 				--[kJ/m3/K] 
	CpWaterVol=4.18*1000, 		--[kJ/m3/K] 
	CpWater=4.18, 			--[kJ/kg/K] 
	WaterDensity=1, 				--[kg/L]
	pi=3.1415,    				--             
	abs_pressure=1.01325*10^5, 	--[N/m^2]
	r_specific=287.058,      
}

-- PARAMETERS (CST tags) related to the ET. Equivalent to osmose Matlab tags isVit = 1. 

building.inputs = { -- doc 
   
	-- #### SIZE & CHARACTERISTIC OF BUILDING 

	-- number of flats per building --NumbFlts
	NumbFlts = {default = 466, min = 0, max = 1, unit = '-'}, --933

	-- length of building
	LengthBuilding = {default = 160 , min =0, max= 160, unit ='m'},

	-- Width of building
	WidthBuilding = {default = 100 , min =0, max= 100, unit ='m'},

	-- Mean Number of inhabitants per flat
	NumbInhab = {default = 3 , min =0, max= 10, unit ='-'},

	--Coeficcient SUtil (French standards)
	CoefSUtil = {default = 0.85 ,min =0	,max =1	,unit ='-'},

	--Coeficcient ShonRT (French standards)
	CoefShonRT = {default = 1.1 ,min =0	,max =1	,unit ='-'},

	-- Util surface of the Roof (if different from Building surface) --a_t
	RoofSurf = {default = 9760, min = 0, max = 1, unit = 'm^2'}, 

	-- Green Surface attached to this building  --a_g
	GreenSurf = {default = 6, min = 0, max = 1, unit = 'm^2/n'}, 

	-- Use of soil coefficient --r_cos
	CosR = {default = 3.142, min = 0, max = 1, unit = '-'}, 

	-- Room height  -- room_height_i
	RoomHeight = {default = 3.2, min = 0, max = 1, unit = 'm '},

	-- Number of floors of the building
	FloorNumb = {default = 10, min = 0, max = 1, unit = 'm '},

	-- #### AMBIENT CONDITIONS 

	-- External Ambient Temperature -- tamb_mean
	Tamb = {default = 13, min = 0, max = 1, unit = 'C '}, 

	-- Mean inlet  Water temperature --t_groundwater
	InletWaterTemp = {default = 10, min = 0, max = 1, unit = 'C'}, 

	-- temperature at which it is no longer necesarry to heat; MUST NOT BE GENERAL -- theattr_i 
	CutHotTemp = {default = 16, min = 0, max = 1, unit = 'C'}, 

	-- temperature at which it is necesarry to cool; MUST NOT BE GENERAL --tcooltr_i
	CutColdTemp = {default = 18, min = 0, max = 1, unit = 'C'}, 

	-- comfortable temperature inside building --tcomf_c_i 
	ConfTemp= {default = 21, min = 0, max = 1, unit = 'C '}, 


	-- #### HOT & COLD WATER 

	-- consumption of Cold water per flat -
	ConsoColdWaterflat = {default = 23.94, min = 0, max = 1, unit = 'm^3/(day*flat)'},

	-- overall consumption of water per flat 
	ConsoHotWaterflat = {default = 0.2, min = 0, max = 1, unit = 'm^3/(day*flat)'},

	-- Use hot Water temperature 
	UseWaterTemp = {default = 60, min = 0, max = 1, unit = 'C'}, 

	
	-- #### WASTE WATER 

	-- Waste Water Temperature at outlet of building -- t_wastewater_i 
	BuildingWasteWaterTemp = {default = 20, min = 0, max = 20, unit = 'C '},

	-- Waste Water Temperature at enviroment -- t_wastewater_i 
	OutletWaterTemp = {default = 10, min = 0, max = 20, unit = 'C '},

	-- #### HEATING SYSTEM 

	-- Supply temperature of the liquid for the heating system --thot_w  --thot_sys_supply_i
	SupplyHeatingTemp = {default = 25, min = 0, max = 25, unit = 'C '}, 

	-- Return temperature of the liquid for the heating system --thot_sys_return_i
	ReturnHeatingTemp = {default = 12, min = 10, max = 15, unit = 'C '},

	-- Heating Load (coming from heating signature of building)
	HeatingSysLoad = {default = 1500, min = 10, max = 150, unit = 'kW '},

	-- #### VENTILATION SYSTEM (HEATING) 

	-- Air change rate  --r_air_change_i
	AirChangeRate = {default = 2, min = 0, max = 1, unit = 'number of changes/day'}, 

	
	-- #### AIR RECOVERY 

	-- Temperature waste air in environment 
	OutletAirTemp= {default = 2, min = 0, max = 1, unit = 'C '},
}

--[[

RESULTS (OFF tags) related to the ET. Equivalent to osmose Matlab tags isVit = 2.
To add a calculation use the declaration with "job" as below. To use the result of this calculation remember to add ().

--]]

building.outputs = { -- doc 
   

	-- #### BUILDING CALCULATIONS

	-- Heating Building Surface -- buildings_surface_netto
	BuildingSurface = {job = "LengthBuilding * WidthBuilding " , unit = 'm^2'}, 

	-- surface util --a_sutil
	SurfUtil = {job = "BuildingSurface() * CoefSUtil" , unit = 'm^2'}, 

	-- ShonRT --a_shonrt_i
	SurfShonRT = {job = "SurfUtil() * CoefShonRT" , unit = 'm^2'}, 

	-- Volume room per floor
	VolumeRoom = {job = "RoomHeight * SurfUtil()" , unit = 'm^3'}, 

	-- Total Volume room 
	TotalVolumeRoom = {job = "VolumeRoom() * FloorNumb" , unit = 'm^3'}, 



	-- #### WATER CALCULATIONS

	-- Hot Water Load Calculation
	
	Total_cons_hw = {job = "ConsoHotWaterflat * NumbFlts / 3600 / 24", unit = 'm3/s'},
	
	HotWaterLoad = {job = "((ConsoHotWaterflat * NumbFlts) / 86400) * CpWaterVol * (UseWaterTemp - InletWaterTemp)" , unit = 'kW'},
	
	HotWaterLoad = {job = "((ConsoHotWaterflat * NumbFlts) / 86400) * CpWaterVol * (UseWaterTemp - InletWaterTemp)" , unit = 'kW'}, 


	-- Waste Water Load Calculation
	WasteWaterLoad = {job = " ((ConsoHotWaterflat+ConsoColdWaterflat) /86400) * CpWaterVol * (BuildingWasteWaterTemp - OutletWaterTemp) " , unit = 'kW'},

	-- #### AIR CALCULATIONS

	-- Volume of Air per day Calculation
	VolAirChange = {job = " (AirChangeRate * TotalVolumeRoom()) / 86400" , unit = 'm^3/sec'},

	-- Ventilation Air Load Calculation
	VentilAirLoad = {job = " VolAirChange() * CpAirVol * (ConfTemp - Tamb)" , unit = 'kW'}, 


	-- #### AIR RECOVERY CALCULATIONS

	-- Air recovery Load Calculation
  AirRecoveryLoad = {job = " VolAirChange() * CpAirVol * (ConfTemp - OutletAirTemp)" , unit = 'kW'},

}

--[[

ADVANCED PARAMETERS (CST tags) related to the ET. Equivalent to osmose Matlab tags isVit = 3.

--]]

building.advanced = { -- doc 

	-- ####  ENERGY INTEGRATION DATA

	-- Delta T min for space and air heating  -- dtmin_2_space
	DtminSpace = {default = 5, min = 0, max = 1, unit = 'K '}, 

	-- Delta T min for water -- dtmin_2_water
	DtminWater = {default = 2, min = 0, max = 5, unit = 'K '}, 

	-- Delta T min for Waste Water heat recovery-- dtmin_2_waste_water
	DtminWw = {default = 3, min = 0, max = 1, unit = 'K '},

	--Water
	WaterH = {default = 3, min = 0, max = 1, unit = 'K '},

	--Air
	AirH = {default = 3, min = 0, max = 1, unit = 'K '},
	
   }

-- LAYERS declaration for balancing (mass, electricity,...)

building:addLayers {electricity = {type ='MassBalance', unit ='kW'}}
building:addLayers {waste_water = {type ='MassBalance', unit ='m3/s'}}

-- UNIT declaration part: processes and utilities

building:addUnit("Building", {type = 'Process'})

-- STREAMS
-- StreamNAME = qt {TIN, HIN, TOUT, HOUT, DtMin, heat transfer coefficient}
-- StreamNAME = ms ({LayerName, in/out, value})

building["Building"]:addStreams {

  HotWater =  qt { 'InletWaterTemp', 0,'UseWaterTemp','HotWaterLoad','DtminWater', 'WaterH'},
  
Waste_water_in = ms({'waste_water', 'in', 'Total_cons_hw'}),

  WasteWater = qt { 'BuildingWasteWaterTemp','WasteWaterLoad','OutletWaterTemp', 0, 'DtminWater', 'WaterH'},
  
Waste_water_out = ms({'waste_water', 'out', 'Total_cons_hw'}),

  -- Ventilation =  { 'Tamb',0,'ConfTemp', 'VentilAirLoad', 'DtminSpace', 'AirH'}, 

  -- WasteAir =  { 'ConfTemp','AirRecoveryLoad','OutletAirTemp', 0, 'DtminSpace', 'AirH'}, 

  Heating = qt { 'ReturnHeatingTemp', 0,'SupplyHeatingTemp','HeatingSysLoad', 'DtminWater','WaterH'},
  
  -- declaration of a mass stream
  Elec_demand = ms({'electricity', 'in', 500})-- building electricity demand  
}

building:addUnit("Boiler", {type = 'Utility', Fmax = 100000, Cost2 = 0.0033})
-- cost2: 100 kW * 0.1 CHF/kWh / .85 / 3600
building["Boiler"]:addStreams {
  Q_out_boiler = qt {200, 100, 199, 0, 2} -- Reference size 100 kW
}

building:addUnit("HP", {type = 'Utility', Fmax = 100000, Cost2 = 0.0014})
-- cost2: 100 kW / 4 * 0.2 CHF/kWhe / 3600
building["HP"]:addStreams {
  Q_hp_cond = qt {40, 100, 39, 0, 2}, -- Reference size 100 kW
  
  Elec_hp_in = ms({'electricity', 'in', 25}) -- COP = 4
}

building:addUnit("CCGT", {type = 'Utility', Fmax = 100000, Cost2 = 0.0023})
-- cost2: 100 kW * 0.05 CHF/kWh / .6 / 3600
building["CCGT"]:addStreams {
  Elec_out_CCGT = ms({'electricity', 'out', 100})
}

building:addUnit("Cold_water", {type = 'Utility', Fmax = 100000, Cost2 = 0.00004778})
-- cost2: 100 kW / 4.186 kJ/kg/K / 5 K / 1000 * 0.01
building["Cold_water"]:addStreams {
  cold_w = qt {5, 0, 10, 100, 2} -- Reference size 100 kW
}

return building
