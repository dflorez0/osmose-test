--[[------------------------------------------------------

  # jam multitime multiperiode

  This is an example of a jam factory with MER and multiperiode and multitime.

--]]------------------------------------------------------


local osmose = require 'osmose'

local project = osmose.Project('LuaJamMTP', 'MER')

--project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time=8000.0}
project.operationalCosts = 'data/JAM_operational_costs.ods'

project:load(
	{cip = "ET.Cip",						with = 'data/JAM_values_mtp.ods'},
	{cm1 = "ET.CookingMixing", 	with = 'data/JAM_values_mtp.ods'},
	{cm2 = "ET.CookingMixing", 	with = 'data/JAM_values_mtp.ods'},
	{gen = "ET.generic_utilities"}
)

project:periode(1):time(3)
project:periode(2):time(3)


local oneRun = osmose.Eiampl(project)

osmose.Glpk(oneRun)

osmose.Graph(oneRun)

