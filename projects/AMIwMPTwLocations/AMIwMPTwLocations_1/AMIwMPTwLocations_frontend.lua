--- Automatic Model Instantiation (AMI)
-- Frontend template
-- @author Nils Schueler 
-- @release 06.11.2014
-- @adapted Alex Bertrand, 24.04.2015 to include generic list of clusters and locations: 1 cluster = 1 location = 1EGID

local lfs = require('lfs')

local osmose = require 'lib.osmose'

local project = osmose.Project('AMIwMPTwLocations', 'OperatingCost')

-- operationalCosts to be used only when objective is YearlyOperatingCost
project.operationalCosts = 'MPTdata/op_costs.ods'

local buildingDataHeader = {
   dataID = 'EGID', 
   attributes = {
      'design_demand',
      'supply_temp_heat',
      'return_temp_heat',
      'design_demand_hw',
      'supply_temp_heat_hw',
      'return_temp_heat_hw',
   }
}


--[[Defining the locations (locationz) of the specific sites (EGID)]]--
local buildingData = project:loadData({dataPath = 'AMIwMPTwLocations_data.csv', dataHeader = buildingDataHeader})

-- [[Automatic generation of location and cluster lists]]--
local locations_tbl={} -- this is a table with the list of locations
local cluster_tbl={}  -- this is a table with the list of clusters
local e=0
for k,v in pairs(buildingData) do
  e=e+1
  locations_tbl[e]={k}
  for k,v in pairs(locations_tbl) do
    cluster_tbl[e]=k
  end
end


--[[Attribution of the locations to clusters e1, e2, e3]]--
project.clusters = (locations_tbl)
project:loadClusters(project.clusters)

--[[Setting up of processes and streams]]--
for ID,data in pairs(buildingData) do
  project:load  ({['building_'..ID] = "_examples/AMI_ET", locations = {ID}, with = 'MPTdata/' .. ID .. '.csv', withData = {[ID]=data} })
end

project:periode(1):time(3)
project:solve({graph=false, clusters=(cluster_tbl)})


