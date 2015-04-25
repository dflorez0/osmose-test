--- Automatic Model Instantiation (AMI)
-- Frontend template
-- @author Nils Schueler 
-- @release 06.11.2014

local lfs = require('lfs')

local osmose = require 'lib.osmose'

local project = osmose.Project('CSVimport-export', 'YearlyOperatingCost')

-- operationalCosts to be used only when objective is YearlyOperatingCost
project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time= 2000.0}

-- ##############################################
-- ############### LOAD DATA ####################
-- ##############################################

local buildingDataHeader = {
   dataID = 'EGID', 
   attributes = {
      'design_demand',
      'supply_temp_heat',
      'return_temp_heat',
   }
}

local buildingData = project:loadData({
  dataPath = 'csv_data.csv', 
  dataHeader = buildingDataHeader})

-- ##############################################
-- ############### LOAD MODEL ###################
-- ##############################################


project:loadClusters(project.clusters)

--project:load(
--	{building = "_examples/AMI_ET", withData = buildingData}  --, with = 'data/MultiTime_test.csv'}
--)

project:periode(1):time(1)
--project:periode(2):time(2)

-- local oneRun = osmose.Eiampl(project)

-- osmose.Glpk(oneRun)

-- osmose.Graph(oneRun)

-- project:solve({graph=false, clusters={'e1','e2'}} )

project:writeData({
  luatable = buildingData, 
  filename = 'newcsvfile.csv', 
--   noHeader = true,
})