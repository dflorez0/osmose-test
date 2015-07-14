--[[------------------------------------------------------
  # Problem_twoHClayer
--]]------------------------------------------------------

--[[------------------------------------------------------
	 	CALLING OF OSMOSE AND MODEL NAMING 
--]]------------------------------------------------------

local osmose = require 'osmose'								-- calls up osmose in \lib\ folder, do no change
local Problem_twoHClayer = osmose.Model 'S_Problem_HClayer' 						 
	

--[[------------------------------------------------------
	DEFINITION OF Layers -- LAYERS declaration for balancing (mass, electricity,...)
--]]------------------------------------------------------



Problem_twoHClayer.inputs = { 
   timeValue = {default = 100, min=100, max=500, unit = 'kW'},
  
  }

Problem_twoHClayer.outputs = { -- doc 
cinValueTime = {job = "2 * timeValue " , unit = 'm^2'},
flowProcess = {job = "0.1 * timeValue " , unit = 'm^2'},
HotLoad = {job = "1 * timeValue " , unit = 'm^2'},
tempCool = {job = "1 * timeValue " , unit = 'm^2'},
Fmaxclev_p = {job = "2" , unit = 'm^2'},
}
--Problem_twoHClayer:addLayers {DefHeatCascade = {type ='HeatCascade', unit ='kg'}}
Problem_twoHClayer:addLayers {bands = {type ='MassBalance', unit ='kg'}}
Problem_twoHClayer:addLayers {DefaultHeatCascade2 = {type ='HeatCascade', unit ='kg'}}

--Problem_twoHClayer:addLocations {def_location = {x =200, y =400}}
--[[------------------------------------------------------
	DEFINITION OF Units and STREAMS 
--]]------------------------------------------------------


Problem_twoHClayer:addUnit("clev_p", {type = 'Process', Mult = 1, Cinv2='cinValueTime', Cost2=2, Power2=3, Impact2=4, Cinv1=10, Cost1=20, Power1=30, Impact1=40})
--Problem_twoHClayer:addUnit("clev_p", {type = 'Process',Fmax = 1000, Cinv2=1, Cost2=2, Power2=3, Impact2=4, Cinv1=10, Cost1=20, Power1=30, Impact1=40}) 				
 				
													
Problem_twoHClayer["clev_p"]:addStreams({
clevmass_bands_out = ms({'bands','out', 'flowProcess'}),
  })
  --Problem_twoHClayer["clev_p"][clevmass...].addToProbelm   
Problem_twoHClayer:addUnit("stl_ut", {type = 'Utility',Fmax = 1000, Cinv2=11, Cost2=21, Power2=31, Impact2=41, Cinv1=110, Cost1=210, Power1=310, Impact1=410}) 				
													
Problem_twoHClayer["stl_ut"]:addStreams({
stlmass_bands_in = ms({'bands', 'in', 7}),
  }) 
  
 
  Problem_twoHClayer:addUnit("cooling", {type = 'Utility',Fmax = 2, Cinv2=12, Cost2=22, Power2=32, Impact2=42, Cinv1=120, Cost1=220, Power1=320, Impact1=420}) 				
											
Problem_twoHClayer["cooling"]:addStreams({
--cooling_cu1 = qt {278, 0, 288, 100, 10, 0.5,'DefHeatCascade'}
cooling_cu1 = qt {'tempCool', 0, 310, 100, 0, 0}
  })
  
  
Problem_twoHClayer:addUnit("hot", {type = 'Process',Fmax = 1000, Cinv2=13, Cost2=23, Power2=33, Impact2=43, Cinv1=130, Cost1=230, Power1=330, Impact1=430}) 				
											
Problem_twoHClayer["hot"]:addStreams({
--hot_h1 = qt {600, 100, 500, 0,10, 0.5,'DefHeatCascade'},
--hot_h2 = qt {500, 100, 400, 0,10, 0.5,'DefHeatCascade'}
hot_h1 = qt {600, 'HotLoad', 500,0,0,0},
hot_h2 = qt {500, 'HotLoad', 400,0,0,0}
  })
  
 
 -- Second layer cold and hot utilities
 Problem_twoHClayer:addUnit("coolingLayer2", {type = 'Utility',Fmax = 2, Cinv2=12, Cost2=22, Power2=32, Impact2=42, Cinv1=120, Cost1=220, Power1=320, Impact1=420}) 				
											
Problem_twoHClayer["coolingLayer2"]:addStreams({
--cooling_cu1 = qt {278, 0, 288, 100, 10, 0.5,'DefHeatCascade'}
--cooling_cu1Layer2 = qt {'tempCool', 900, 310, 1000, 0, 0}
cooling_cu1Layer2 = qt {'tempCool', 0, 310, 100, 0, 0}
  })
  
Problem_twoHClayer["coolingLayer2"]["cooling_cu1Layer2"].layerName = {'DefaultHeatCascade2'}
  
  
Problem_twoHClayer:addUnit("hotLayer2", {type = 'Process',Fmax = 1000, Cinv2=13, Cost2=23, Power2=33, Impact2=43, Cinv1=130, Cost1=230, Power1=330, Impact1=430}) 				
											
Problem_twoHClayer["hotLayer2"]:addStreams({
--hot_h1 = qt {600, 100, 500, 0,10, 0.5,'DefHeatCascade'},
--hot_h2 = qt {500, 100, 400, 0,10, 0.5,'DefHeatCascade'}
hot_h1Layer2 = qt {600, 'HotLoad', 500,0,0,0},
hot_h2Layer2 = qt {500, 'HotLoad', 400,0,0,0}
})

-- optional :
Problem_twoHClayer["hotLayer2"]["hot_h1Layer2"].layerName = {'DefaultHeatCascade2'}
Problem_twoHClayer["hotLayer2"]["hot_h2Layer2"].layerName = {'DefaultHeatCascade2'}

return Problem_twoHClayer