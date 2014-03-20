--[[------------------------------------------------------

  # building model - Workshop IPESEski
  # frontend
  # 19.03.2014
  # Stefano Moret, Leandro Salgueiro 
  
--]]------------------------------------------------------


local osmose = require 'osmose'

local project = osmose.Project('building', 'YearlyOperatingCost')

project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time= 2000.0}

project:load(
	{cip = "ET.building_ET"}
)

local oneRun = osmose.Eiampl(project)

osmose.Glpk(oneRun)

osmose.Graph(oneRun)