local osmose = require 'lib.osmose'

local cip = require 'ET.Cip' ()
local cm = require 'ET.CookingMixing' ()

cip.generateData(2,30,'projects/jam/data/cip_values.csv')
cm.generateData(2,30,'projects/jam/data/cm_values_1.csv')
cm.generateData(2,30,'projects/jam/data/cm_values_2.csv')



