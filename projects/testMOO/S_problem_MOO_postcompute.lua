--[[------------------------------------------------------

  # S_problem_MOO_postcompute
  PostCompute function for dakota multi-objective test case

  10.08.2014

  @author: Samira Fazlollahi (samira.fazlollahi@a3.epfl.ch)

  @copyright IPESE

--]]------------------------------------------------------


function S_problem_MOO_postcompute(args)
	local results = getResults()
 
	local f1 = results.impact[1]
	local f2 = results.opcost[1]
  
	return {f1,f2}
end

