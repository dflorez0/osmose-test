local osmose = require 'osmose'
local et = osmose.Model 'Services'

----------
-- User parameters
----------

et.inputs = {
    Q_HEAT = {default=20, unit='MW_th'}  -- heat demand
}

-----------
-- Calculated parameters
-----------

et.outputs = {

}

-----------
-- Layers
-----------

et:addLayers {Heat = {type= 'MassBalance', unit = 'MW'} }

-----------
-- Units
-----------

-- Building heat demand
et:addUnit('BuildingHeat',{type='Process', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Impact1=0,Impact2=0})
et['BuildingHeat']:addStreams{
    -- Thermal streams
    heat_in = ms({'Heat', 'in', 'Q_HEAT'})
}

return et