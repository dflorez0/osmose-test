local osmose = require 'osmose'
local et = osmose.Model 'RankineCycle'

----------
-- User parameters
----------

et.inputs = {
    -- Evaporator
    EVAP_TIN = {default=150, unit='°C'},
    EVAP_TOUT = {default=150, unit='°C'},
    -- Condensor
    COND_TIN = {default=120, unit='°C'},
    COND_TOUT = {default=120, unit='°C'},
    -- Electricity output
    EMAX = {default=10000, unit='kW'},
    -- Efficiency
    EFF_TH = {default=0.55, unit='-' },
    EFF_EL = {default=0.4, unit='-' },
    -- Operating cost
    OP_COST = {default=0.2, unit='CHF/kWh' },
    -- Other
    OP_TIME = {default=8760, unit='h'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    -- Condensor
    COND_QMAX = {unit='kW',job='EMAX*EFF_TH/EFF_EL' },
    -- Evaporator
    EVAP_QMAX = {unit='kW',job='EMAX/EFF_EL' },
    -- Operating cost
    COST2 = {unit='CHF/kW',job='EMAX*OP_COST*OP_TIME'}
}

-----------
-- Layers
-----------

et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }

-----------
-- Units
-----------

et:addUnit('Rankine',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2='COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Rankine']:addStreams{
    -- Heat
    qt_evap = qt({tin = 'EVAP_TIN', hin = 0, tout='EVAP_TOUT', hout='EVAP_QMAX', dtmin=0}),
    qt_cond = qt({tin = 'COND_TIN', hin = 'COND_QMAX', tout='COND_TOUT', hout=0, dtmin=0}),
    -- Electricity consumption
    elec_in = rs({'Electricity', 'out', 'EMAX'})
}

return et