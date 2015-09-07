--[[------------------------------------------------------

  # jam MER

  This is an example of a jam factory with MER.

--]]------------------------------------------------------


local osmose = require 'lib.osmose'

local project = osmose.Project('TestQual', 'OperatingCost')

project:load(
	{Qual = "ET.TestQuality.QualET"}
)

-- operationalCosts to be used only when objective is YearlyOperatingCost
project.operationalCosts={cost_elec_in=1, cost_elec_out=0, op_time=8600}

project:solve({graph={format = "jpg"}}) -- {graph=false} {graph={format = 'sng', options ={real_T = true}}}

