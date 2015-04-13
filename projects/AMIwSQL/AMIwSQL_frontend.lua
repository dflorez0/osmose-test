--- Automatic Model Instantiation (AMI)
-- Frontend template
-- @author Nils Schueler 
-- @release 06.11.2014

local lfs = require('lfs')

local osmose = require 'lib.osmose'

local project = osmose.Project('AMIwSQL', 'YearlyOperatingCost')

-- operationalCosts to be used only when objective is YearlyOperatingCost
project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time= 2000.0}
-- project.operationalCosts = 'data/op_costs.ods'

-- ##############################################
-- ############### LOAD DATA ####################
-- ##############################################
--local buildingDataHeader = {
--   dataID = 'EGID', 
--   attributes = {
--      'design_demand',
--      'supply_temp_heat',
--      'return_temp_heat',
--   }
--}

-- specify which data to load (first specified column title will be used as id)
local dataColumns = [[
   egid,
   hauteur,
   niveaux_ho,
   niveaux_ss
--    egid,
--    design_demand,
--    supply_temp_heat,
--    return_temp_heat,
]]

local conditions =  [[
   facade_surface_totale <> 0
   AND aver_irrad IS NOT NULL
]]

-- ##############################################
-- ############### LOAD MODEL ###################
-- ##############################################

local buildingData = project:loadData({dbName = 'geneva', dbUser = 'nsc', dbTable = 'usr_nsc_energy_cadaster', dataHeader = dataColumns , conditions = conditions})

for k,v in pairs(buildingData) do
  print(k)
  for k,v in pairs(v) do
    print(k,v)
  end
end

project:loadClusters(project.clusters)

--project:load(
--	{building = "_examples/AMI_ET", withData = buildingData}  --, with = 'data/MultiTime_test.csv'}
--)
for ID,data in pairs(buildingData) do
   project:load(
           {building = "_examples/AMI_ET", withData = {[ID]=data}}  --, with = 'MPTdata/' .. ID .. '.csv'}
   )
end

project:periode(1):time(1)
--project:periode(2):time(2)

-- local oneRun = osmose.Eiampl(project)

-- osmose.Glpk(oneRun)

-- osmose.Graph(oneRun)
-- osmose.Graph(oneRun, 'png')

project:solve({graph=false, clusters={'e1','e2'}} )