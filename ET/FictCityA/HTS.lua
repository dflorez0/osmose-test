local osmose = require 'osmose'
local et = osmose.Model 'HTS'

----------
-- User parameters
----------

et.inputs = {
    QMAXTOT = {default=20, unit='MW_th'},  -- max size
    QMINTOT = {default=0, unit='MW_th'},  -- min size
    INV_COST_FIX = {default=500000, unit='CHF'}, -- Fixed investment cost
    INV_COST_VAR = {default=100000, unit='CHF/MW'}, -- Variable investment cost
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    CINV1 = {unit='CHF',job='INV_COST_FIX/4'},
    CINV2 = {unit='CHF',job='INV_COST_VAR*QMAXTOT/4'}
}

-----------
-- Layers
-----------

et:addLayers {Heat = {type= 'MassBalance', unit = 'MW'} }
et:addLayers {IndWasteHeat = {type= 'MassBalance', unit = 'MW'} }

-----------
-- Units
-----------

-- Industrial heat waste recovery
et:addUnit('HTS',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1='CINV1', Cinv2='CINV2', Impact1=0,Impact2=0})
et['HTS']:addStreams{
    -- Thermal streams
    heat_out = ms({'Heat', 'out', 'QMAXTOT'}),
    heat_in = ms({'IndWasteHeat', 'in', 'QMAXTOT'})
}

return et