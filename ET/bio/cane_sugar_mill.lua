#!/usr/bin/lua
--[[------------------------------------------------------

  # template
  -- Model includes sugarcane extraction and juice treatment systems
--]]------------------------------------------------------
--require ("mobdebug").start()
--[[
sugarcane mill model: dry cane cleaning system, juice extraction with electric driven mill tandems (16kWh/tc)
Juice treatment for ethanol production
Concentration in multi-effect evaporators
Must pausterization process after concentration

Fermentation and Distillation are not included in this model
]]--

local osmose = require 'osmose'
local lib = osmose.Model 'cane_sugar_mill'

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
CAPEX = {default = 22000000 , min=0, max=1000, unit = 'USD'}, 
  
  
  
  
tin1 = {default = 25, min=0, max=1000, unit = 'C'},
tin2 = {default = 31.5, min=0, max=1000, unit = 'C'},
tin3 = {default = 79.3, min=0, max=1000, unit = 'C'},
tin4 = {default = 99, min=0, max=1000, unit = 'C'},
tin5 = {default = 25, min=0, max=1000, unit = 'C'},
tin6 = {default = 95.8, min=0, max=1000, unit = 'C'},
tin7 = {default = 130, min=0, max=1000, unit = 'C'},

tout1 = {default = 50, min=0, max=1000, unit = 'C'},
tout2 = {default = 70, min=0, max=1000, unit = 'C'},
tout3 = {default = 105, min=0, max=1000, unit = 'C'},
tout4 = {default = 25, min=0, max=1000, unit = 'C'},
tout5 = {default = 90, min=0, max=1000, unit = 'C'},
tout6 = {default = 130, min=0, max=1000, unit = 'C'},
tout7 = {default = 32, min=0, max=1000, unit = 'C'},

deltah1 = {default = 3679, min=-100000, max=100000, unit = 'kW'},
deltah2 = {default = 19023.5, min=-100000, max=100000, unit = 'kW'},
deltah3 = {default = 16529.65, min=-100000, max=100000, unit = 'kW'},
deltah4 = {default = -1, min=-100000, max=100000, unit = 'kW'},
deltah5 = {default = 2417.3, min=-100000, max=100000, unit = 'kW'},
deltah6 = {default = 10577, min=-100000, max=100000, unit = 'kW'},
deltah7 = {default = -29870.3, min=-1000000, max=100000, unit = 'kW'},
 
deltaT_l = {default = 5, min=0, max=1000, unit = 'K'},  
deltaT_v = {default = 25, min=0, max=1000, unit = 'K'}, 
deltaT_lv = {default = 2, min=0, max=1000, unit = 'K'}, 

st_h_l = {default = 0.5, min=0, max=1000, unit = 'kW/m2 K'}, 
st_h_v = {default = 1, min=0, max=1000, unit = 'kW/m2 K'}, 
st_h_lv = {default = 0.05, min=0, max=1000, unit = 'kW/m2 K'}, 


--evaporation inputs
tin_evap1 = {default = 45, min=0, max=1000, unit = 'C'},
tin_evap2 = {default = 117, min=0, max=1000, unit = 'C'},
tin_evap3 = {default = 107.5, min=0, max=1000, unit = 'C'},
tin_evap4 = {default = 98, min=0, max=1000, unit = 'C'},
tin_evap5 = {default = 84, min=0, max=1000, unit = 'C'},
tin_evap6 = {default = 117, min=0, max=1000, unit = 'C'},
tin_evap7 = {default = 117, min=0, max=1000, unit = 'C'},
tin_evap8 = {default = 107, min=0, max=1000, unit = 'C'},
tin_evap9 = {default = 107, min=0, max=1000, unit = 'C'},
tin_evap10 = {default = 98, min=0, max=1000, unit = 'C'},
tin_evap11 = {default = 98, min=0, max=1000, unit = 'C'},
tin_evap12 = {default = 83, min=0, max=1000, unit = 'C'},
tin_evap13 = {default = 83, min=0, max=1000, unit = 'C'},
tin_evap14 = {default = 84, min=0, max=1000, unit = 'C'},



