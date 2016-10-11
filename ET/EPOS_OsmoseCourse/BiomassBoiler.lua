local osmose = require 'osmose'
local et = osmose.Model 'BiomassBoiler'

----------
-- User parameters
----------

et.inputs = {
    -- Heat supply
    TIN = {default=190, unit='°C'},
    TOUT = {default=150, unit='°C'},
    QMAX = {default=10000, unit='kW'},
    -- Efficiency
    EFF = {default=0.8, unit='-' },
    -- Lower Heating Value
--    LHV_BW = {default=0.5, unit='kWh/kg' },
    LHV_RW = {default=4, unit='kWh/kg' },
    LHV_SD = {default=5, unit='kWh/kg' },
    -- Operating cost
    OP_COST = {default=0.15, unit='CHF/kWh' },
    -- Capital costs
    INV_FIX = {default=350000, unit='CHF' },
    INV_VAR = {default=1500, unit='CHF/kW' },
    AF = {default=0.08, unit='-' },
    -- Other
    OP_TIME = {default=8760, unit='h'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    -- Fuel consumption
    BIO_IN_MAX = {unit='kW',job='QMAX/EFF' },
    -- Operating cost
    COST2 = {unit='CHF/kW',job='BIO_IN_MAX()*OP_COST*OP_TIME'},
    -- Biomass equivalent conversion factor
--    CONV_BW = {unit='kW/(kg/s)',job='LHV_BW*3600'},
    CONV_RW = {unit='kW/(kg/s)',job='LHV_RW*3600'},
    CONV_SD = {unit='kW/(kg/s)',job='LHV_SD*3600'},
    -- Investement cost
    INV_FIX_AN = {unit='CHF/yr',job='INV_FIX*AF'},
    INV_VAR_AN = {unit='CHF/kW/yr',job='INV_VAR*AF*QMAX'}
}

-----------
-- Layers
-----------

et:addLayers {BioWaste = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {RawWood = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Sawdust = {type= 'ResourceBalance', unit = 'kg/s'} }
et:addLayers {Biomass = {type= 'MassBalance', unit = 'kW'} }

-----------
-- Units
-----------

--et:addUnit('BioWaste2Biomass',{type='Utility', Fmin = 0, Fmax = 100000, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
--et['BioWaste2Biomass']:addStreams{
--    -- Output heat
--    bw_in = rs({'BioWaste', 'in', 1}),
--    -- Fuel consumption
--    bio_out = ms({'Biomass', 'out', 'CONV_BW'})
--}

et:addUnit('RawWood2Biomass',{type='Utility', Fmin = 0, Fmax = 100000, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['RawWood2Biomass']:addStreams{
    -- Output heat
    rw_in = rs({'RawWood', 'in', 1}),
    -- Fuel consumption
    bio_out = ms({'Biomass', 'out', 'CONV_RW'})
}

et:addUnit('Sawdust2Biomass',{type='Utility', Fmin = 0, Fmax = 100000, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['Sawdust2Biomass']:addStreams{
    -- Output heat
    sd_in = rs({'Sawdust', 'in', 1}),
    -- Fuel consumption
    bio_out = ms({'Biomass', 'out', 'CONV_SD'})
}

et:addUnit('BiomassBoiler',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2='COST2', Cinv1='INV_FIX_AN', Cinv2='INV_VAR_AN', Power1=0, Power2=0, Impact1=0,Impact2=0})
et['BiomassBoiler']:addStreams{
    -- Output heat
    qt_hot = qt({tin = 'TIN', hin = 'QMAX', tout='TOUT', hout=0, dtmin=0}),
    -- Fuel consumption
    bio_in = ms({'Biomass', 'in', 'BIO_IN_MAX'})
}

return et