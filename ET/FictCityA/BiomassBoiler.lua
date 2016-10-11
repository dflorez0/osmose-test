local osmose = require 'osmose'
local et = osmose.Model 'BiomassBoiler'

----------
-- User parameters
----------

et.inputs = {
    QMAXTOT = {default=20, unit='MW_th'},  -- Boiler max size
    QMINTOT = {default=0, unit='MW_th'},  -- Boiler min size
    EFF_TH = {default=0.85, unit='-'}, -- Boiler thermal effeciency
    INV_COST_FIX = {default=200000, unit='CHF'}, -- Fixed investment cost
    INV_COST_VAR = {default=800000, unit='CHF/MW'}, -- Variable investment cost
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    BM_IN_MAX = {unit='MW',job='QMAXTOT/EFF_TH'}, -- Biomass consumption
    CINV1 = {unit='CHF',job='INV_COST_FIX/4'},
    CINV2 = {unit='CHF',job='INV_COST_VAR*QMAXTOT/4'}
}

-----------
-- Layers
-----------

et:addLayers {Biomass = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {Heat = {type= 'MassBalance', unit = 'MW'} }

-----------
-- Units
-----------

-- Boiler
et:addUnit('BiomassBoiler',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1='CINV1', Cinv2='CINV2', Impact1=0,Impact2=0})
et['BiomassBoiler']:addStreams{
    -- Thermal streams
    heat_out = ms({'Heat', 'out', 'QMAXTOT'}),
    -- Biomass consumption
    bm_in = rs({'Biomass', 'in', 'BM_IN_MAX'})
}

return et