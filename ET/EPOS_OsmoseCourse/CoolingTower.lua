local osmose = require 'osmose'
local et = osmose.Model 'CoolingTower'

----------
-- User parameters
----------

et.inputs = {
    -- Heat
    COOL_TIN = {default=5, unit='°C'},
    COOL_TOUT = {default=10, unit='°C'},
    COOL_QMAX = {default=20000, unit='kW'},
    -- Electricity consumption
    COOL_ELEC = {default=0.02, unit='kWh_el/kWh_th' },
    -- Operating cost
    OP_COST = {default=0, unit='CHF/kWh' },
    -- Capital costs
    INV_FIX = {default=20000, unit='CHF' },
    INV_VAR = {default=400, unit='CHF/kW' },
    AF = {default=0.08, unit='-' },
    -- Other
    OP_TIME = {default=8760, unit='h'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    -- Electricity consumption
    EMAX = {unit='kW',job='COOL_ELEC*COOL_QMAX' },
    -- Operating cost
    COST2 = {unit='CHF',job='COOL_QMAX*OP_COST*OP_TIME'},
    -- Investement cost
    INV_FIX_AN = {unit='CHF/yr',job='INV_FIX*AF'},
    INV_VAR_AN = {unit='CHF/kW/yr',job='INV_VAR*AF*COOL_QMAX'}
}

-----------
-- Layers
-----------

et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }

-----------
-- Units
-----------

et:addUnit('CoolingTower',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2='COST2', Cinv1='INV_FIX_AN', Cinv2='INV_VAR_AN', Power1=0, Power2=0, Impact1=0,Impact2=0})
et['CoolingTower']:addStreams{
    -- Heat
    qt = qt({tin = 'COOL_TIN', hin = 0, tout='COOL_TOUT', hout='COOL_QMAX', dtmin=0}),
    -- Electricity consumption
    elec_in = rs({'Electricity', 'in', 'EMAX'})
}

return et