local osmose = require 'lib.osmose'
local GasBoiler = osmose.Model 'ex_gasBoiler'

GasBoiler.inputs={
  BOILER_PMAX={default=80, min=0, max=300, unit='kW'},
  BOILER_MIN={default=0, min=0, max=100, unit='%Pmax'},
  BOILER_TIN={default=150, min=0, max=300, unit='°C'},
  BOILER_TOUT={default=80, min=0, max=300, unit='°C'},
  BOILER_DTMIN={default=5, min=0, max=50, unit='K'}
}

GasBoiler.outputs={
  BOILER_TIN_K={unit='kW',job=function() return BOILER_TIN+273.15 end},
  BOILER_TOUT_K={unit='kW',job=function() return BOILER_TOUT+273.15 end},
  }

--GasBoiler:addLayers({heat = {type= 'MassBalance', unit = 'kWh'}})

GasBoiler:addUnit("Boiler", {type = 'Utility', Fmin='BOILER_MIN', Fmax=1, Cost1=0, Cost2=5, Cinv1=0, Cinv2=0, Power1=0, Power2=0, Impact1=0,Impact2=0})

GasBoiler["Boiler"]:addStreams{
--  HeatDemand=ms({'heat', 'out', 'BOILER_PMAX'})
  HeatOutput=qt({tin='BOILER_TIN_K', tout='BOILER_TOUT_K', hin='BOILER_PMAX', hout=0, dtmin='BOILER_DTMIN'})
  }

return GasBoiler