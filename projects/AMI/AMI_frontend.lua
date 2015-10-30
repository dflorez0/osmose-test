--- Automatic Model Instantiation (AMI)
-- Frontend template
-- @author Nils Schueler 
-- @release 06.11.2014

local lfs = require('lfs')

local osmose = require 'lib.osmose'

local project = osmose.Project('AMI', 'YearlyOperatingCost')

-- operationalCosts to be used only when objective is YearlyOperatingCost
project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time= 2000.0}
-- project.operationalCosts = 'data/op_costs.ods'

local buildingDataHeader = {
   dataID = 'EGID', 
   attributes = {
      'design_demand',
      'supply_temp_heat',
      'return_temp_heat',
   }
}

local buildingData = project:loadData({dataPath = 'AMI_data_red.csv', dataHeader = buildingDataHeader})

-- nsc: loading the clusters here does not work for AMI since the clusters are loaded and loaded again resulting in a table with the same cluster(s) several times. This leads to tuples in the eiampldata.in file
project:loadClusters(project.clusters)

--project:load(
--	{building = "_examples/AMI_ET", withData = buildingData}  --, with = 'data/MultiTime_test.csv'}
--)
-- 2nd option (required for MPT or Locations - see regarding examples):
for ID,data in pairs(buildingData) do
 project:load(
         {['building'..ID] = "TestAMI/AMI_ET", withData = {[ID]=data}}  --, with = 'MPTdata/' .. ID .. '.csv'}
--            {building = "_examples/AMI_ET", withData = {[ID]=data}}  --, with = 'MPTdata/' .. ID .. '.csv'}
 )
end

project:periode(1):time(1)
--project:periode(2):time(2)

-- local oneRun = osmose.Eiampl(project)

-- osmose.Glpk(oneRun)

-- osmose.Graph(oneRun)
-- osmose.Graph(oneRun, 'png')

project:solve({graph=false, clusters={'e1','e2'}} )