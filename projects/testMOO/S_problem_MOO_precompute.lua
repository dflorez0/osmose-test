--[[------------------------------------------------------

  #S_problem_MOO_precompute
  PreCompute function for dakota multi-objective test case

  10.08.2014

  @author: Samira Fazlollahi (samira.fazlollahi@a3.epfl.ch)

  @copyright IPESE

--]]------------------------------------------------------

function S_problem_MOO_precompute(args)
	local value1 = ( args['x1']*14)
	setTag('FmaxHotUtility1',value1)
  local value2 = ( args['x2']*14)
	setTag('FmaxHotUtility2',value2)
  
	solve()
end