--[[------------------------------------------------------
  
#  #S-Problem_MOO
  Energy technology model for testing dakota multi-objective optimization.

  10.08.2014

  @author: Samira Fazlollahi (samira.fazlollahi@a3.epfl.ch)

  @copyright IPESE


--]]------------------------------------------------------

--[[------------------------------------------------------
	 	CALLING OF OSMOSE AND MODEL NAMING 
--]]------------------------------------------------------

local osmose = require 'osmose'								-- calls up osmose in \lib\ folder, do no change
local P_MOO = osmose.Model 'S_Problem_MOO' 						 
	


P_MOO.inputs = { 
    timeValue = {default = 100, min=100, max=500, unit = 'kW'},
    FmaxHotUtility1 = {default = 10, min=0, max=10, unit = '-'},
    FmaxHotUtility2 = {default = 10, min=0, max=10, unit = '-'},
    ProcessMult = {default = 1, min=1, max=1, unit = '-'}
  }

P_MOO.outputs = { -- doc 
cinValueTime = {job = "2 * timeValue " , unit = 'm^2'},
}


P_MOO:addUnit("cold_p", {type = 'Process', Mult = 'ProcessMult', Cinv2=0, Cost2= 0, Power2=0, Impact2=0, Cinv1=0, Cost1=0, Power1=0, Impact1=0})				
P_MOO["cold_p"]:addStreams({
cooling_cu1 = qt {30, 0, 50, 100, 0, 0}
  })

 
P_MOO:addUnit("hot_u1", {type = 'Utility',Fmax = 'FmaxHotUtility1', Fmin = 0, Cinv2=0, Cost2=20, Power2=0, Impact2=2, Cinv1=0, Cost1=2, Power1=0, Impact1=0.2})
P_MOO["hot_u1"]:addStreams({
hot_u1h1 = qt {100, 10 , 60,0,0,0},
  })
  
  
P_MOO:addUnit("hot_u2", {type = 'Utility',Fmax = 'FmaxHotUtility2', Fmin = 0, Cinv2=0, Cost2=2, Power2=0, Impact2=20, Cinv1=0, Cost1=0.2, Power1=0, Impact1=2})
P_MOO["hot_u2"]:addStreams({
hot_u1h1 = qt {120, 10, 90,0,0,0},
  })
  
return P_MOO