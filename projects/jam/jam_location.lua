--[[------------------------------------------------------

  # jam MER

  This is an example of a jam factory with MER.

--]]------------------------------------------------------


local osmose = require 'lib.osmose'

local project = osmose.Project('LuaJam1', 'MER')


project.clusters = {e1={'L1'}, e2={'L2'}, e3={'L1','L2','L3'}}


project.operationalCosts={cost_elec_in=2, cost_elec_out=5, op_time=8600}


project:load(
	{cip = "ET.Cip", locations={'L1','L2','L3'}},
  {utilities = "ET.generic_utilities", locations={'L1','L2','L3'}},
	{cm1 = "ET.CookingMixing", locations={'L1','L2','L3'}},
	{cm2 = "ET.CookingMixing", locations={'L1','L2'},  with = 'CM2_inputs.csv', },
	{cm3 = "ET.CookingMixing", locations={'L3'}}
)

project:solve({graph=false, clusters={'e1','e2'}} )
-- project:solve({graph=false},clusters=>{'e3'} )


project:compute('jam_postcompute.lua')

