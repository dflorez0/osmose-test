local osmose = require 'osmose'
local et = osmose.Model 'DHN_C3_C5'

----------
-- User parameters
----------

et.inputs = {
    PMAX = {default=50, unit='MW'},  -- Maximum heat transfer of district heating
    INV_COST_FIX = {default=3000000, unit='CHF'}, -- Fixed investment cost
    INV_COST_VAR = {default=50000, unit='CHF/MW'}, -- Variable investment cost
}

-----------
-- Calculated parameters
-----------

et.outputs = {

}

-----------
-- Layers
-----------

et:addLayers {Heat = {type= 'MassBalance', unit = 'MW'} }
et:addLayers {DHN_C3_C5_out = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C3_C5_in = {type= 'ResourceBalance', unit = 'MW'} }

-----------
-- Units
-----------

-- DHN export out of cluster
et:addUnit('DHN_Export',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Impact1=0,Impact2=0})
et['DHN_Export']:addStreams{
    -- Thermal streams
    heat_in = ms({'Heat', 'in', 'PMAX'}),
    -- Heat transfer from one location to another
    cluster_out = rs({'DHN_C3_C5_out', 'out', 'PMAX'})
}

-- DHN import in cluster
et:addUnit('DHN_Import',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Impact1=0,Impact2=0})
et['DHN_Import']:addStreams{
    -- Thermal streams
    heat_out = ms({'Heat', 'out', 'PMAX'}),
    -- Heat transfer from one location to anothernother
    cluster_in = rs({'DHN_C3_C5_in', 'in', 'PMAX'})
}

return et