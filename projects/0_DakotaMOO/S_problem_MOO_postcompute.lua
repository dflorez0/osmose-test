function S_problem_MOO_postcompute(project)
  print('POST COMPUTE:')
	print(project:getTag('timeValue'))

	local f1 = project.results.impact[1] or 10000
	local f2 = project.results.opcost[1] or 10000

	return {f1,f2}
end

