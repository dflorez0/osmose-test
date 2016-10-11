local osmose = require 'osmose'
local et = osmose.Model 'Waste'

----------
-- User parameters
----------

et.inputs = {
    -- Waste penalty cost
    CO2_TREAT = {default=0.01, unit='CHF/kg'},
    WW_TREAT = {default=0.01, unit='CHF/kg'},
    SAWDUST_TREAT = {default=0.01, unit='CHF/kg'},
    BIOWASTE_TREAT = {default=0.01, unit='CHF/kg'},
    -- Treatment capacity
    CO2_TREAT_CAPA = {default=1000, unit='kg/s'},
    WW_TREAT_CAPA = {default=1000, unit='kg/s'},
    SAWDUST_TREAT_CAPA = {default=1000, unit='kg/s'},
    BIOWASTE_TREAT_CAPA = {default=1000, unit='kg/s'},
    -- Other
    OP_TIME = {default=8760, unit='h'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    OP_TIME_SEC = {unit='s',job='OP_TIME*3600'},
    CO2_TREAT_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*CO2_TREAT'},
    WW_TREAT_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*WW_TREAT'},
    SAWDUST_TREAT_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*SAWDUST_TREAT'},
    BIOWASTE_TREAT_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*BIOWASTE_TREAT'}
}

-----------
-- Layers
-----------

et:addLayers {CO2_LQ = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {WasteCO2 = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {WasteWater = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {BioWaste = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Sawdust = {type= 'ResourceBalance', unit = 'kg/s'} }

-----------
-- Units
-----------

-- Gas emissions
et:addUnit('CO2_Atmos',{type='Utility', Fmin = 0, Fmax = 'CO2_TREAT_CAPA', Cost1=0, Cost2='CO2_TREAT_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['CO2_Atmos']:addStreams{
    co2_in = rs({'CO2_LQ', 'in', 1})
}
et:addUnit('CO2_Atmos2',{type='Utility', Fmin = 0, Fmax = 'CO2_TREAT_CAPA', Cost1=0, Cost2='CO2_TREAT_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['CO2_Atmos2']:addStreams{
    co2_in = rs({'WasteCO2', 'in', 1})
}

-- Waste water
et:addUnit('WW_Treatment',{type='Utility', Fmin = 0, Fmax = 'WW_TREAT_CAPA', Cost1=0, Cost2='WW_TREAT_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['WW_Treatment']:addStreams{
    ww_in = rs({'WasteWater', 'in', 1})
}

-- Sawdust
et:addUnit('Sawdust_Evac',{type='Utility', Fmin = 0, Fmax = 'SAWDUST_TREAT_CAPA', Cost1=0, Cost2='SAWDUST_TREAT_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Sawdust_Evac']:addStreams{
    sawdst_in = rs({'Sawdust', 'in', 1})
}

-- Biowaste
et:addUnit('Biowaste_Evac',{type='Utility', Fmin = 0, Fmax = 'BIOWASTE_TREAT_CAPA', Cost1=0, Cost2='BIOWASTE_TREAT_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Biowaste_Evac']:addStreams{
    biowst_in = rs({'BioWaste', 'in', 1})
}

return et