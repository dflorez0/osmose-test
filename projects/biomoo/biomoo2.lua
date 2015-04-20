--[[------------------------------------------------------

  # Biorefinery frontend

  --]]------------------------------------------------------

-- Set followings values in config.lua before running :
--
-- OSMOSE_ENV["LUA_EXE"] = path to lua executable 
-- OSMOSE_ENV["MOO_PATH"] = path to moo folder
-- OSMOSE_ENV["MATLAB_EXE"] = path to matlab executable

local osmose = require 'lib.osmose'

local project = osmose.Project('biomoo', 'OperatingCost')   
   
   --MER ;InvestmentCost; OperatingCost; MechanicalPower; Impact ;TotalCost; OpCostWithImpact; TotalCostWithPower;TotalCostWithImpact;TotalCostWithImpactAndPower;YearlyOperatingCost
 
project.clusters = { e1={'loc1'}}  --,e2={'loc2'}

project:load( 
  
  
{resources_biorefinery = "bio.resources", locations={'loc1'}, with = 'biomoo.csv'}, --, 'loc2''loc1',,'loc3'
  --{cfb_o2_wood_meoh = "bio.cfb_o2_wood_meoh", locations={'loc1'}},
   {cane_sugar_juice = "bio.cane_sugar_mill", locations={ 'loc1'}},
   {bioethanol_93 = "bio.bioethanol_93", locations={ 'loc1'}},
   {cfb_o2_bagasse_meoh = "bio.cfb_o2_bagasse_meoh", locations={'loc1'}},
  --[[
  --{enzymatic_se = "bio.seenzymatic"<, locations={ 'loc1'}},
  {dryer = "bio.dryer_85", locations={ 'loc1'} },
  {se_osenzy = "bio.se_osenzy", locations={ 'loc1'}},
  {evap_2_20 = "bio.evap_2_20", locations={ 'loc1'}},
  {bioethanol_99 = "bio.bioethanol_99", locations={ 'loc1'}},
  {biogas_vinasse = "bio.biogas_vinasse", locations={ 'loc1'}},
  {biogas_xylose = "bio.biogas_xylose", locations={ 'loc1'}},
  {vanillin = "bio.vanillin", locations={ 'loc1'}},
  {xylitol = "bio.xylitol", locations={ 'loc1'}},
  --{evap_2_10 = "bio.evap_2_10", locations={ 'loc1'}},
  --{evap_2_06 = "bio.evap_2_06", locations={ 'loc1'}},
  --{bioethanol_95 = "bio.bioethanol_95", locations={ 'loc1'}},
  --{ethylene = "bio.ethylene", locations={ 'loc1'}},
  --{acetic_acid = "bio.acetic_acid", locations={ 'loc1'}},
  --{lactic_acid = "bio.lactic_acid", locations={ 'loc1'}},
  --{n_butanol = "bio.n_butanol", locations={ 'loc1'}},
  --{succinic_acid = "bio.succinic_acid", locations={ 'loc1'}},
  {biogas52_boiler = "bio.biogas52_boiler", locations={ 'loc1'}},
  {biogas31_boiler = "bio.biogas31_boiler", locations={ 'loc1'}},
  --{biomass_boiler = "bio.biomass_boiler", locations={ 'loc1'}},
    ]]--
   
  {ng_boiler = "bio.ng_boiler", locations={ 'loc1'}},--'loc1',,'loc3'
  {utilities = "bio.generic_utilities", locations={'loc1'}, with = 'biomoo.csv'},--'loc1',,'loc3'
  {services = "bio.services", locations={'loc1'}, with = 'biomoo.csv'}--'loc1',,'loc3'
  --{steam_network = "bio.SteamNetwork_ET", locations={'loc1'}, with = 'biorefinery.csv'},
   
   )
	
project:periode(1):time(1)


project:optimize {
  software='MOO',
  postcompute='biomoo_postcompute.lua',
  objectives_size=2,
  variables={sc_price={lower_bound='0.03', upper_bound='0.1'},
             co2tax={lower_bound='0.005', upper_bound='0.1'}},
  method={max_iterations      = 100,
          initial_population  = 10,
          },
  monitor={moo_restart_monitor  = 3,
          moo_count_monitor     = 30,
          moo_speed_monitor     = 30,
          moo_objective_monitor = 30,
          moo_stop_monitor      = 30,
          }
  }

print(project.results.opcost[1])
print(project.results.impact[1])
