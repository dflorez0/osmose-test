#!/usr/bin/lua
--[[------------------------------------------------------

  # hydrated bioethanol (fermentation and distillation) 93%

--]]------------------------------------------------------
--require ("mobdebug").start()

local osmose = require 'osmose'
local lib = osmose.Model 'bioethanol_93'

lib.values={
  air_cp=1.007,--;% kJ/kg/C 
  water_cp=4.18,--;% kJ/kg/C 
  ice_cp=2.09,--;% kj/kg/C 
  water_molarmass=18,--; % g/mol 
  air_molarmass=29,--;% g/mol
}


lib.inputs = {
 i = {default = 0.06, min=0, max=1000, unit = '-'},
year_hours = {default = 8760, min=0, max=10000, unit = 'h/y'},
working_hours = {default = 7884, min=0, max=10000, unit = 'h/y'},
lifetime = {default = 25, min=0, max=1000, unit = 'years'}, 
CEPCI_ref = {default = 567.3, min=0, max=1000, unit = ''},
CEPCI_new = {default = 575, min=0, max=1000, unit = ''},
CAPEX = {default = 1152405, min=0, max=1000, unit = 'USD'}, 
  
  
  
  
tin1 = {default = 30, min=0, max=1000, unit = 'C'},
tin2 = {default = 112, min=0, max=1000, unit = 'C'},
tin3 = {default = 108, min=0, max=1000, unit = 'C'},
tin4 = {default = 85, min=0, max=1000, unit = 'C'},
tin5 = {default = 70, min=0, max=1000, unit = 'C'},
tin6 = {default = 108, min=0, max=1000, unit = 'C'},
tin7 = {default = 81.6, min=0, max=1000, unit = 'C'},
tin8 = {default = 112, min=0, max=1000, unit = 'C'},


tout1 = {default = 90, min=0, max=1000, unit = 'C'},
tout2 = {default = 112, min=0, max=1000, unit = 'C'},
tout3 = {default = 108, min=0, max=1000, unit = 'C'},
tout4 = {default = 70, min=0, max=1000, unit = 'C'},
tout5 = {default = 25, min=0, max=1000, unit = 'C'},
tout6 = {default = 25, min=0, max=1000, unit = 'C'},
tout7 = {default = 81.6, min=0, max=1000, unit = 'C'},
tout8 = {default = 25, min=0, max=1000, unit = 'C'},

              
 deltah1 = {default = 143, min=0, max=1000, unit = 'kW'},
 deltah2 = {default = 191, min=0, max=1000, unit = 'kW'},
 deltah3 = {default = 149, min=0, max=1000, unit = 'kW'},
 deltah4 = {default = -97, min=-1000, max=1000, unit = 'kW'},
 deltah5 = {default = -13, min=-1000, max=1000, unit = 'kW'},
 deltah6 = {default = -15, min=-1000, max=1000, unit = 'kW'},
 deltah7 = {default = -143, min=-1000, max=1000, unit = 'kW'},
 deltah8 = {default = -160, min=-1000, max=1000, unit = 'kW'},
 
        
 deltaT1 = {default = 5, min=0, max=1000, unit = 'K'},  
 deltaT2 = {default = 5, min=0, max=1000, unit = 'K'},  
 deltaT3 = {default = 5, min=0, max=1000, unit = 'K'},  
 deltaT4 = {default = 5, min=0, max=1000, unit = 'K'}, 
 deltaT5 = {default = 5, min=0, max=1000, unit = 'K'},  
 deltaT6 = {default = 5, min=0, max=1000, unit = 'K'},  
 deltaT7 = {default = 5, min=0, max=1000, unit = 'K'},  
 deltaT8 = {default = 5, min=0, max=1000, unit = 'K'},
  
 
 
  st_h1 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
  st_h2 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'},  
  st_h3 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'},  
  st_h4 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'} ,
  st_h5 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
  st_h6 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'},  
  st_h7 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'},  
  st_h8 = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'},  
   
  
}

lib.outputs = { 
CAPEX_h = {unit = 'USD/h', job = "(CAPEX*CEPCI_new/CEPCI_ref)*(i*(i+1)^lifetime)/(((i+1)^lifetime)-1)/year_hours" }, 
}

lib:addLayers {electricity = {type ='MassBalance', unit ='kW'}}
lib:addLayers {glucose_20 = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {freshwater = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {co2 = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {yeast = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {bioethanol_93 = {type ='MassBalance', unit ='kg/h'}}
--lib:addLayers {co2_dist = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {vinasse = {type ='MassBalance', unit ='kg/h'}}

-- units
lib:addUnit("bioethanol_93", {type = 'Utility'})
lib["bioethanol_93"].Fmax = 10000
--lib["bioethanol_93"].Fmin = 0.01
lib["bioethanol_93"].Cinv2 = 'CAPEX_h'  --USD
lib["bioethanol_93"]:addStreams({
    stream1 = {'tin1', 0, 'tout1', 'deltah1' , 'deltaT1', 'st_h1'},
    stream2 = {'tin2', 0, 'tout2', 'deltah2' , 'deltaT2', 'st_h2'},
    stream3 = {'tin3', 0, 'tout3', 'deltah3' , 'deltaT3', 'st_h3'},
    stream4 = {'tin4', 0, 'tout4', 'deltah4' , 'deltaT4', 'st_h4'},
    stream5 = {'tin5', 0, 'tout5', 'deltah5' , 'deltaT5', 'st_h5'},
    stream6 = {'tin6', 0, 'tout6', 'deltah6' , 'deltaT6', 'st_h6'},
    stream7 = {'tin7', 0, 'tout7', 'deltah7' , 'deltaT7', 'st_h7'},
    stream8 = {'tin8', 0, 'tout8', 'deltah8' , 'deltaT8', 'st_h8'},
    
 
 
    glucose_in = ms{'glucose_20' , 'in', 1840},  
    water_in = ms{'freshwater' , 'in', 207.8},  
    elec_in = ms{'electricity', 'in', 2.30}  ,  
    --co2_out =  ms{'co2' , 'out', 162*0.98 + 2.967*0.9},     
    --yeast_out = ms{'yeast' , 'out', 7.6},
    bioethanol_93_out = ms{'bioethanol_93' , 'out', 182},
    --vinasse_out = ms{'vinasse' , 'out', 1624},
        })



  
return lib

