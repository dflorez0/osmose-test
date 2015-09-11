-- test of compute file for dakota MOO, (MK) 2015-09-07
function S_problem_MOO_compute(args)
  
	local value1 = ( args['x1']*14)
	setTag('FmaxHotUtility1',value1)
  local value2 = ( args['x2']*14)
	setTag('FmaxHotUtility2',value2)
  
  solve() -- {graph = {format = 'svg'}} {graph = {format = 'jpg', spaghetti = true},doLCA =false}

  local obj = compute("S_problem_MOO_postcompute.lua")

  return obj
end