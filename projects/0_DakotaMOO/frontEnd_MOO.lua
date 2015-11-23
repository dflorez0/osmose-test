--[[------------------------------------------------------

  # jam MER

  This is an example of a jam factory with MER.

--]]------------------------------------------------------


local osmose = require 'lib.osmose'

local project = osmose.Project('S_Problem_MOO', 'OpCostWithImpact') --OpCostWithImpact
project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time= 2000.0}

project.ecoinvent = {
  impactMethodName = 'IPCC 2007', -- USEtox IPCC 2013 IMPACT 2002+ (Endpoint)
  impactCategoryName = 'climate change', -- human toxicity climate change
  name = 'GWP 100a', -- total GWP 100a
  folder = 'test/fixtures' -- path to the ecoinvent folder
}

project.options = {graph = false} --{format = 'jpg', spaghetti = false}}
project.options.doLCA = false

project:load(
	{P_MOO = "ET.Test-Dakota.S_Problem_MOO"}
)


project:optimize {
	software        ='dakota',
	computes     ={'S_problem_MOO_compute'},
  postcompute  ={'S_problem_MOO_postcompute'},
	objectives_size =2,
  continuous_variables= { x1={lower_bound='0', upper_bound='1.0', initial='0.4'},
                          x2={lower_bound='0', upper_bound='1.0', initial='0.5'}},
  discrete_variables = {  y1 = {type = 'integer', values = {0,1}},
                          y2 = {type = 'string',  values = {'a','b'}},  -- ATTENTION: values must be in ascending order!
                          y3 = {type = 'real',    values = {2.2,5.4,8}}},
	method          = {  name = 'moga', 
                      fitness_type='domination_count',
                      initialization_type='unique_random',
                      crossover_type='shuffle_random',
                      max_iterations=1000, 
                      final_solutions=100,
                      population_size=30,
                      crossover_rate=0.1,
                      mutation_rate=0.1,
					  output = 'verbose'}, --	mutation_type		= 'bit_random'
						--debug	Level 5 of 5 - maximum
						--verbose		Level 4 of 5 - more than normal
						--normal		Level 3 of 5 - default
						--quiet			Level 2 of 5 - less than normal
						--silent		Level 1 of 5 - minimum
	graphics=true
}