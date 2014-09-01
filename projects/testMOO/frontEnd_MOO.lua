--[[------------------------------------------------------

  # frontEnd_MOO
  This frontend is developed to test dakota multi-objective optimization.

  10.08.2014

  @author: Samira Fazlollahi (samira.fazlollahi@a3.epfl.ch)

  @copyright IPESE

--]]------------------------------------------------------



local osmose = require 'lib.osmose'

local project = osmose.Project('S_Problem_MOO', 'OpCostWithImpact')
project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time= 2000.0}
project:load(
	{P_MOO = "ET.S_Problem_MOO"}
)

--[[
 project:solve()
 print(project:postCompute('S_problem_MOO_postcompute1'))
 --]]

project:optimize {
	software='dakota',
	precomputes={'S_problem_MOO_precompute'},
	objectives={'S_problem_MOO_postcompute'},
	objectives_size=2,
	variables={x1={lower_bound='0', upper_bound='1.0', initial='1'},
						 x2={lower_bound='0', upper_bound='1.0', initial='1'}},
	method={name = 'moga', max_iterations=1000},

	}


