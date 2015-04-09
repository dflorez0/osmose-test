--- Automatic Model Instantiation (AMI)
-- Frontend template
-- @author Nils Schueler 
-- @release 06.11.2014

local lfs = require('lfs')

local osmose = require 'lib.osmose'

local project = osmose.Project('AMIwLocations', 'YearlyOperatingCost')

-- operationalCosts to be used only when objective is YearlyOperatingCost
project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time= 2000.0}
-- project.operationalCosts = 'data/op_costs.ods'

local buildingDataHeader = {
   dataID = 'EGID', 
   attributes = {
      'design_demand',
      'supply_temp_heat',
      'return_temp_heat',
      'location',
   }
}

local buildingData = project:loadData({dataPath = 'AMIwLocations_data.csv', dataHeader = buildingDataHeader})

project.clusters({e1={'1'}, e2={'2'}, e3={'1','2','3'}})

--project:load(
--	{building = "_examples/AMI_ET", withData = buildingData}  --, with = 'data/MultiTime_test.csv'}
--)
for ID,data in pairs(buildingData) do
   project:load(
           {building = "_examples/AMI_ET", locations = {buildingData[ID]['location']}, withData = {[ID]=data}}  --, with = 'MPTdata/' .. ID .. '.csv'}
   )
end

-- project:periode(1):time(1)
--project:periode(2):time(2)

-- local oneRun = osmose.Eiampl(project)

-- osmose.Glpk(oneRun)

-- osmose.Graph(oneRun)

project:solve({graph=false, clusters={'e1','e2'}} )