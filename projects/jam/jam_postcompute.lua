function jam_postcompute(project)
	print(project:getTag('return_temp'))
	project:setTag('return_temp',50)

	local unit = project:getUnit('CipUnit')
	print(unit.name)

	local stream = project:getStream('fresh_water')
	print(stream.name)
end
