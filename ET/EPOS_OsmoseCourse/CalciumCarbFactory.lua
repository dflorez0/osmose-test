local osmose = require 'osmose'
local et = osmose.Model 'CalciumCarbFactory'

----------
-- User parameters
----------

et.inputs = {
    -- Heat exchangers
    EX1_TIN = {default=20, unit='°C'},
    EX1_TOUT = {default=130, unit='°C'},
    EX1_MCP = {default=40, unit='kW/K'},
    EX2_TIN = {default=120, unit='°C'},
    EX2_TOUT = {default=30, unit='°C'},
    EX2_MCP = {default=45, unit='kW/K'},
    -- Units consuming electricity
    CR1_P_EL = {default=10000, unit='kW'},
    CR2_P_EL = {default=15000, unit='kW'},
    -- Inlet and outlet mass flows
    CLINKER_IN = {default=50, unit='kg/s'},
    H2O_IN = {default=10, unit='kg/s'},
    CARBONATE_OUT = {default=15, unit='kg/s'},
    OTHER_COMP_OUT = {default=30, unit='kg/s'},
    WW_OUT = {default=15, unit='kg/s'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    -- Heat exchanger delta enthalpy
    EX1_DH = {unit='kW',job='EX1_MCP*(EX1_TOUT-EX1_TIN)'},
    EX2_DH = {unit='kW',job='EX2_MCP*(EX2_TOUT-EX2_TIN)'},
    -- Total electricity supply
    P_EL_TOT = {unit='kW',job='CR1_P_EL+CR2_P_EL'}
}

-----------
-- Layers
-----------

et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }
et:addLayers {Clinker = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {H2O = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Carbonate = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {OtherCompounds = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {WasteWater = {type= 'ResourceBalance', unit = 'kg/s'} }

-----------
-- Units
-----------

et:addUnit('CarbonateProd',{type='Process', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['CarbonateProd']:addStreams{
    -- Thermal streams
    qt_ex1 = qt({tin = 'EX1_TIN', hin = 0, tout='EX1_TOUT', hout='EX1_DH', dtmin=0}),
    qt_ex2 = qt({tin = 'EX2_TIN', hin = 0, tout='EX2_TOUT', hout='EX2_DH', dtmin=0}),
    -- Electricity stream
    elec_tot = rs({'Electricity', 'in', 'P_EL_TOT'}),
    -- Material streams
    sup_clink = rs({'Clinker', 'in', 'CLINKER_IN'}),
    sup_h2o = rs({'H2O', 'in', 'H2O_IN'}),
    prod_carb = rs({'Carbonate', 'out', 'CARBONATE_OUT'}),
    prod_other_comp = rs({'OtherCompounds', 'out', 'OTHER_COMP_OUT'}),
    wst_water = rs({'WasteWater', 'out', 'WW_OUT'})
}

return et