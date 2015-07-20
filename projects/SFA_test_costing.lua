--[[------------------------------------------------------

  # Testing costing layers
  # frontend
  # 19.03.2014
  # Samira fazlollahi 
  
--]]------------------------------------------------------



local osmose = require 'lib.osmose'

local project = osmose.Project('SFA_Problem_mass2_qt_cost_Time', 'Impact')

--project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time= 2000.0}
project.operationalCosts = 'op_costs.csv'

project:load(
	{cip = "SFA_Problem_mass2_qt_cost_Time", with = 'mts_data.csv'}
)

project:periode(1):time(3)

local oneRun = osmose.Eiampl(project)

osmose.Glpk(oneRun)

osmose.Graph(oneRun)

osmose.PostPrint(oneRun)