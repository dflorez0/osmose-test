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

project:load(
	{P_MOO = "ET.Test-Dakota.S_Problem_MOO"}
)


project:optimize {
	software        ='dakota',
	computes     ={'S_problem_MOO_compute'},
  postcompute  ={'S_problem_MOO_postcompute'},
	objectives_size =2,
--  continuous_variables= { x1={lower_bound='0', upper_bound='1.0', initial='0.4'},
--                          x2={lower_bound='0', upper_bound='1.0', initial='0.5'}},
--  integer_variables = { y1 = {0,1}, y2 = {0,1}, y3 = {2,5,8}},
	variable_domain = 'continuous_design',
	variables       ={x1={lower_bound='0', upper_bound='1.0', initial='0.5'},
                    x2={lower_bound='0', upper_bound='1.0', initial='0.5'}},
	method          ={  name = 'moga', 
                      fitness_type='domination_count',
                      initialization_type='unique_random',
                      crossover_type='shuffle_random',
                      max_iterations=30, 
                      final_solutions=5,
                      population_size=10,
                      crossover_rate=0.1,
                      mutation_rate=0.1,}, --	mutation_type		= 'bit_random'
	graphics=true
}