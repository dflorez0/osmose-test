--[[------------------------------------------------------

  # Biorefinery frontend

  --]]------------------------------------------------------


--require ("mobdebug").start()
--os.execute ('C:\\ampl\\ampl.lic')
  
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
--osmose.Glpk(oneRun)
--osmose.Ampl_new(oneRun)  -- cplexampl.exe MUST BE installed in c:\ because of function "generateRunFile" in Ampl_new.lua 

-- operationalCosts to be used only when objective is YearlyOperatingCost
--project.operationalCosts={cost_elec_in=2, cost_elec_out=5, op_time=8600}

--local oneRun = osmose.Eiampl(project)

project:listen()

os.exit()

project:solve({clusters={'e1'},  graph = false, postprint=false} ) --,'e2'{clusters={'e1'}, {graph = {format='svg'} , graph = false}

--osmose.Graph (oneRun)
--osmose.PostPrint(oneRun)
local Post_Compute_Biorefinery = require 'projects.biomoo.Post_Compute_Biorefinery'
Post_Compute_Biorefinery(project)

project:compute('biomoo_postcompute.lua')





