local osmose = require 'osmose'
local et = osmose.Model 'SuperUtility'

----------
-- User parameters
----------

et.inputs = {
    COST1 = {default=1000000, unit='CHF'},
    COST2 = {default=1000, unit='CHF/kg or CHF/kWh'},
    INV1 = {default=1000000000, unit='CHF'},
    OP_TIME = {default=8760, unit='h'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    OP_TIME_SEC = {unit='s',job='OP_TIME*3600'},
    COST2_MAT = {unit='CHF.h/kg',job='OP_TIME_SEC()*COST2'},
    COST2_NRG = {unit='CHF/kW',job='OP_TIME_SEC()*COST2'}
}

-----------
-- Layers
-----------

et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }
et:addLayers {Malt = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Water = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {CO2_HQ = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {CO2_LQ = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {WasteCO2 = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {WasteWater = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {BioWaste = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Beer = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {H2O = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Carbonate = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Minerals = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Cement = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Clinker = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {OtherCompounds = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {RawWood = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {WoodProducts = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Sawdust = {type= 'ResourceBalance', unit = 'kg/s'} }

-----------
-- Units
-----------

-- Hot & cold utilities
et:addUnit('SU_Hot',{type='Utility', Fmin = 0, Fmax = 100000, Cost1 = 'COST1', Cost2 = 'COST2_NRG', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Hot']:addStreams{
    qt_hot = qt({tin = 300, hin = 1, tout=250, hout=0, dtmin=0})
}
et:addUnit('SU_Cold',{type='Utility', Fmin = 0, Fmax = 100000, Cost1 = 'COST1', Cost2 = 'COST2_NRG', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Cold']:addStreams{
    qt_cold = qt({tin = 0, hin = 0, tout=1, hout=1, dtmin=0})
}

-- Electricity
et:addUnit('SU_Elec_Supply',{type='Utility', Fmin = 0, Fmax = 100000, Cost1 = 'COST1', Cost2 = 'COST2_NRG', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Elec_Supply']:addStreams{
    elec_out = rs({'Electricity', 'out', 1})
}
et:addUnit('SU_Elec_Intake',{type='Utility', Fmin = 0, Fmax = 100000, Cost1 = 'COST1', Cost2 = 'COST2_NRG', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Elec_Intake']:addStreams{
    elec_in = rs({'Electricity', 'in', 1})
}

-- Malt
et:addUnit('SU_Malt_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Malt_Supply']:addStreams{
    malt_out = rs({'Malt', 'out', 1})
}
et:addUnit('SU_Malt_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Malt_Intake']:addStreams{
    malt_in = rs({'Malt', 'in', 1})
}

-- Water
et:addUnit('SU_Water_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Water_Supply']:addStreams{
    water_out = rs({'Water', 'out', 1})
}
et:addUnit('SU_Water_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Water_Intake']:addStreams{
    water_in = rs({'Water', 'in', 1})
}

-- CO2_HQ
et:addUnit('SU_CO2_HQ_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_CO2_HQ_Supply']:addStreams{
    co2_hq_out = rs({'CO2_HQ', 'out', 1})
}
et:addUnit('SU_CO2_HQ_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_CO2_HQ_Intake']:addStreams{
    co2_hq_in = rs({'CO2_HQ', 'in', 1})
}

-- CO2_LQ
et:addUnit('SU_CO2_LQ_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_CO2_LQ_Supply']:addStreams{
    co2_lq_out = rs({'CO2_LQ', 'out', 1})
}
et:addUnit('SU_CO2_LQ_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_CO2_LQ_Intake']:addStreams{
    co2_lq_in = rs({'CO2_LQ', 'in', 1})
}

-- Waste CO2
et:addUnit('SU_WasteCO2_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_WasteCO2_Supply']:addStreams{
    co2_lq_out = rs({'WasteCO2', 'out', 1})
}
et:addUnit('SU_WasteCO2_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_WasteCO2_Intake']:addStreams{
    co2_lq_in = rs({'WasteCO2', 'in', 1})
}

-- WasteWater
et:addUnit('SU_WasteWater_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_WasteWater_Supply']:addStreams{
    ww_out = rs({'WasteWater', 'out', 1})
}
et:addUnit('SU_WasteWater_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_WasteWater_Intake']:addStreams{
    ww_in = rs({'WasteWater', 'in', 1})
}

-- BioWaste
et:addUnit('SU_BioWaste_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_BioWaste_Supply']:addStreams{
    bw_out = rs({'BioWaste', 'out', 1})
}
et:addUnit('SU_BioWaste_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_BioWaste_Intake']:addStreams{
    bw_in = rs({'BioWaste', 'in', 1})
}

-- Beer
et:addUnit('SU_Beer_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Beer_Supply']:addStreams{
    beer_out = rs({'Beer', 'out', 1})
}
et:addUnit('SU_Beer_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Beer_Intake']:addStreams{
    beer_in = rs({'Beer', 'in', 1})
}

-- H2O
et:addUnit('SU_H2O_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_H2O_Supply']:addStreams{
    h2o_out = rs({'H2O', 'out', 1})
}
et:addUnit('SU_H2O_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_H2O_Intake']:addStreams{
    h2o_in = rs({'H2O', 'in', 1})
}

-- Carbonate
et:addUnit('SU_Carbonate_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Carbonate_Supply']:addStreams{
    carb_out = rs({'Carbonate', 'out', 1})
}
et:addUnit('SU_Carbonate_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Carbonate_Intake']:addStreams{
    carb_in = rs({'Carbonate', 'in', 1})
}

-- Minerals
et:addUnit('SU_Minerals_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Minerals_Supply']:addStreams{
    miner_out = rs({'Minerals', 'out', 1})
}
et:addUnit('SU_Minerals_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Minerals_Intake']:addStreams{
    miner_in = rs({'Minerals', 'in', 1})
}

-- Cement
et:addUnit('SU_Cement_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Cement_Supply']:addStreams{
    cement_out = rs({'Cement', 'out', 1})
}
et:addUnit('SU_Cement_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Cement_Intake']:addStreams{
    cement_in = rs({'Cement', 'in', 1})
}

-- Clinker
et:addUnit('SU_Clinker_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Clinker_Supply']:addStreams{
    cement_out = rs({'Clinker', 'out', 1})
}
et:addUnit('SU_Clinker_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Clinker_Intake']:addStreams{
    cement_in = rs({'Clinker', 'in', 1})
}

-- OtherCompounds
et:addUnit('SU_OtherCompounds_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_OtherCompounds_Supply']:addStreams{
    cement_out = rs({'OtherCompounds', 'out', 1})
}
et:addUnit('SU_OtherCompounds_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_OtherCompounds_Intake']:addStreams{
    cement_in = rs({'OtherCompounds', 'in', 1})
}

-- RawWood
et:addUnit('SU_RawWood_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_RawWood_Supply']:addStreams{
    wood_out = rs({'RawWood', 'out', 1})
}
et:addUnit('SU_RawWood_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_RawWood_Intake']:addStreams{
    wood_in = rs({'RawWood', 'in', 1})
}

-- WoodProducts
et:addUnit('SU_WoodProducts_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_WoodProducts_Supply']:addStreams{
    wood_out = rs({'WoodProducts', 'out', 1})
}
et:addUnit('SU_WoodProducts_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_WoodProducts_Intake']:addStreams{
    wood_in = rs({'WoodProducts', 'in', 1})
}

-- Sawdust
et:addUnit('SU_Sawdust_Supply',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Sawdust_Supply']:addStreams{
    sawdst_out = rs({'Sawdust', 'out', 1})
}
et:addUnit('SU_Sawdust_Intake',{type='Utility', Fmin = 0, Fmax = 1000, Cost1 = 'COST1', Cost2 = 'COST2_MAT', Cinv1='INV1', Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SU_Sawdust_Intake']:addStreams{
    sawdst_in = rs({'Sawdust', 'in', 1})
}

return et