--- Automatic Model Instantiation (AMI)
-- Frontend template
-- @author Nils Schueler 
-- @release 06.11.2014
-- @adapted Alex Bertrand, 24.04.2015 to include generic list of clusters and locations: 1 cluster = 1 location = 1EGID

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

-- [[Automatic generation of location and cluster lists]]--
local clusters = {}     -- table containing all cluster tables
local clusterKeys = {}  -- table containing the keys of all clusters
local ck = 0             -- this is the cluster key
local allLocations = {}
for ID,_ in pairs(buildingData) do
  ck = ck+1
  clusters[ck] = {ID}       -- current cluster e contains exactly one location (--> table with one entry only)
  clusterKeys[ck] = ck      -- collect all cluster keys: one cluster per cluster key
  table.insert(allLocations, ID)
end

project.clusters = (clusters)
-- project.clusters = ({e1={'A'}, e2={'B'}, e3={'C'}})
project:loadClusters(project.clusters)

for ID,data in pairs(buildingData) do
  project:load(
    {['building'..ID] = "TestAMI/AMI_ET", locations = {ID}, withData = {[ID]=data}, with = 'MPTdata/' .. ID .. '.csv'}
--            {['building'..ID] = "_examples/AMI_ET", locations = {buildingData[ID]['location']}, withData = {[ID]=data}, with = 'MPTdata/' .. ID .. '.csv'}
   )
end

project:periode(1):time(3)
--project:periode(2):time(2)

local oneRun = osmose.Eiampl(project)

osmose.Glpk(oneRun)--, {clusters = clusterKeys})

-- osmose.Graph(oneRun)

osmose.PostPrint(oneRun)
