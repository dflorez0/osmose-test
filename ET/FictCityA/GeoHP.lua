local osmose = require 'osmose'
local et = osmose.Model 'GeoHP'

----------
-- User parameters
----------

et.inputs = {
    QMAXCOND = {default=15, unit='MW_th'},  -- Condensor maximum size
    QMINCOND = {default=0, unit='MW_th'},  -- Condensor minimum size
    COP_HP = {default=4.5, unit='-'}, -- COP of heat pump
    INV_COST_FIX = {default=1500000, unit='CHF'}, -- Fixed investment cost
    INV_COST_VAR = {default=500000, unit='CHF/MW'} -- Variable investment cost
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    EL_MAX = {unit='MW',job='QMAXCOND/COP_HP'},  -- Electricity consumption
    CINV1 = {unit='CHF',job='INV_COST_FIX/4'},
    CINV2 = {unit='CHF',job='INV_COST_VAR*QMAXCOND/4'}
}

-----------
-- Layers
-----------

et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {Heat = {type= 'MassBalance', unit = 'MW'} }

-----------
-- Units
-----------

-- Geothermal well + Heat pump
et:addUnit('HP',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1='CINV1', Cinv2='CINV2', Impact1=0,Impact2=0})
et['HP']:addStreams{
    -- Thermal streams
    heat_out = ms({'Heat', 'out', 'QMAXCOND'}),
    -- Electricity consumption
    elec_in = rs({'Electricity', 'in', 'EL_MAX'})
}

return et