local osmose = require 'osmose'
local et = osmose.Model 'GasEngine'

----------
-- User parameters
----------

et.inputs = {
    -- Heat supply
    TIN = {default=220, unit='°C'},
    TOUT = {default=180, unit='°C'},
    QMAX = {default=5000, unit='kW'},
    -- Efficiency
    EFF_TH = {default=0.5, unit='-'},
    EFF_EL = {default=0.35, unit='-'},
    -- Operating cost
    OP_COST = {default=0, unit='CHF/kWh' },
    -- Capital costs
    INV_FIX = {default=100000, unit='CHF' },
    INV_VAR = {default=250, unit='CHF/kW' },
    AF = {default=0.08, unit='-' },
    -- Other
    OP_TIME = {default=8760, unit='h'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    -- Fuel consumption
    GAS_IN_MAX = {unit='kW',job='QMAX/EFF_TH' },
    -- Electricity production
    E_OUT_MAX = {unit='kW',job='QMAX*EFF_EL/EFF_TH' },
    -- Operating cost
    COST2 = {unit='CHF',job='QMAX*OP_COST*OP_TIME' },
    -- Investement costName
    INV_FIX_AN = {unit='CHF/yr',job='INV_FIX*AF'},
    INV_VAR_AN = {unit='CHF/kW/yr',job='INV_VAR*AF*QMAX'}
}

-----------
-- Layers
-----------

et:addLayers {Gas = {type= 'ResourceBalance', unit = 'kW'} }
et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }

-----------
-- Units
-----------

et:addUnit('CHP',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2='COST2', Cinv1='INV_FIX_AN', Cinv2='INV_VAR_AN', Power1=0, Power2=0, Impact1=0,Impact2=0})
et['CHP']:addStreams{
    -- Output heat
    qt_hot = qt({tin = 'TIN', hin = 'QMAX', tout='TOUT', hout=0, dtmin=0}),
    -- Fuel consumption
    gas_in = rs({'Gas', 'in', 'GAS_IN_MAX'}),
    -- Electricity
    elec_out = rs({'Electricity', 'out', 'E_OUT_MAX'})
}

return et