--- Osmose2GLPK
-- Frontend template
-- example for how to define parameters/variables/equations for GLPK in Osmose
-- @author Nils Schueler 
-- @release 28.10.2015

local osmose = require 'lib.osmose'

local project = osmose.Project('Test_Osmose2GLPK', 'OperatingCost', 'testing')

project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time=8000}

project:load( 
  {utilities = 'TestGLPK/generic_utilities'},
  {process = 'Cip'}
)
	
project:solve({graph={format = 'jpg'}}) 

-- check now the eiampl.run file (the lines before the objective is defined) 
-- and the eiampldata.in file (last lines) to see the added variables/parameters  