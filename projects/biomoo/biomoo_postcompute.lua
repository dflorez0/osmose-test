function biomoo_postcompute(project)
	-- operating costing
	local opcost = project.results.Costs_Cost.DefaultOpCost[1]
	print("OPERATING COST :",opcost)

	-- investment cost
	local alpha = 0.77 
	local cinv = {}
	for i, unit in ipairs(project.units[1]) do 
	  table.insert(cinv, {unit_name = unit.name, value = (unit.Units_Cost.DefaultInvCost*(1/(unit.Units_Mult_t[1]+0.00001)))*(unit.Units_Mult_t[1]^alpha)})
	end
	local tot_ic = 0
	for id,cont in ipairs(cinv) do
	  tot_ic = tot_ic + cont.value
	end
	print("INVESTMENT COST :",tot_ic)

	-- total cost
	local total_op_cost = opcost + 0.06*tot_ic
	print("OPERATING COST + MAINTAINANCE + LABOR: ", total_op_cost)

	-- return the objectives functions
	return {total_op_cost, 1/(total_op_cost+0.0001)}
end