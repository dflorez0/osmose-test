local osmose = require 'osmose'
local et = osmose.Model 'WaterPurification'

----------
-- User parameters
----------

et.inputs = {
    -- Heat exchangers
    EX1_TIN = {default=15, unit='°C'},
    EX1_TOUT = {default=150, unit='°C'},
    EX1_MCP = {default=200, unit='kW/K'},
    EX2_TIN = {default=120, unit='°C'},
    EX2_TOUT = {default=20, unit='°C'},
    EX2_MCP = {default=250, unit='kW/K'},
    -- Units consuming electricity
    S1_P_EL = {default=3000, unit='kW'},
    -- Inlet and outlet mass flows
    WATER_IN = {default=25, unit='kg/s'},
    MINERALS_OUT = {default=5, unit='kg/s'},
    H2O_OUT = {default=20, unit='kg/s'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    -- Heat exchanger delta enthalpy
    EX1_DH = {unit='kW',job='EX1_MCP*(EX1_TOUT-EX1_TIN)'},
    EX2_DH = {unit='kW',job='EX2_MCP*(EX2_TOUT-EX2_TIN)'},
    -- Total electricity supply
    P_EL_TOT = {unit='kW',job='S1_P_EL'}
}

-----------
-- Layers
-----------

et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }
et:addLayers {H2O = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Minerals = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Water = {type= 'ResourceBalance', unit = 'kg/s'} }


-----------
-- Units
-----------

et:addUnit('PureWaterProd',{type='Process', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['PureWaterProd']:addStreams{
    -- Thermal streams
    qt_ex1 = qt({tin = 'EX1_TIN', hin = 0, tout='EX1_TOUT', hout='EX1_DH', dtmin=0}),
    qt_ex2 = qt({tin = 'EX2_TIN', hin = 0, tout='EX2_TOUT', hout='EX2_DH', dtmin=0}),
    -- Electricity stream
    elec_tot = rs({'Electricity', 'in', 'P_EL_TOT'}),
    -- Material streams
    sup_water = rs({'Water', 'in', 'WATER_IN'}),
    prod_h2o = rs({'H2O', 'out', 'H2O_OUT'}),
    wst_miner = rs({'Minerals', 'out', 'MINERALS_OUT'})
}

return et