local osmose = require 'lib.osmose'
local testProject = osmose.Project ('location_test', 'OperatingCost')
testProject.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time=8000.0}
--marioProject.operationalCosts = 'data/default_op_costs.csv'

testProject.clusters = {e1={'loc1'},e2={'loc2'}}

testProject:load (
   {district1 = "ET.ex_district", locations={'loc1'}, with='location_test_district_D1.csv'},
   {boiler1 = "ET.ex_gasBoiler", locations={'loc1'}, with='location_test_gasboiler_T1.csv'},
   {district2 = "ET.ex_district", locations={'loc2'}, with='location_test_district_D1.csv'},
   {boiler2 = "ET.ex_gasBoiler", locations={'loc2'}, with='location_test_gasboiler_T1.csv'}
   )

--marioProject:periode(1):time(3)

--local oneRun = osmose.Eiampl(marioProject)
--osmose.Glpk (oneRun)
--osmose.Graph (oneRun)

testProject:solve({clusters={'e1','e2'}})