--Example of frontend with all the options so far

local osmose = require 'lib.osmose'

local project = osmose.Project('meoh', 'opex')

project.operationalCost = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time=8000.0}

----------------------------------------------------------------
--------------------------- OPTIONS ----------------------------
project.options                = {graph = {format = 'jpg', spaghetti = false}}
project.options.doLCA          = false
project.options.mathProg       = {language = 'glpk', name = 'glpsol', options = {'--mipgap 0.001'}} --
--PFE3.options.mathProg       = {language = 'ampl'}
project.options.equipmentcost  = {InterestRate = 0.08, LifeTime = 25, Index = 'MS', Year = 2015}
----------------------------------------------------------------
----------------------------------------------------------------

project:load ({meoh = "Test-EquipmentCost.meoh"})


project:periode(1):time(1)
project:solve()
project:compute('MeOH_postcompute.lua')