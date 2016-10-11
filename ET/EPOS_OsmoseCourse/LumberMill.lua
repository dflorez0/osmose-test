local osmose = require 'osmose'
local et = osmose.Model 'LumberMill'

----------
-- User parameters
----------

et.inputs = {
    -- Units consuming electricity
    S1_P_EL = {default=3200, unit='kW'},
    -- Inlet and outlet mass flows
    WOOD_IN = {default=50, unit='kg/s'},
    WOOD_PROD_OUT = {default=40, unit='kg/s'},
    SAWDUST_OUT = {default=10, unit='kg/s'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    -- Total electricity supply
    P_EL_TOT = {unit='kW',job='S1_P_EL'}
}

-----------
-- Layers
-----------

et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }
et:addLayers {RawWood = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {WoodProducts = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Sawdust = {type= 'ResourceBalance', unit = 'kg/s'} }


-----------
-- Units
-----------

et:addUnit('LumberMill',{type='Process', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['LumberMill']:addStreams{
    -- Electricity stream
    elec_tot = rs({'Electricity', 'in', 'P_EL_TOT'}),
    -- Material streams
    sup_wood = rs({'RawWood', 'in', 'WOOD_IN'}),
    prod_woodprdcts = rs({'WoodProducts', 'out', 'WOOD_PROD_OUT'}),
    wst_sawdst = rs({'Sawdust', 'out', 'SAWDUST_OUT'})
}

return et