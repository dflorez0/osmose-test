--[[------------------------------------------------------

  # jam MER

  This is an example of a jam factory with MER.

--]]------------------------------------------------------


local osmose = require 'lib.osmose'

local project = osmose.Project('S_Problem_MOO', 'OpCostWithImpact')
project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time= 2000.0}
project:load(
	{P_MOO = "ET.S_Problem_MOO"}
)


-- project:solve()

project:optimize {
	software='dakota',
	precomputes={'S_problem_MOO_precompute'},
	objectives={'S_problem_MOO_postcompute1'},
	objectives_size=2,

	variable_domain = 'continuous_design',
	variables={x1={lower_bound='0', upper_bound='1.0', initial='0.5'},
						 x2={lower_bound='0', upper_bound='1.0', initial='0.5'}},
	method={name = 'moga', 
					fitness_type='domination_count',
					initialization_type='unique_random',
					crossover_type='shuffle_random',
					max_iterations=30, 
					final_solutions=5,
					population_size=10,
					crossover_rate=0.1,
					mutation_rate=0.1,},
	graphics=true
	}