tout_evap1 = {default = 117, min=0, max=1000, unit = 'C'},
tout_evap2 = {default = 117, min=0, max=1000, unit = 'C'},
tout_evap3 = {default = 107.5, min=0, max=1000, unit = 'C'},
tout_evap4 = {default = 98, min=0, max=1000, unit = 'C'},
tout_evap5 = {default = 84, min=0, max=1000, unit = 'C'},
tout_evap6 = {default = 117, min=0, max=1000, unit = 'C'},
tout_evap7 = {default = 25, min=0, max=1000, unit = 'C'},
tout_evap8 = {default = 107, min=0, max=1000, unit = 'C'},
tout_evap9 = {default = 25, min=0, max=1000, unit = 'C'},
tout_evap10 = {default = 98, min=0, max=1000, unit = 'C'},
tout_evap11 = {default = 25, min=0, max=1000, unit = 'C'},
tout_evap12 = {default = 83, min=0, max=1000, unit = 'C'},
tout_evap13 = {default = 25, min=0, max=1000, unit = 'C'},
tout_evap14 = {default = 32, min=0, max=1000, unit = 'C'},

              
 deltah_evap1 = {default = 667, min=-10000, max=10000, unit = 'kW'}, -- preheating input
 deltah_evap2 = {default = 3730, min=-10000, max=10000, unit = 'kW'},  -- heat 1st effect
 deltah_evap3 = {default = 3657, min=-1000, max=10000, unit = 'kW'}, -- heat 2nd effect
 deltah_evap4 = {default = 3635, min=-10000, max=10000, unit = 'kW'}, -- heat 3rd effect
 deltah_evap5 = {default = 3430, min=-10000, max=10000, unit = 'kW'}, --heat 4th effect
 deltah_evap6 = {default = -3725, min=-10000, max=10000, unit = 'kW'}, -- condensing 1
 deltah_evap7 = {default = -656, min=-10000, max=10000, unit = 'kW'}, --cooling 1
 deltah_evap8 = {default = -3767, min=-10000, max=10000, unit = 'kW'}, -- condensing 2
 deltah_evap9 = {default = -59, min=-10000, max=10000, unit = 'kW'}, --cooling 2
 deltah_evap10 = {default = -3813, min=-10000, max=10000, unit = 'kW'}, --condensing 3
 deltah_evap11 = {default = -512, min=-10000, max=10000, unit = 'kW'},--cooling 3
 deltah_evap12 = {default = -3860, min=-10000, max=10000, unit = 'kW'}, --condensing 4
 deltah_evap13 = {default = -414, min=-10000, max=10000, unit = 'kW'},--cooling 4
 deltah_evap14 = {default = -99, min=-10000, max=10000, unit = 'kW'}, -- cooling prior fermentation
 
   
}

