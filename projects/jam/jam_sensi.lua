--[[------------------------------------------------------

  # jam MER

  This is an example of a jam factory with MER.

--]]------------------------------------------------------


local osmose = require 'lib.osmose'

local project = osmose.Project('LuaJam', 'MER')

project:load(
	{cip = "ET.Cip"},
  {utilities = "ET.generic_utilities"},
	{cm1 = "ET.CookingMixing"},
	{cm2 = "ET.CookingMixing", with = {'prod_1_flow.csv'}}
)
-- operationalCosts to be used only when objective is YearlyOperatingCost

project:solve({graph=false, postprint=false})

-- Return mult_t for each periode
for p=1,15 do 
	print( p, project:getTag('cm2.prod_1_flow',p), project:getUnit('DHCU_h',p).mult_t[1])
end


