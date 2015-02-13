--[[------------------------------------------------------

  # jam multitime multiperiode

  This is an example of a jam factory with MER and multiperiode and multitime.

--]]------------------------------------------------------


local osmose = require 'lib.osmose'

local project = osmose.Project('jamDakota', 'OperatingCost')

project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time=8000.0}

project:load(
	{cip = "ET.Cip",						},
	{cm1 = "ET.CookingMixing" },
	{gen = "ET.generic_utilities"}
)


project:optimize {
	software='dakota',
	precomputes={'jam_precompute'},
	objectives={'jam_rosenbrock'},
	-- variables={x1={model='cm1', tag='prod_2_flow', lower_bound='1800', uper_bound='2200', initial='2100'},
	-- 					 x2={model='cm1', tag='prod_1_flow', lower_bound='800', uper_bound='1200', initial='900'}},
	variables={x1={lower_bound='-2.0', upper_bound='2.0', initial='-1.0'},
						 x2={lower_bound='-2.0', upper_bound='2.0', initial='1.0'}},
	method={name='conmin_frcg'},
	objectives_size=1,
	}

  