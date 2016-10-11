local osmose = require 'osmose'
local et = osmose.Model 'GasBoiler'

----------
-- User parameters
----------

et.inputs = {
    -- Heat supply
    TIN = {default=220, unit='�C'},
    TOUT = {default=180, unit='�C'},
    QMAX = {default=20000, unit='kW'},
    -- Efficiency
    EFF = {default=0.9, unit='-' },
    -- Capital costs
    INV_FIX = {default=50000, unit='CHF' },
    INV_VAR = {default=100, unit='CHF/kW' },
    AF = {default=0.08, unit='-' }
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    -- Fuel consumption
    GAS_IN_MAX = {unit='kW',job='QMAX/EFF'},
    -- Investment costs
    INV_FIX_AN = {unit='CHF/yr',job='INV_FIX*AF'},
    INV_VAR_AN = {unit='CHF/kW/yr',job='INV_VAR*AF*QMAX'}
}

-----------
-- Layers
-----------

et:addLayers {Gas = {type= 'ResourceBalance', unit = 'kW'} }

-----------
-- Units
-----------

et:addUnit('GasBoiler',{type='Utility', Fmin = 0, Fmax = 1, Cinv1='INV_FIX_AN', Cinv2='INV_VAR_AN'})
et['GasBoiler']:addStreams{
    -- Output heat
    qt_hot = qt({tin = 'TIN', hin = 'QMAX', tout='TOUT', hout=0, dtmin=0}),
    -- Fuel consumption
    gas_in = rs({'Gas', 'in', 'GAS_IN_MAX'})
}

return et