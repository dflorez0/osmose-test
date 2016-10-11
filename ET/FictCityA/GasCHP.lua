local osmose = require 'osmose'
local et = osmose.Model 'GasCHP'

----------
-- User parameters
----------

et.inputs = {
    QMAXTOT = {default=20, unit='MW_th'},  -- max size
    QMINTOT = {default=0, unit='MW_th'},  -- min size
    EFF_TH = {default=0.45, unit='-'}, -- thermal effeciency
    EFF_EL = {default=0.35, unit='-'}, -- electrical effeciency
    INV_COST_FIX = {default=350000, unit='CHF'}, -- Fixed investment cost
    INV_COST_VAR = {default=500000, unit='CHF/MW'}, -- Variable investment cost
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    GAS_IN_MAX = {unit='MW',job='QMAXTOT/EFF_TH'}, -- Gas consumption
    EL_OUT_MAX = {unit='MW',job='GAS_IN_MAX()*EFF_EL'}, -- Electricity production
    CINV1 = {unit='CHF',job='INV_COST_FIX/4'},
    CINV2 = {unit='CHF',job='INV_COST_VAR*QMAXTOT/4'}
}

-----------
-- Layers
-----------

et:addLayers {Gas = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {Heat = {type= 'MassBalance', unit = 'MW'} }
et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'MW'} }

-----------
-- Units
-----------

-- CHP
et:addUnit('GasCHP',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1='CINV1', Cinv2='CINV2', Impact1=0,Impact2=0})
et['GasCHP']:addStreams{
    -- Thermal streams
    heat_out = ms({'Heat', 'out', 'QMAXTOT'}),
    -- Gas consumption
    gas_in = rs({'Gas', 'in', 'GAS_IN_MAX'}),
    -- Electricity production
    elec_out = rs({'Electricity', 'out', 'EL_OUT_MAX'})
}

return et