--[[------------------------------------------------------

  # jam MER

  This is an example of a jam factory with MER.

--]]------------------------------------------------------


local osmose = require 'lib.osmose'

local project = osmose.Project('sofc', 'OperatingCost')

project:load(
  {cip = "ET.sofc"},
  {utilities = "ET.utilities"}
)
-- operationalCosts to be used only when objective is YearlyOperatingCost
project.operationalCosts={cost_elec_in=2, cost_elec_out=5, op_time=8600}

--osmose.Eiampl(project)

--osmose.Glpk(oneRun)

--osmose.Graph(oneRun)

project:solve()

project:compute('jam_postcompute.lua')

