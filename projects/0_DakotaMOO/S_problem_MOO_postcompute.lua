function S_problem_MOO_postcompute(project)
  
  if project.solved == false then
    return {'10e9','10e9'}
  end
  
  print('POST COMPUTE:')
	print(project:getTag('timeValue'))

	local f1 = project.results.Costs_Cost.DefaultImpact[1] 
	local f2 = project.results.Costs_Cost.DefaultOpCost[1] 

	return {f1,f2}
end

