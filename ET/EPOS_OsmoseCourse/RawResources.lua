local osmose = require 'osmose'
local et = osmose.Model 'RawResources'

----------
-- User parameters
----------

et.inputs = {
    -- Resource price
    MALT_PRICE = {default=0.05, unit='CHF/kg'},
    WATER_PRICE = {default=0.005, unit='CHF/kg'},
    CLINKER_PRICE = {default=0.014, unit='CHF/kg'},
    WOOD_PRICE = {default=0.02, unit='CHF/kg'},
    -- Resource availability
    MALT_AVAIL = {default=1000, unit='kg/s'},
    WATER_AVAIL = {default=1000, unit='kg/s'},
    CLINKER_AVAIL = {default=1000, unit='kg/s'},
    WOOD_AVAIL = {default=1000, unit='kg/s' },
    -- Other
    OP_TIME = {default=8760, unit='h'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    OP_TIME_SEC = {unit='s',job='OP_TIME*3600'},
    RES_MALT_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*MALT_PRICE'},
    RES_WATER_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*WATER_PRICE'},
    RES_CLINKER_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*CLINKER_PRICE'},
    RES_WOOD_COST2 = {unit='CHF.s/kg',job='OP_TIME_SEC()*WOOD_PRICE'},
}

-----------
-- Layers
-----------

et:addLayers {Malt = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Water = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Clinker = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {RawWood = {type= 'ResourceBalance', unit = 'kg/s'} }

-----------
-- Units
-----------

et:addUnit('Resource_Malt',{type='Utility', Fmin = 0, Fmax = 'MALT_AVAIL', Cost1=0, Cost2='RES_MALT_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Resource_Malt']:addStreams{
    malt_out = rs({'Malt', 'out', 1})
}
et:addUnit('Resource_Water',{type='Utility', Fmin = 0, Fmax = 'WATER_AVAIL', Cost1=0, Cost2='RES_WATER_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Resource_Water']:addStreams{
    water_out = rs({'Water', 'out', 1})
}
et:addUnit('Resource_Clinker',{type='Utility', Fmin = 0, Fmax = 'CLINKER_AVAIL', Cost1=0, Cost2='RES_CLINKER_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Resource_Clinker']:addStreams{
    clink_out = rs({'Clinker', 'out', 1})
}
et:addUnit('Resource_RawWood',{type='Utility', Fmin = 0, Fmax = 'WOOD_AVAIL', Cost1=0, Cost2='RES_WOOD_COST2', Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Resource_RawWood']:addStreams{
    wood_out = rs({'RawWood', 'out', 1})
}

return et