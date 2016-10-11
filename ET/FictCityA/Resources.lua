local osmose = require 'osmose'
local et = osmose.Model 'Resources'

----------
-- User parameters
----------

et.inputs = {
    -- Prices
    GAS_P = {default=50, unit='CHF/MWh'},  -- gas price
    BM_P = {default=20, unit='CHF/MWh'},  -- biomass price
    ELEC_P_BUY = {default=120, unit='CHF/MWh'},  -- elec price buy
    ELEC_P_SELL = {default=-110, unit='CHF/MWh'},  -- elec price sell
}

-----------
-- Calculated parameters
-----------

et.outputs = {

}

-----------
-- Layers
-----------

et:addLayers {Gas = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {Biomass = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {Electricity = {type= 'ResourceBalance', unit = 'MW'} }

-----------
-- Units
-----------

-- Gas grid
et:addUnit('GasImport',{type='Utility', Fmin = 0, Fmax = 1000, Cost1=0, Cost2='GAS_P', Cinv1=0, Cinv2=0, Impact1=0,Impact2=0})
et['GasImport']:addStreams{
    gas_out = rs({'Gas', 'out', 1})
}

-- Biomass resource
et:addUnit('Biomass',{type='Utility', Fmin = 0, Fmax = 1000, Cost1=0, Cost2='BM_P', Cinv1=0, Cinv2=0, Impact1=0,Impact2=0})
et['Biomass']:addStreams{
    bm_out = rs({'Biomass', 'out', 1})
}

-- Elec grid buy
et:addUnit('ElecImport',{type='Utility', Fmin = 0, Fmax = 1000, Cost1=0, Cost2='ELEC_P_BUY', Cinv1=0, Cinv2=0, Impact1=0,Impact2=0})
et['ElecImport']:addStreams{
    elec_out = rs({'Electricity', 'out', 1})
}

-- Elec grid sell
et:addUnit('ElecExport',{type='Utility', Fmin = 0, Fmax = 1000, Cost1=0, Cost2='ELEC_P_SELL', Cinv1=0, Cinv2=0, Impact1=0,Impact2=0})
et['ElecExport']:addStreams{
    elec_in = rs({'Electricity', 'in', 1})
}

et:addEquations {eq1 = { statement = "subject to Emax_year_biomass{p in Periods}: \n\t sum {t in TimesOfPeriod[p]} Units_Mult_t[Biomass,p,t]*op_time [p,t] <= 100000*5;", param = {}, addToProblem = 1, type ='ampl' } }

et:addEquations {eq2 = { statement = "subject to Block_elec_transit{p in Periods, t in TimesOfPeriod[p]}: \n\t Units_Use_t[ElecImport,p,t] + Units_Use_t[ElecExport,p,t] <= 1;", param = {}, addToProblem = 1, type ='ampl' } }

return et