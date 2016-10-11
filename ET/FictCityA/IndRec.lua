local osmose = require 'osmose'
local et = osmose.Model 'IndRec'

----------
-- User parameters
----------

et.inputs = {
    HEAT_AVAIL = {default=20, unit='MW_th'},  -- max size
    OP_COST_VAR = {default=-50, unit='CHF/MWh'}, -- Variable operating cost is negative because of savings due to not using the aero
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    COST2 = {unit='CHF',job='OP_COST_VAR*HEAT_AVAIL'}
}

-----------
-- Layers
-----------

et:addLayers {IndWasteHeat = {type= 'MassBalance', unit = 'MW'} }

-----------
-- Units
-----------

-- Industrial heat waste recovery
et:addUnit('IndRec',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2='COST2', Cinv1=0, Cinv2=0, Impact1=0,Impact2=0})
et['IndRec']:addStreams{
    -- Thermal streams
    heat_out = ms({'IndWasteHeat', 'out', 'HEAT_AVAIL'})
}

return et