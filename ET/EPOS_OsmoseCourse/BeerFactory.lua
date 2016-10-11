local osmose = require 'osmose'
local et = osmose.Model 'BeerFactory'



----------
-- User parameters
----------

et.inputs = {
    -- Heat exchangers
    EX1_TIN = {default=15, unit='°C'},
    EX1_TOUT = {default=50, unit='°C'},
    EX1_MCP = {default=120, unit='kW/K'},
    EX2_TIN = {default=15, unit='°C'},
    EX2_TOUT = {default=100, unit='°C'},
    EX2_MCP = {default=40, unit='kW/K'},
    EX3_TIN = {default=65, unit='°C'},
    EX3_TOUT = {default=75, unit='°C'},
    EX3_MCP = {default=180, unit='kW/K'},
    EX4_TIN = {default=15, unit='°C'},
    EX4_TOUT = {default=50, unit='°C'},
    EX4_MCP = {default=5, unit='kW/K'},
    EX5_TIN = {default=120, unit='°C'},
    EX5_TOUT = {default=30, unit='°C'},
    EX5_MCP = {default=1.5, unit='kW/K'},
    EX6_TIN = {default=60, unit='°C'},
    EX6_TOUT = {default=120, unit='°C'},
    EX6_MCP = {default=145, unit='kW/K'},
    EX7_TIN = {default=110, unit='°C'},
    EX7_TOUT = {default=10, unit='°C'},
    EX7_MCP = {default=90, unit='kW/K'},
    EX8_TIN = {default=60, unit='°C'},
    EX8_TOUT = {default=30, unit='°C'},
    EX8_MCP = {default=30, unit='kW/K'},
    -- Units consuming electricity
    P1_P_EL = {default=5, unit='kW'},
    C1_P_EL = {default=150, unit='kW'},
    -- Inlet and outlet mass flows
    WATER_IN1 = {default=30, unit='kg/s'},
    WATER_IN2 = {default=10, unit='kg/s'},
    WATER_IN3 = {default=1, unit='kg/s'},
    MALT_IN = {default=10, unit='kg/s'},
    CO2_HQ_IN = {default=1, unit='kg/s'},
    WW_OUT = {default=10, unit='kg/s'},
    CO2_LQ_OUT = {default=1, unit='kg/s'},
    BIOWASTE_OUT = {default=10, unit='kg/s'},
    BEER_OUT = {default=31, unit='kg/s'}
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
    EX7_DH = {unit='kW',job='EX7_MCP*(EX7_TOUT-EX7_TIN)'},
    EX8_DH = {unit='kW',job='EX8_MCP*(EX8_TOUT-EX8_TIN)'},
    -- Total electricity supply
    P_EL_TOT = {unit='kW',job='P1_P_EL+C1_P_EL'},
    -- Total water supply
    WATER_IN_TOT = {unit='kg/s',job='WATER_IN1+WATER_IN2+WATER_IN3'}
}

-----------
-- Layers
-----------

et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }
et:addLayers {Malt = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Water = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {CO2_HQ = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {CO2_LQ = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {WasteWater = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {BioWaste = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Beer = {type= 'ResourceBalance', unit = 'kg/s'} }

-----------
-- Units
-----------

et:addUnit('BeerProd',{type='Process', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['BeerProd']:addStreams{
    -- Thermal streams
    qt_ex1 = qt({tin = 'EX1_TIN', hin = 0, tout='EX1_TOUT', hout='EX1_DH', dtmin=0}),
    qt_ex2 = qt({tin = 'EX2_TIN', hin = 0, tout='EX2_TOUT', hout='EX2_DH', dtmin=0}),
    qt_ex3 = qt({tin = 'EX3_TIN', hin = 0, tout='EX3_TOUT', hout='EX3_DH', dtmin=0}),
    qt_ex4 = qt({tin = 'EX4_TIN', hin = 0, tout='EX4_TOUT', hout='EX4_DH', dtmin=0}),
    qt_ex5 = qt({tin = 'EX5_TIN', hin = 0, tout='EX5_TOUT', hout='EX5_DH', dtmin=0}),
    qt_ex6 = qt({tin = 'EX6_TIN', hin = 0, tout='EX6_TOUT', hout='EX6_DH', dtmin=0}),
    qt_ex7 = qt({tin = 'EX7_TIN', hin = 0, tout='EX7_TOUT', hout='EX7_DH', dtmin=0}),
    qt_ex8 = qt({tin = 'EX8_TIN', hin = 0, tout='EX8_TOUT', hout='EX8_DH', dtmin=0}),
    -- Electricity stream
    elec_tot = rs({'Electricity', 'in', 'P_EL_TOT'}),
    -- Material streams
    sup_malt = rs({'Malt', 'in', 'MALT_IN'}),
    sup_water = rs({'Water', 'in', 'WATER_IN_TOT'}),
    sup_co2 = rs({'CO2_HQ', 'in', 'CO2_HQ_IN'}),
    prod_beer = rs({'Beer', 'out', 'BEER_OUT'}),
    wst_co2 = rs({'CO2_LQ', 'out', 'CO2_LQ_OUT'}),
    wst_water = rs({'WasteWater', 'out', 'WW_OUT'}),
    wst_bio = rs({'BioWaste', 'out', 'BIOWASTE_OUT'})
}

return et