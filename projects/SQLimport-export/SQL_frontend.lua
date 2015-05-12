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

-- specify which data to load (first specified column title will be used as first key for the luatable i.e. it should be the primary key of the sql table)
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
--   passwd = 'yourpassword',                -- has to be provided if localhost and port number are provided
  dbTable = 'table_to_read', 
--   dbHost = 'localhost',                   -- default is localhost (db is running on your machine)
--   dbPort = 5432,                          -- enter your port number here (default is 5432)
  dataHeader = dataColumns, 
  conditions = your_conditions,
--   sortColumns = true,                        -- if this flag is set to true the column titles will be the first lua table key and the primary key will be the second (required e.g. for R)

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

-- the luatable has to be of format
-- "value = luatable[ID][columnA]" or
-- "value = luatable[ID]" (still the desired column name has to be passed: columns = {'columnA'},
project:writeData({luatable = loadedData, 
  dbName = 'yourdb', 
  dbUser = 'yourusername', 
--   passwd = 'yourpassword',                -- has to be provided if localhost and port number are provided
  dbTable = 'table_to_read', 
--   dbHost = 'localhost',                   -- default is localhost (db is running on your machine)
--   dbPort = 5432,                          -- enter your port number here (default is 5432)
  rowID = 'ID', 
  columns = {'columnA', 'columnB'},
})