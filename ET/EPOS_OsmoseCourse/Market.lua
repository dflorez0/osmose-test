local osmose = require 'osmose'
local et = osmose.Model 'Market'

----------
-- User parameters
----------

et.inputs = {
    -- Product price
    CO2_PRICE_BUY = {default=0.08, unit='CHF/kg'},
    CO2_PRICE_SELL = {default=-0.02, unit='CHF/kg'},
    H2O_PRICE_BUY = {default=0.02, unit='CHF/kg'},
    H2O_PRICE_SELL = {default=-0.01, unit='CHF/kg'},
    CARBONATE_PRICE_BUY = {default=0.13, unit='CHF/kg'},
    CARBONATE_PRICE_SELL = {default=-0.09, unit='CHF/kg'},
    MINERALS_PRICE_BUY = {default=0.08, unit='CHF/kg'},
    MINERALS_PRICE_SELL = {default=-0.04, unit='CHF/kg'},
    CEMENT_PRICE_SELL = {default=-0.15, unit='CHF/kg'},
    WOODPRD_PRICE_SELL = {default=-0.04, unit='CHF/kg'},
    OTHERCOMP_PRICE_SELL = {default=-0.05, unit='CHF/kg'},
    BEER_PRICE_SELL = {default=-0.05, unit='CHF/kg'},
    -- Market capacity
    MARKET_CAPA = {default=1000, unit='kg/s'},
    -- Market demand
    MARKET_DEMAND_MAX = {default=1000, unit='kg/s'},
    -- Other
    OP_TIME = {default=8760, unit='h'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    OP_TIME_SEC = {unit='s',job='OP_TIME*3600'},
    CO2_IMP_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*CO2_PRICE_BUY'},
    CO2_EXP_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*CO2_PRICE_SELL'},
    H2O_IMP_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*H2O_PRICE_BUY'},
    H2O_EXP_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*H2O_PRICE_SELL'},
    CARB_IMP_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*CARBONATE_PRICE_BUY'},
    CARB_EXP_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*CARBONATE_PRICE_SELL'},
    MINER_IMP_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*MINERALS_PRICE_BUY'},
    MINER_EXP_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*MINERALS_PRICE_SELL'},
    CEMENT_EXP_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*CEMENT_PRICE_SELL'},
    WOODPRD_EXP_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*WOODPRD_PRICE_SELL'},
    OTHERCOMP_EXP_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*OTHERCOMP_PRICE_SELL'},
    BEER_EXP_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*BEER_PRICE_SELL'}
}

-----------
-- Layers
-----------

et:addLayers {CO2_HQ = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Carbonate = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Minerals = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Cement = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {WoodProducts = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {OtherCompounds = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {H2O = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Beer = {type= 'ResourceBalance', unit = 'kg/s'} }

-----------
-- Units
-----------

-- CO2
et:addUnit('CO2_Import',{type='Utility', Fmin = 0, Fmax = 'MARKET_CAPA', Cost1=0, Cost2='CO2_IMP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['CO2_Import']:addStreams{
    co2_out = rs({'CO2_HQ', 'out', 1})
}
et:addUnit('CO2_Export',{type='Utility', Fmin = 0, Fmax = 'MARKET_DEMAND_MAX', Cost1=0, Cost2='CO2_EXP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['CO2_Export']:addStreams{
    co2_in = rs({'CO2_HQ', 'in', 1})
}

-- H2O
et:addUnit('H2O_Import',{type='Utility', Fmin = 0, Fmax = 'MARKET_CAPA', Cost1=0, Cost2='H2O_IMP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['H2O_Import']:addStreams{
    h2o_out = rs({'H2O', 'out', 1})
}
et:addUnit('H2O_Export',{type='Utility', Fmin = 0, Fmax = 'MARKET_DEMAND_MAX', Cost1=0, Cost2='H2O_EXP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['H2O_Export']:addStreams{
    h2o_in = rs({'H2O', 'in', 1})
}

-- Carbonate
et:addUnit('Carbonate_Import',{type='Utility', Fmin = 0, Fmax = 'MARKET_CAPA', Cost1=0, Cost2='CARB_IMP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Carbonate_Import']:addStreams{
    carb_out = rs({'Carbonate', 'out', 1})
}
et:addUnit('Carbonate_Export',{type='Utility', Fmin = 0, Fmax = 'MARKET_DEMAND_MAX', Cost1=0, Cost2='CARB_EXP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Carbonate_Export']:addStreams{
    carb_in = rs({'Carbonate', 'in', 1})
}

-- Minerals
et:addUnit('Minerals_Import',{type='Utility', Fmin = 0, Fmax = 'MARKET_CAPA', Cost1=0, Cost2='MINER_IMP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Minerals_Import']:addStreams{
    miner_out = rs({'Minerals', 'out', 1})
}
et:addUnit('Minerals_Export',{type='Utility', Fmin = 0, Fmax = 'MARKET_DEMAND_MAX', Cost1=0, Cost2='MINER_EXP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Minerals_Export']:addStreams{
    miner_in = rs({'Minerals', 'in', 1})
}

-- Cement
et:addUnit('Cement_Export',{type='Utility', Fmin = 0, Fmax = 'MARKET_DEMAND_MAX', Cost1=0, Cost2='CEMENT_EXP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Cement_Export']:addStreams{
    cement_in = rs({'Cement', 'in', 1})
}

-- Wood products
et:addUnit('WoodPrd_Export',{type='Utility', Fmin = 0, Fmax = 'MARKET_DEMAND_MAX', Cost1=0, Cost2='WOODPRD_EXP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['WoodPrd_Export']:addStreams{
    woodprd_in = rs({'WoodProducts', 'in', 1})
}

-- Other compounds
et:addUnit('OtherCmp_Export',{type='Utility', Fmin = 0, Fmax = 'MARKET_DEMAND_MAX', Cost1=0, Cost2='OTHERCOMP_EXP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['OtherCmp_Export']:addStreams{
    woodprd_in = rs({'OtherCompounds', 'in', 1})
}

-- Beer
et:addUnit('Beer_Export',{type='Utility', Fmin = 0, Fmax = 'MARKET_DEMAND_MAX', Cost1=0, Cost2='BEER_EXP_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Beer_Export']:addStreams{
    beer_in = rs({'Beer', 'in', 1})
}

return et