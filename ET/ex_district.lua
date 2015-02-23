local osmose = require 'lib.osmose'
local District = osmose.Model 'ex_district'

District.inputs={
  DISTRICT_HEAT_TIN={default=60, min=0, max=300, unit='°C'},
  DISTRICT_HEAT_TOUT={default=90, min=0, max=300, unit='°C'},
  DISTRICT_HEAT_DEMAND={default=10, min=0, max=100, unit='kW'},
  DISTRICT_HEAT_DTMIN={default=5, min=0, max=50, unit='K'}
  }

District.outputs={
  DISTRICT_HEAT_TIN_K={unit='kW',job=function() return DISTRICT_HEAT_TIN+273.15 end},
  DISTRICT_HEAT_TOUT_K={unit='kW',job=function() return DISTRICT_HEAT_TOUT+273.15 end},
  }

--District:addLayers({heat = {type= 'MassBalance', unit = 'kWh'}})

District:addUnit("DistrictDemand", {type = 'Process', Fmin=0, Fmax=1, Cost1=0, Cost2=0, Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})

District["DistrictDemand"]:addStreams{
--  HeatDemand=ms({'heat', 'in', 'DISTRICT_HEAT_DEMAND'})
  HeatDemand=qt({tin='DISTRICT_HEAT_TIN_K', tout='DISTRICT_HEAT_TOUT_K', hin=0, hout='DISTRICT_HEAT_DEMAND', dtmin='DISTRICT_HEAT_DTMIN'})
  }

return District