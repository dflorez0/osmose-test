local osmose = require 'osmose'
local et = osmose.Model 'Networks'

----------
-- User parameters
----------

et.inputs = {
    PMAX = {default=50, unit='MW'},  -- Maximum heat transfer of district heating
    INV_COST_FIX = {default=3000000, unit='CHF'}, -- Fixed investment cost
    INV_COST_VAR = {default=50000, unit='CHF/MW'}, -- Variable investment cost
}

-----------
-- Calculated parameters
-----------

et.outputs = {
    CINV1 = {unit='CHF',job='INV_COST_FIX/4'},
    CINV2 = {unit='CHF',job='INV_COST_VAR*PMAX/4'}
}

-----------
-- Layers
-----------

et:addLayers {DHN_C1_C2_out = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C1_C2_in = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C1_C4_out = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C1_C4_in = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C1_C5_out = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C1_C5_in = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C2_C3_out = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C2_C3_in = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C2_C4_out = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C2_C4_in = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C3_C4_out = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C3_C4_in = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C3_C5_out = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C3_C5_in = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C4_C5_out = {type= 'ResourceBalance', unit = 'MW'} }
et:addLayers {DHN_C4_C5_in = {type= 'ResourceBalance', unit = 'MW'} }

-----------
-- Units
-----------

et:addUnit('DHN_C1_C2',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1='CINV1', Cinv2='CINV2', Impact1=0,Impact2=0})
et['DHN_C1_C2']:addStreams{
    -- Heat transfer from one location to anothernother
    dhn_in = rs({'DHN_C1_C2_out', 'in', 'PMAX'}),
    dhn_out = rs({'DHN_C1_C2_in', 'out', 'PMAX'})
}

et:addUnit('DHN_C1_C4',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1='CINV1', Cinv2='CINV2', Impact1=0,Impact2=0})
et['DHN_C1_C4']:addStreams{
    -- Heat transfer from one location to anothernother
    dhn_in = rs({'DHN_C1_C4_out', 'in', 'PMAX'}),
    dhn_out = rs({'DHN_C1_C4_in', 'out', 'PMAX'})
}

et:addUnit('DHN_C1_C5',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1='CINV1', Cinv2='CINV2', Impact1=0,Impact2=0})
et['DHN_C1_C5']:addStreams{
    -- Heat transfer from one location to anothernother
    dhn_in = rs({'DHN_C1_C5_out', 'in', 'PMAX'}),
    dhn_out = rs({'DHN_C1_C5_in', 'out', 'PMAX'})
}

et:addUnit('DHN_C2_C3',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1='CINV1', Cinv2='CINV2', Impact1=0,Impact2=0})
et['DHN_C2_C3']:addStreams{
    -- Heat transfer from one location to anothernother
    dhn_in = rs({'DHN_C2_C3_out', 'in', 'PMAX'}),
    dhn_out = rs({'DHN_C2_C3_in', 'out', 'PMAX'})
}

et:addUnit('DHN_C2_C4',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1='CINV1', Cinv2='CINV2', Impact1=0,Impact2=0})
et['DHN_C2_C4']:addStreams{
    -- Heat transfer from one location to anothernother
    dhn_in = rs({'DHN_C2_C4_out', 'in', 'PMAX'}),
    dhn_out = rs({'DHN_C2_C4_in', 'out', 'PMAX'})
}

et:addUnit('DHN_C3_C4',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1='CINV1', Cinv2='CINV2', Impact1=0,Impact2=0})
et['DHN_C3_C4']:addStreams{
    -- Heat transfer from one location to anothernother
    dhn_in = rs({'DHN_C3_C4_out', 'in', 'PMAX'}),
    dhn_out = rs({'DHN_C3_C4_in', 'out', 'PMAX'})
}

et:addUnit('DHN_C3_C5',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1='CINV1', Cinv2='CINV2', Impact1=0,Impact2=0})
et['DHN_C3_C5']:addStreams{
    -- Heat transfer from one location to anothernother
    dhn_in = rs({'DHN_C3_C5_out', 'in', 'PMAX'}),
    dhn_out = rs({'DHN_C3_C5_in', 'out', 'PMAX'})
}

et:addUnit('DHN_C4_C5',{type='Utility', Fmin = 0, Fmax = 1, Cost1=0, Cost2=0, Cinv1='CINV1', Cinv2='CINV2', Impact1=0,Impact2=0})
et['DHN_C4_C5']:addStreams{
    -- Heat transfer from one location to anothernother
    dhn_in = rs({'DHN_C4_C5_out', 'in', 'PMAX'}),
    dhn_out = rs({'DHN_C4_C5_in', 'out', 'PMAX'})
}

return et