lib.outputs = { 
CAPEX_h = {unit = 'USD/h', job = "(CAPEX*CEPCI_new/CEPCI_ref)*(i*(i+1)^lifetime)/(((i+1)^lifetime)-1)/year_hours" }, 
deltaT1 = {unit = 'kW/m2 K', job = "1*deltaT_l " },  
deltaT2 = {unit = 'kW/m2 K', job = "1*deltaT_l " },  
deltaT3 = {unit = 'kW/m2 K', job = "1*deltaT_l " },  
deltaT4 = {unit = 'kW/m2 K', job = "1*deltaT_l " },  
deltaT5 = {unit = 'kW/m2 K', job = "1*deltaT_l " },  
deltaT6 = {unit = 'kW/m2 K', job = "1*deltaT_l " },  
deltaT7 = {unit = 'kW/m2 K', job = "1*deltaT_l " },  


st_h1 = {unit = 'kW/m2 K', job = "1*st_h_l " },  
st_h2 = {unit = 'kW/m2 K', job = "1*st_h_l " },  
st_h3 = {unit = 'kW/m2 K', job = "1*st_h_l " },  
st_h4 = {unit = 'kW/m2 K', job = "1*st_h_l " },  
st_h5 = {unit = 'kW/m2 K', job = "1*st_h_l " },  
st_h6 = {unit = 'kW/m2 K', job = "1*st_h_l" },  
st_h7 = {unit = 'kW/m2 K', job = "1*st_h_l " },  

-- evaporation outputs
deltaT_evap1 = {unit = 'kW/m2 K', job = "deltaT_lv " },  
deltaT_evap2 = {unit = 'kW/m2 K', job = "deltaT_lv " },  
deltaT_evap3 = {unit = 'kW/m2 K', job = "deltaT_lv " },  
deltaT_evap4 = {unit = 'kW/m2 K', job = "deltaT_lv " },  
deltaT_evap5 = {unit = 'kW/m2 K', job = "deltaT_lv " },  
deltaT_evap6 = {unit = 'kW/m2 K', job = "deltaT_lv " },  
deltaT_evap7 = {unit = 'kW/m2 K', job = "deltaT_l " },  
deltaT_evap8 = {unit = 'kW/m2 K', job = "deltaT_lv " },  
deltaT_evap9 = {unit = 'kW/m2 K', job = "deltaT_l " },  
deltaT_evap10 = {unit = 'kW/m2 K', job = "deltaT_lv " },  
deltaT_evap11 = {unit = 'kW/m2 K', job = "deltaT_l " },  
deltaT_evap12 = {unit = 'kW/m2 K', job = "deltaT_lv " },  
deltaT_evap13 = {unit = 'kW/m2 K', job = "deltaT_l " },  
deltaT_evap14 = {unit = 'kW/m2 K', job = "deltaT_l " },  

st_h_evap1 = {unit = 'kW/m2 K', job = "st_h_lv " },  
st_h_evap2 = {unit = 'kW/m2 K', job = "st_h_lv " },  
st_h_evap3 = {unit = 'kW/m2 K', job = "st_h_lv " },  
st_h_evap4 = {unit = 'kW/m2 K', job = "st_h_lv " },  
st_h_evap5 = {unit = 'kW/m2 K', job = "st_h_lv " },  
st_h_evap6 = {unit = 'kW/m2 K', job = "st_h_lv" },  
st_h_evap7 = {unit = 'kW/m2 K', job = "st_h_l " },  
st_h_evap8 = {unit = 'kW/m2 K', job = "st_h_lv " },  
st_h_evap9 = {unit = 'kW/m2 K', job = "st_h_l " },  
st_h_evap10 = {unit = 'kW/m2 K', job = "st_h_lv " },  
st_h_evap11 = {unit = 'kW/m2 K', job = "st_h_l " },  
st_h_evap12 = {unit = 'kW/m2 K', job = "st_h_lv " },  
st_h_evap13= {unit = 'kW/m2 K', job = "st_h_l" },  
st_h_evap14 = {unit = 'kW/m2 K', job = "st_h_l " },  



}

