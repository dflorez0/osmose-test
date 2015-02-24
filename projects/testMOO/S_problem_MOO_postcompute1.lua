function S_problem_MOO_postcompute1(args)
	local results = getResults()

	local f1 = results.impact[1] or 10000
	local f2 = results.opcost[1] or 10000

	return {f1,f2}
end

