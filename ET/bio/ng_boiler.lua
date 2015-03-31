#!/usr/bin/lua
--[[------------------------------------------------------

  # ng boiler

--]]------------------------------------------------------


local osmose = require 'osmose'
local lib = osmose.Model 'ng_boiler'

lib.values={
  air_cp=1.007,--;% kJ/kg/C 
  water_cp=4.18,--;% kJ/kg/C 
  ice_cp=2.09,--;% kj/kg/C 
  water_molarmass=18,--; % g/mol 
  air_molarmass=29,--;% g/mol
}


lib.inputs = {
ng_mass_ref = {default = 3600, min=0, max=1000, unit = 'kg/h'},
hhv_ng =  {default = 54000, min=0, max=1000, unit = 'kJ/kg'},   

 
tin1 = {default = 870, min=0, max=1000, unit = 'C'},
tin2 = {default = 870, min=0, max=1000, unit = 'C'},
tin3 = {default = 25, min=0, max=1000, unit = 'C'},

tout1 = {default = 870, min=0, max=1000, unit = 'C'},
tout2 = {default = 162, min=0, max=1000, unit = 'C'},
tout3 = {default = 350, min=0, max=1000, unit = 'C'},

 deltah1 = {default = -4410.5, min=-10000, max=1000, unit = 'kW'},
 deltah2 = {default = -6864, min=-10000, max=1000, unit = 'kW'},
 deltah3 = {default = 1826.8, min=0, max=10000, unit = 'kW'},
 
 deltaT1 = {default = 25, min=0, max=1000, unit = 'K'},  
 deltaT2 = {default = 25, min=0, max=1000, unit = 'K'},  
 deltaT3 = {default = 25, min=0, max=1000, unit = 'K'},  
 
  st_h1 = {default = 0.03, min=0, max=1000, unit = 'kW/m2 K'}, 
  st_h2 = {default = 0.03, min=0, max=1000, unit = 'kW/m2 K'},  
  st_h3 = {default = 0.03, min=0, max=1000, unit = 'kW/m2 K'},  
   
}

lib.outputs = { ng_ref = {unit = 'kW', job = "(ng_mass_ref/3600)*hhv_ng"},
   } 



lib:addLayers {naturalgas = {type ='MassBalance', unit ='kW'}}


-- units
lib:addUnit("ng_boiler", {type = 'Utility'})
lib["ng_boiler"].Fmax = 1000
lib["ng_boiler"].Fmin = 0
lib["ng_boiler"].Cost2 = 0.01
lib["ng_boiler"]:addStreams({
    stream1 = {'tin1', 0, 'tout1', 'deltah1' , 'deltaT1', 'st_h1'},
    stream2 = {'tin2', 0, 'tout2', 'deltah2' , 'deltaT2', 'st_h2'},
    stream3 = {'tin3', 0, 'tout3', 'deltah3' , 'deltaT3', 'st_h3'},
    
    
    ng_in = ms{'naturalgas' , 'in', 'ng_ref'}  })



  
return lib

