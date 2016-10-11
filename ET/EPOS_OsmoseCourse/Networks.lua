local osmose = require 'osmose'
local et = osmose.Model 'Market'

----------
-- User parameters
----------

et.inputs = {
    -- Energy prices
    ELEC_PRICE_BUY = {default=0.25, unit='CHF/kWh'},
    ELEC_PRICE_SELL = {default=0.18, unit='CHF/kWh'},
    GAS_PRICE_BUY = {default=0.15, unit='CHF/kWh'},
    -- CO2 emissions
    ELEC_CO2 = {default=0.150, unit='kgCO2/kWh'},
    GAS_CO2 = {default=0.206, unit='kgCO2/kWh'},
    -- Network capacity
    MAX_INTAKE = {default=100000, unit='kW'},
    MAX_SUPPLY = {default=100000, unit='kW'},
    -- Other
    OP_TIME = {default=8760, unit='h'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    ELEC_IMP_COST2 = {unit='CHF/kW',job='OP_TIME*ELEC_PRICE_BUY'},
    ELEC_IMP_IMPACT = {unit='CHF/kW',job='OP_TIME*ELEC_CO2'},
    ELEC_EXP_COST2 = {unit='CHF/kW',job='OP_TIME*ELEC_PRICE_SELL'},
    GAS_IMP_COST2 = {unit='CHF/kW',job='OP_TIME*GAS_PRICE_BUY'},
    GAS_IMP_IMPACT = {unit='CHF/kW',job='OP_TIME*GAS_CO2'},
}

-----------
-- Layers
-----------

et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }
et:addLayers {Gas = {type= 'ResourceBalance', unit = 'kW'} }

-----------
-- Units
-----------

-- Electricity
et:addUnit('Elec_Supply',{type='Utility', Fmin = 0, Fmax = 'MAX_SUPPLY', Cost1=0, Cost2='ELEC_IMP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2='ELEC_IMP_IMPACT'})
et['Elec_Supply']:addStreams{
    elec_out = rs({'Electricity', 'out', 1})
}
et:addUnit('Elec_Intake',{type='Utility', Fmin = 0, Fmax = 'MAX_INTAKE', Cost1=0, Cost2='ELEC_EXP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Elec_Intake']:addStreams{
    elec_in = rs({'Electricity', 'in', 1})
}

-- Gas
et:addUnit('Gas_Supply',{type='Utility', Fmin = 0, Fmax = 'MAX_SUPPLY', Cost1=0, Cost2='GAS_IMP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2='GAS_IMP_IMPACT'})
et['Gas_Supply']:addStreams{
    elec_out = rs({'Gas', 'out', 1})
}

return et