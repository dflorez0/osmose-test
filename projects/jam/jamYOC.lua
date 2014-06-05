--[[------------------------------------------------------

  # jam

  This is an example of a jam factory with Yearly Operating Cost.

--]]------------------------------------------------------


local osmose = require 'osmose'

local project = osmose.Project('LuaJamYoc', 'YearlyOperatingCost')

project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time=8000.0}

project:load(
	{cip = "ET.Cip"},
	{cm1 = "ET.CookingMixing"},
	{cm2 = "ET.CookingMixing", with = 'CM2_inputs.csv'},
	{utilities = "ET.generic_utilities"}
)

local oneRun = osmose.Eiampl(project)

osmose.Glpk(oneRun)

osmose.Graph(oneRun)