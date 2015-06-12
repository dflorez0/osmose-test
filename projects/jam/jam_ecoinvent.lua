--[[------------------------------------------------------

  # jam MER

  This is an example of a jam factory with MER.

--]]------------------------------------------------------


local osmose = require 'lib.osmose'

local project = osmose.Project('LuaJam', 'OperatingCost')

project.ecoinvent = {
  impactMethodName = 'CML 2001', -- USEtox
  impactCategoryName = 'photochemical oxidation (summer smog)', -- human toxicity
  name = 'EBIR', -- total
  folder = 'projects/jam' -- path to the ecoinvent folder
}


project:load(
	{cip = "ET.Cip_ecoinvent"},
  {utilities = "ET.generic_utilities"},
	{cm1 = "ET.CookingMixing"}
	--{cm2 = "ET.CookingMixing", with = 'CM2_inputs.csv'}
)

-- operationalCosts to be used only when objective is YearlyOperatingCost
project.operationalCosts={cost_elec_in=2, cost_elec_out=5, op_time=8600}

--osmose.Eiampl(project)

-- osmose.Glpk(oneRun)

-- osmose.Graph(oneRun)

project:solve() --{graph=false}

project:compute('jam_postcompute.lua')

