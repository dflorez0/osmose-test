-- Model of test for mass quality
-- 
local osmose = require 'osmose'
local test = osmose.Model 'test'



--test.Class = {
--               Group = 'Matlab model example',
--               Type = 'example 1',
--}

--test.OsParam = {
--               OSMOSEVersion = '2.7.8',
--               ETVersion = '2.0.0',
--               Version = '0.8.2'}

--test.Tagging = {
--               TagName = 'test',
--               DisplayName = 'matlab model example 1',
--               Description = 'simple energy integration model'}


-- Add Inputs
test.inputs = {
   sizeequipment1 = {default = 1, min = 0, max = 1.00000, unit = 'm^3', Description = 'Size of equipment 1'},
   sizeequipment2 = {default = 1, min = 0, max = 1.00000, unit = 'm^3', Description = 'Size of equipment 2'},
   dt_min_2 = {default = 5, min = 0, max = 5.00000, unit = '-', Description = 'Temperature difference (DTmin_2) '},
   t1 = {default = 10, min = 0, max = 5.00000, unit = '-', Description = 'Temperature difference (DTmin_2) '},
   t2 = {default = 15, min = 0, max = 5.00000, unit = '-', Description = 'Temperature difference (DTmin_2) '},
   t3 = {default = 45, min = 0, max = 5.00000, unit = '-', Description = 'Temperature difference (DTmin_2) '},
}

-- Outputs
test.outputs = {
   tot_invest = {unit = '$'},
   lec = {unit = '-'},
}

-- Add Layers

--test:addLayers {product = {type = 'MassBalance', unit = 'kW'}}
test:addLayers {water = {type = 'MassBalanceQuality', unit = 'kW'}}

-- Add Units
test:addUnit ("pro1",
{type = 'Process', DisplayName = 'first process unit'})
test["pro1"]:addStreams {
qtc1 = qt {tin = 20, hin = 0.00, tout = 180, hout = 1920.00, dtmin= 'dt_min_2', alpha = 0.56},
qth1 = qt {tin = 250, hin = 3150.00, tout = 40, hout = 0.00, dtmin= 'dt_min_2', alpha = 0.06},
--input = ms ({'product', 'in', 1000 }),
washing = msq({layername ='water', inout = 'in', flowrate = 1000, addtoproblem = 1, elements = {prop1 = {value = 0.6, isconstrained = 1}, prop2={value = 0.6,isconstrained = 1}, prop3={value = 0.98, isconstrained = 1}} }) 
}
test:addUnit ("pro2",
{type = 'Process', DisplayName = 'second process unit'})
test["pro2"]:addStreams {
qtc2 = qt {tin = 140, hin = -3420.00, tout = 230, hout = 0.00, dtmin= 'dt_min_2', alpha = 0.06},
qth2 = qt {tin = 200, hin = 3000.00, tout = 200, hout = 0.00, dtmin= 'dt_min_2', alpha = 1.6},
--output = ms ({'product', 'out', 200 }),
waterout = msq({'water', 'out', 200, 1, {prop1 = {0.5,0}, prop2={0.6,0}, prop3={0.8,0}} }) 
}
test:addUnit ("coolwa",
{type = 'Utility', DisplayName = 'Cooling water', AddToProblem = 1, Fmin = 0, Fmax = 1000, Cost1 = 0, Cost2 = 10, Cinv1 = 0, Cinv2 = 0, Power1 = 0, Power2 = 0, })
test["coolwa"]:addStreams {
xcw_wain = qt {tin = 10, hin = 0.00, tout = 15, hout = 1000.00, dtmin = 4.00, alpha = 0.56},
}
test:addUnit ("hwa",
{type = 'Utility', DisplayName = 'Heating stream', AddToProblem = 1, Fmin = 0, Fmax = 1000, Cost1 = 0, Cost2 = 10, Cinv1 = 0, Cinv2 = 0, Power1 = 0, Power2 = 0, })
test["hwa"]:addStreams {
xh = qt {tin = 250, hin = 1000.00, tout = 240, hout = 0.00, dtmin = 4.00, alpha = 0.06},
}

test:addUnit ("Waste",
{type = 'Utility', DisplayName = 'material', AddToProblem = 1, Fmin = 0, Fmax = 1000, Cost1 = 0, Cost2 = 10, Cinv1 = 0, Cinv2 = 0, Power1 = 0, Power2 = 0, })
test["Waste"]:addStreams {
--  WW = ms ({'product', 'out', 1 })
waste = msq({'water', 'in', 1, 1, {prop1 = {0,1}, prop2={0,1}, prop3={0,1}} }) 
}

test:addUnit ("Fresh",
{type = 'Utility', DisplayName = 'material', AddToProblem = 1, Fmin = 0, Fmax = 1000, Cost1 = 0, Cost2 = 10, Cinv1 = 0, Cinv2 = 0, Power1 = 0, Power2 = 0, })
test["Fresh"]:addStreams {
--util_in = ms ({'product', 'in', 1 })
FW = msq({'water', 'out', 1, 1, {prop1 = {1,0}, prop2={1,0}, prop3={1,0}} }) 
}
-- Return the output
return test
