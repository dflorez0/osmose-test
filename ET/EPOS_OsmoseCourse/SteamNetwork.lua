local osmose = require 'osmose'
local et = osmose.Model 'SteamNetwork'

----------
-- User parameters
----------

et.inputs = {
    -- Heat supply
    HS_TIN = {default=100, unit='°C'},
    HS_TOUT = {default=110, unit='°C'},
    HS_QMAX = {default=10000, unit='kW'},
    -- Heat intake
    HI_TIN = {default=90, unit='°C'},
    HI_TOUT = {default=80, unit='°C'},
    HI_QMAX = {default=10000, unit='kW'},
    -- Electricity consumption (for pumping/maintain pressure)
    EL_SPEC = {default=0.01, unit='kWh_el/kWh_th'}
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    -- Electricity consumption
    EMAX = {unit='kW',job='EL_SPEC*HS_QMAX'}
}

-----------
-- Layers
-----------

et:addLayers {Steam = {type= 'ResourceBalance', unit = 'kW'} }
et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'kW'} }

-----------
-- Units
-----------

et:addUnit('SteamSupply',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SteamSupply']:addStreams{
    -- Input heat
    qt_cold = qt({tin = 'HS_TIN', hin = 0, tout='HS_TOUT', hout='HS_QMAX', dtmin=0}),
    -- Steam network
    steam_out = rs({'Steam', 'out', 'HS_QMAX'}),
    -- Electricity
    elec_in = rs({'Electricity', 'in', 'EMAX'})
}

et:addUnit('SteamIntake',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})
et['SteamIntake']:addStreams{
    -- Output heat
    qt_hot = qt({tin = 'HI_TIN', hin = 'HI_QMAX', tout='HI_TOUT', hout=0, dtmin=0}),
    -- Steam network
    steam_in = rs({'Steam', 'in', 'HI_QMAX'}),
}

return et