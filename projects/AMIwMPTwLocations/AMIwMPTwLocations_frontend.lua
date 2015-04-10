--- Automatic Model Instantiation (AMI)
-- Frontend template
-- @author Nils Schueler 
-- @release 06.11.2014

local lfs = require('lfs')

local osmose = require 'lib.osmose'

local project = osmose.Project('AMIwMPTwLocations', 'OperatingCost')

-- operationalCosts to be used only when objective is YearlyOperatingCost
-- project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time= 2000.0}
project.operationalCosts = 'MPTdata/op_costs.ods'

local buildingDataHeader = {
   dataID = 'EGID', 
   attributes = {
      'design_demand',
      'supply_temp_heat',
      'return_temp_heat',
      'location',
   }
}

local buildingData = project:loadData({dataPath = 'AMIwMPTwLocations_data.csv', dataHeader = buildingDataHeader})

project.clusters = ({e1={'A'}, e2={'B'}, e3={'C'}})
project:loadClusters(project.clusters)

for ID,data in pairs(buildingData) do
   project:load(
           {['building'..ID] = "_examples/AMI_ET", locations = {buildingData[ID]['location']}, withData = {[ID]=data}, with = 'MPTdata/' .. ID .. '.csv'}
   )
end

project:periode(1):time(3)
--project:periode(2):time(2)

local oneRun = osmose.Eiampl(project)

osmose.Glpk(oneRun)

osmose.Graph(oneRun)
-- osmose.Graph(oneRun, 'png')
