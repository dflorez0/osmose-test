local osmose = require 'osmose'
local et = osmose.Model 'WWTP'

----------
-- User parameters
----------

et.inputs = {
    -- Heat demand
    TIN = {default=30, unit='°C'},
    TOUT = {default=50, unit='°C'},
    QMAX = {default=1000, unit='kW'},
    -- Electricity demand
    EMAX = {default=200, unit='kW'},
    -- Inlet and outlet mass flows
    WW_IN_MAX = {default=50, unit='kg/s'},
    SLUDGE_OUT_MAX = {default=20, unit='kg/s'},
    WATER_OUT_MAX = {default=30, unit='kg/s' },
    -- Operating cost
    WWTP_COST = {default=0.1, unit='CHF/kg' },
    -- Other
    OP_TIME = {default=8760, unit='h'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    OP_TIME_SEC = {unit='s',job='OP_TIME*3600'},
    -- Operating cost
    COST2 = {unit='CHF.s/kg',job='WW_IN_MAX*WWTP_COST*OP_TIME_SEC()'},
}

-----------
-- Layers
-----------

et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }
et:addLayers {Water = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {WasteWater = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {BioWaste = {type= 'ResourceBalance', unit = 'kg/s'} }

-----------
-- Units
-----------

et:addUnit('WWTP',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2='COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['WWTP']:addStreams{
    -- Thermal streams
    qt_cold = qt({tin = 'TIN', hin = 0, tout='TOUT', hout='QMAX', dtmin=0}),
    -- Electricity stream
    elec = rs({'Electricity', 'in', 'EMAX'}),
    -- Material streams
    ww_in = rs({'WasteWater', 'in', 'WW_IN_MAX'}),
    water_out = rs({'Water', 'out', 'WATER_OUT_MAX'}),
    bw_out = rs({'BioWaste', 'out', 'SLUDGE_OUT_MAX'})
}

return et