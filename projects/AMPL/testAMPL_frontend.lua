--- AMPLhandler
-- Frontend template
-- example for how to use AMPL instead of GLPK in Osmose
-- & how to specify a list of .mod files where modFiles are all files to be loaded before the objective function & solve command (pre-solve)
-- and dispFiles are all files to be loaded after (containing disp commands; post-solve)
-- @author Nils Schueler 
-- @release 29.10.2015

local osmose = require 'lib.osmose'

local project = osmose.Project('Test_AMPL', 'OperatingCost', 'testing')

project.options = {}
project.options.mathProg = {}
-- specify if you want to use AMPL
project.options.mathProg.language = 'ampl'
-- specify the mod files you want to use
project.options.mathProg.modFiles = {'eiampl_p', 'costing_p', 'heat_cascade_base_glpsol_p', 'heat_cascade_no_restrictions_p', 'mass_p', 'resource_p', 'mass_quality_p', 'resource_quality_p'}
project.options.mathProg.dispFiles = {'costing_postSolve_p', 'heat_cascade_base_postSolve_p', 'mass_postSolve_p', 'resource_postSolve_p', 'mass_quality_postSolve_p', 'resource_quality_postSolve_p'}

project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time=8000}

project:load( 
  {utilities = 'generic_utilities'},
  {process = 'Cip'}
)
	
project:eiampl()
	

project:solve() 