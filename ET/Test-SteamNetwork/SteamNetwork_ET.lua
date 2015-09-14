#!/usr/bin/lua
--[[------------------------------------------------------

  # Steam Network 
  # Energy technologies for advanced energy systems design and optimization using object-oriented programming language LUA 5.1
  # Authors: Lord M. Kermani, Princess A.S. Wallerand
  # Date: December, 2014

--]]------------------------------------------------------

local osmose = require 'lib.osmose'

-- ////////////////////////////////////////////////////////////////////////
-- Define SteamNetwork Unit
-- ------------------------------------------------------------------------

lib = SteamNetwork(
				{Pressures 		= {65,22,6}, -- [bar]
				isTurbine 		= {1,0,0},-- {0,1}
				SuperheatDT 	= {150,1,1},-- [K]
				SubcoolDT 		= -5,			-- [K]
				DT 				= {5,2,2,2},-- [K]
				Eff_backpr_turb = 0.8,			-- [-]
				Eff_cond_turb 	= 0.8,			-- [-]
				Eff_pump 		= 0.95, 		-- [-]
				Fluid			= 'water',		-- [-]
				Location		= {}	,		-- [-]
				cost_elec_in 	= 17.19, 		-- [Euro/GJ] or [CHF/GJ]
				cost_elec_out 	= 16.9,			-- [Euro/GJ] or [CHF/GJ]
				LayerOfElec 	= 'electricity' -- Use your own electricity layer, or leave empty {}
			})

return lib

