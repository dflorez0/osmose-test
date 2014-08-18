function jam_precompute(args)
	local value = 85 +( args['x1']*2)
	setTag('cip.return_temp',value )
	solve()
end