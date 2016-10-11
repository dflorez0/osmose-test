local osmose = require 'osmose'
local et = osmose.Model 'CementFactory'

----------
-- User parameters
----------

et.inputs = {
    -- Heat exchangers
    EX1_TIN = {default=20, unit='°C'},
    EX1_TOUT = {default=80, unit='°C'},
    EX1_MCP = {default=8, unit='kW/K'},
    EX2_TIN = {default=60, unit='°C'},
    EX2_TOUT = {default=180, unit='°C'},
    EX2_MCP = {default=60, unit='kW/K'},
    EX3_TIN = {default=115, unit='°C'},
    EX3_TOUT = {default=60, unit='°C'},
    EX3_MCP = {default=30, unit='kW/K'},
    EX4_TIN = {default=50, unit='°C'},
    EX4_TOUT = {default=30, unit='°C'},
    EX4_MCP = {default=40, unit='kW/K'},
    EX5_TIN = {default=100, unit='°C'},
    EX5_TOUT = {default=30, unit='°C'},
    EX5_MCP = {default=10, unit='kW/K'},
    EX6_TIN = {default=120, unit='°C'},
    EX6_TOUT = {default=30, unit='°C'},
    EX6_MCP = {default=1, unit='kW/K'},
    -- Units consuming electricity
    CR1_P_EL = {default=2000, unit='kW'},
    C1_P_EL = {default=300, unit='kW'},
    -- Inlet and outlet mass flows
    H2O_IN = {default=2, unit='kg/s'},
    CARBONATE_IN = {default=20, unit='kg/s'},
    MINERALS_IN = {default=5, unit='kg/s'},
    CO2_LQ_OUT = {default=1, unit='kg/s'},
    WW_OUT = {default=2.5, unit='kg/s'},
    CEMENT_OUT = {default=23.5, unit='kg/s'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    -- Heat exchanger delta enthalpy
    EX1_DH = {unit='kW',job='EX1_MCP*(EX1_TOUT-EX1_TIN)'},
    EX2_DH = {unit='kW',job='EX2_MCP*(EX2_TOUT-EX2_TIN)'},
    EX3_DH = {unit='kW',job='EX3_MCP*(EX3_TOUT-EX3_TIN)'},
    EX4_DH = {unit='kW',job='EX4_MCP*(EX4_TOUT-EX4_TIN)'},
    EX5_DH = {unit='kW',job='EX5_MCP*(EX5_TOUT-EX5_TIN)'},
    EX6_DH = {unit='kW',job='EX6_MCP*(EX6_TOUT-EX6_TIN)'},
    -- Total electricity supply
    P_EL_TOT = {unit='kW',job='CR1_P_EL+C1_P_EL'}
}

-----------
-- Layers
-----------

et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }
et:addLayers {H2O = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Carbonate = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Minerals = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {CO2_LQ = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {WasteWater = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Cement = {type= 'ResourceBalance', unit = 'kg/s'} }

-----------
-- Units
-----------

et:addUnit('CementProd',{type='Process', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['CementProd']:addStreams{
    -- Thermal streams
    qt_ex1 = qt({tin = 'EX1_TIN', hin = 0, tout='EX1_TOUT', hout='EX1_DH', dtmin=0}),
    qt_ex2 = qt({tin = 'EX2_TIN', hin = 0, tout='EX2_TOUT', hout='EX2_DH', dtmin=0}),
    qt_ex3 = qt({tin = 'EX3_TIN', hin = 0, tout='EX3_TOUT', hout='EX3_DH', dtmin=0}),
    qt_ex4 = qt({tin = 'EX4_TIN', hin = 0, tout='EX4_TOUT', hout='EX4_DH', dtmin=0}),
    qt_ex5 = qt({tin = 'EX5_TIN', hin = 0, tout='EX5_TOUT', hout='EX5_DH', dtmin=0}),
    qt_ex6 = qt({tin = 'EX6_TIN', hin = 0, tout='EX6_TOUT', hout='EX6_DH', dtmin=0}),
    -- Electricity stream
    elec_tot = rs({'Electricity', 'in', 'P_EL_TOT'}),
    -- Material streams
    sup_h2o = rs({'H2O', 'in', 'H2O_IN'}),
    sup_carb = rs({'Carbonate', 'in', 'CARBONATE_IN'}),
    sup_miner = rs({'Minerals', 'in', 'MINERALS_IN'}),
    prod_cement = rs({'Cement', 'out', 'CEMENT_OUT'}),
    wst_co2 = rs({'CO2_LQ', 'out', 'CO2_LQ_OUT'}),
    wst_water = rs({'WasteWater', 'out', 'WW_OUT'})
}

return et