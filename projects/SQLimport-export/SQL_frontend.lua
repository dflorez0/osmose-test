--- Automatic Model Instantiation (AMI)
-- Frontend template
-- @author Nils Schueler 
-- @release 06.11.2014

local lfs = require('lfs')

local osmose = require 'lib.osmose'

local project = osmose.Project('SQLimport-export', 'YearlyOperatingCost')

-- operationalCosts to be used only when objective is YearlyOperatingCost
project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time= 2000.0}

-- ##############################################
-- ############### LOAD DATA ####################
-- ##############################################

-- specify which data to load (first specified column title will be used as id)
local dataColumns = [[
   ID,
   columnA,
   columnB,
   columnC
]]

local your_conditions =  [[
    columnA = 'valueA' 
    OR columnB = 2
    AND columnC IS NOT NULL
]]

-- ##############################################
-- ############### LOAD MODEL ###################
-- ##############################################

local loadedData = project:loadData({
  dbName = 'yourdb', 
  dbUser = 'yourusername', 
  dbTable = 'table_to_read', 
  dataHeader = dataColumns , 
  conditions = your_conditions,
--   sortColumns = true,
})

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

project:writeData({luatable = loadedData, 
  dbName = 'yourdb', 
  dbUser = 'yourusername', 
  dbTable = 'table_to_write', 
  rowID = 'ID', 
  columns = {'columnA', 'columnB'},
})