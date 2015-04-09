function biomoo_postcompute2(project)
	print('POST COMPUTE IS CALLED')
	local x1, x2  = project:getTag('sc_price'), project:getTag('co2tax')

	print('X1:',x1)
	print('X2:',x2)

	local f1,f2 = (1-x1)^2, 100*(x2-x1^2)^2

	return {f1,f2}
end