lib:addLayers {electricity = {type ='MassBalance', unit ='kW'}}
lib:addLayers {sugarcane = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {glucose_20 = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {freshwater = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {recoveredwater = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {condens_evap = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {bagasse_50 = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {filtercake = {type ='MassBalance', unit ='kg/h'}}

-- units
lib:addUnit("cane_sugar_mill", {type = 'Utility'})
lib["cane_sugar_mill"].Fmax = 10000
--lib["cane_sugar_mill"].Fmin = 0.01
lib["cane_sugar_mill"].Cinv2 = 'CAPEX_h' -- USD 
lib["cane_sugar_mill"]:addStreams({
    --stream1 = {'tin1', 0, 'tout1', 'deltah1' , 'deltaT1', 'st_h1'},
    --stream2 = {'tin2', 0, 'tout2', 'deltah2' , 'deltaT2', 'st_h2'},
    --stream3 = {'tin3', 0, 'tout3', 'deltah3' , 'deltaT3', 'st_h3'},
    stream4 = {'tin4', 0, 'tout4', 'deltah4' , 'deltaT4', 'st_h4'},
    --stream5 = {'tin5', 0, 'tout5', 'deltah5' , 'deltaT5', 'st_h5'},
    stream6 = {'tin6', 0, 'tout6', 'deltah6' , 'deltaT6', 'st_h6'},
    --stream7 = {'tin7', 0, 'tout7', 'deltah7' , 'deltaT7', 'st_h7'},
    
    sugarcane_in = ms{'sugarcane' , 'in', 500000},  
    water_in = ms{'freshwater' , 'in', 138715+35000},  --138715kg/h imbibition's water; 35000kg/h water for filtration
    elec_in = ms{'electricity', 'in', 8000} , -- milling system  
    concentrated_juice_out = ms{'glucose_20' , 'out', 332381.5},  -- 19.2% sucrose and 0.8% dextrose 
    bagasse_out = ms{'bagasse_50' , 'out', 117125-5000}, -- 5000 kg/h used by filter
    condensates = ms{'recoveredwater' , 'out', 207213.5 + 6638}, --207213.5kg/h evap. condensates; 6638kg/h flash vapor juice treatment;   
    --filtercake_out = ms{'filtercake' , 'out', 19424},   -- 66% moiture
    
    evap_water_total = ms{'condens_evap' , 'in', 207213.5}, --used for closing the mass balance of evaporators  
    
        })

--EVAPORATION SYSTEM 4 Effects
lib:addUnit("evap_1", {type = 'Utility', addToProblem=1})
lib["evap_1"].Fmax = 1000
--lib["evap_1"].Fmin = 0.01
lib["evap_1"].Cinv2 = 0  -- USD CAPEX pump
lib["evap_1"]:addStreams({
    stream_evap1 = {'tin_evap1', 0, 'tout_evap1', 'deltah_evap1' , 'deltaT_evap1', 'st_h_evap1'},
    stream_evap2 = {'tin_evap2', 0, 'tout_evap2', 'deltah_evap2' , 'deltaT_evap2', 'st_h_evap2'},
    stream_evap6 = {'tin_evap6', 0, 'tout_evap6', 'deltah_evap6' , 'deltaT_evap6', 'st_h_evap6'},
    stream_evap7 = {'tin_evap7', 0, 'tout_evap7', 'deltah_evap7' , 'deltaT_evap7', 'st_h_evap7'},
    cond_1st = ms{'condens_evap' , 'out', 207213.5/4},  
    
    })
  
  lib:addUnit("evap_2", {type = 'Utility', addToProblem=1})
lib["evap_2"].Fmax = 1000
--lib["evap_2"].Fmin = 0.01
lib["evap_2"].Cinv2 = 0  -- USD CAPEX pump
lib["evap_2"]:addStreams({
       
    stream_evap3 = {'tin_evap3', 0, 'tout_evap3', 'deltah_evap3' , 'deltaT_evap3', 'st_h_evap3'},
    stream_evap8 = {'tin_evap8', 0, 'tout_evap8', 'deltah_evap8' , 'deltaT_evap8', 'st_h_evap8'},
    stream_evap9 = {'tin_evap9', 0, 'tout_evap9', 'deltah_evap9' , 'deltaT_evap9', 'st_h_evap9'},
    cond_2nd = ms{'condens_evap' , 'out', 207213.5/4},  
    
  })

lib:addUnit("evap_3", {type = 'Utility', addToProblem=1})
lib["evap_3"].Fmax = 1000
--lib["evap_3"].Fmin = 0.01
lib["evap_3"].Cinv2 = 0 -- USD CAPEX pump
lib["evap_3"]:addStreams({
    stream_evap4 = {'tin_evap4', 0, 'tout_evap4', 'deltah_evap4' , 'deltaT_evap4', 'st_h_evap4'},
    stream_evap10 = {'tin_evap10', 0, 'tout_evap10', 'deltah_evap10' , 'deltaT_evap10', 'st_h_evap10'},
    stream_evap11 = {'tin_evap11', 0, 'tout_evap11', 'deltah_evap11' , 'deltaT_evap11', 'st_h_evap11'},
    cond_3rd = ms{'condens_evap' , 'out', 207213.5/4},  
    
  })

lib:addUnit("evap_4", {type = 'Utility', addToProblem=1})
lib["evap_4"].Fmax = 1000
--lib["evap_4"].Fmin = 0.01
lib["evap_4"].Cinv2 = 0  -- USD CAPEX pump
lib["evap_4"]:addStreams({
   stream_evap5 = {'tin_evap5', 0, 'tout_evap5', 'deltah_evap5' , 'deltaT_evap5', 'st_h_evap5'},
   stream_evap12 = {'tin_evap12', 0, 'tout_evap12', 'deltah_evap12' , 'deltaT_evap12', 'st_h_evap12'},
   stream_evap13 = {'tin_evap13', 0, 'tout_evap13', 'deltah_evap13' , 'deltaT_evap13', 'st_h_evap13'},
   stream_evap14 = {'tin_evap14', 0, 'tout_evap14', 'deltah_evap14' , 'deltaT_evap14', 'st_h_evap14'},
   cond_4th = ms{'condens_evap' , 'out', 207213.5/4},  

  })
return lib

