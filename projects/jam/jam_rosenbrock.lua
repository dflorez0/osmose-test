function jam_rosenbrock(args)

	local value = getTag('raw_water_flow') + 2

	assert(getUnit('CipUnit'))

	assert(getStream('cleaning_agent'))

	local opcost = getResults().opcost[1] * 2


	local x= args['x1']
	local y= args['x2']

	local f1 = (1-x)^2
	local f2 = 100*(y-x^2)^2

	return f1+f2
end