--- Urban Multi-Scale Optimization (UMSO)
-- frontend
-- @author Nils Schueler 
-- @release 11.05.2015

local lfs = require('lfs')

local osmose = require 'lib.osmose'

local project = osmose.Project('monitorCompTime', 'OperatingCost')

-- ##############################################
-- ############### LOAD DATA ####################
-- ##############################################
local startTime_loadData = os.clock()


-- specify which data to load (first specified column title will be used as first key for the luatable i.e. it should be the primary key of the sql table)
-- local buildingDataColumns = [[
--       egid, 
--       annual_heat_demand_estimated,
-- ]]

-- local buildingDataConditions =  [[
--     annual_heat_demand_estimated IS NOT NULL
-- ]]

-- local buildingData = project:loadData({
--   dbName = 'geneva', 
--   dbUser = 'user', 
--   dbPasswd = 'empty',                -- has to be provided if localhost and port number are provided
--   dbTable = 'user.energy_cadaster', 
--   dbHost = 'scistifmsrv2.epfl.ch',                   -- default is localhost (db is running on your machine)
--   dbPort = 15432,                          -- enter your port number here (default is 5432)
--   dataHeader = buildingDataColumns, 
--   conditions = buildingDataConditions,
--   sortColumns = true,                        -- if this flag is set to true the column titles will be the first lua table key and the primary key will be the second (required e.g. for R)
-- })



-- ##############################################
-- ############### LOAD MODELS ##################
-- ##############################################
local startTime_loadModels = os.clock()


project:load(
	{cip = "ET.Cip"},
  {utilities = "ET.generic_utilities"},
	{cm1 = "ET.CookingMixing"}
)


-- ##############################################
-- ############# SETUP PROBLEM ##################
-- ##############################################

-- operationalCosts to be used only when objective is YearlyOperatingCost
-- project.operationalCosts = {cost_elec_in = 0.2076, cost_elec_out = 0.0944, op_time= 2000.0}  --CHF/kWh (Canton of Geneva 2015, https://www.strompreis.elcom.admin.ch/Map/ShowSwissMap.aspx)

-- project:periode(1):time(1)


-- ##############################################
-- ########## PARSE & SOLVE MODEL ###############
-- ##############################################

local startTime_parse = os.clock()
project:eiampl()

local startTime_solve = os.clock()
project:glpk()--, {clusters = clusterKeys})


-- ##############################################
-- ############### WRITE DATA ###################
-- ##############################################
local startTime_writeData = os.clock()

-- ...

-- ##############################################
-- ######### GRAPHIC & PROMPT OUTPUT  ###########
-- ##############################################

-- osmose.Graph(project)
osmose.PostPrint(project)
local totalTime = os.clock()

print('COMPUTATION TIME')
print(string.format('osmose setup:\t %f', startTime_loadData))
print(string.format('load data:\t %f', startTime_loadModels - startTime_loadData))
print(string.format('load models:\t %f', startTime_parse - startTime_loadModels))
print(string.format('parse model:\t %f', startTime_solve - startTime_parse))
print(string.format('solve model:\t %f', startTime_writeData - startTime_solve))
print(string.format('write data:\t %f', totalTime - startTime_writeData))
print("_________________________")
print(string.format('total time:\t %f', totalTime))
print("------------------------------------------------------------")
print("finished run " .. project.run)
