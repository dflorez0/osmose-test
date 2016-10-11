local osmose = require 'osmose'
local et = osmose.Model 'CO2Purification'

----------
-- User parameters
----------

et.inputs = {
    -- Heat demand
    TIN = {default=30, unit='°C'},
    TOUT = {default=70, unit='°C'},
    QMAX = {default=400, unit='kW'},
    -- Electricity demand
    EMAX = {default=300, unit='kW'},
    -- Inlet and outlet mass flows
    CO2_LQ_IN_MAX = {default=3, unit='kg/s'},
    CO2_HQ_OUT_MAX = {default=2.5, unit='kg/s'},
    CO2_WST_MAX = {default=0.5, unit='kg/s' },
    -- Operating cost
    CO2_PURIF_COST = {default=0, unit='CHF/kg' },
    -- Capital costs
    INV_FIX = {default=2500000, unit='CHF' },
    INV_VAR = {default=1000000, unit='CHF/(kg/s)' },
    AF = {default=0.08, unit='-' },
    -- Other
    OP_TIME = {default=8760, unit='h'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    OP_TIME_SEC = {unit='s',job='OP_TIME*3600'},
    -- Operating cost
    COST2 = {unit='CHF',job='CO2_LQ_IN_MAX*CO2_PURIF_COST*OP_TIME_SEC()' },
    -- Investement cost
    INV_FIX_AN = {unit='CHF/yr',job='INV_FIX*AF'},
    INV_VAR_AN = {unit='CHF/(kg/s)/yr',job='INV_VAR*AF*CO2_HQ_OUT_MAX'}
}

-----------
-- Layers
-----------

et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }
et:addLayers {CO2_HQ = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {CO2_LQ = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {WasteCO2 = {type= 'ResourceBalance', unit = 'kg/s'} }

-----------
-- Units
-----------

et:addUnit('CO2_Purif',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2='COST2', Cinv1='INV_FIX_AN', Cinv2='INV_VAR_AN', Power1=0, Power2=0, Impact1=0,Impact2=0})
et['CO2_Purif']:addStreams{
    -- Thermal streams
    qt_cold = qt({tin = 'TIN', hin = 0, tout='TOUT', hout='QMAX', dtmin=0}),
    -- Electricity stream
    elec = rs({'Electricity', 'in', 'EMAX'}),
    -- Material streams
    co2_in = rs({'CO2_LQ', 'in', 'CO2_LQ_IN_MAX'}),
    co2_out = rs({'CO2_HQ', 'out', 'CO2_HQ_OUT_MAX'}),
    co2_wst = rs({'WasteCO2', 'out', 'CO2_WST_MAX'})
}

return et