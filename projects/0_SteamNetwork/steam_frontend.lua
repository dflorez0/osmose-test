--[[------------------------------------------------------

  This is an example of a jam factory with Yearly Operating Cost.

--]]------------------------------------------------------


local osmose = require 'lib.osmose'

local project = osmose.Project('steam', 'OperatingCost')

project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time=8000}

project:load( {utilities="ET.generic_utilities"},{steamm = "ET.SteamNetwork.SteamNetwork_ET"})
	
	
project:solve({graph={format = "jpg"}}) 