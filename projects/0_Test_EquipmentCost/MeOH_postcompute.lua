function MeOH_postcompute(project)
  
  local cost_defaults = require 'equipmentcost.cost_defaults'       -- call the cost_default to find the cost parameters
  local cost = cost_defaults(project.options.equipmentcost)         -- execute it
  local cost_CoalBoiler = require 'lib.equipmentcost.cost_CoalBoiler'  -- require any cost function
  
  local q = project:getStream('heatingStream',1).load[1]
  local costBoiler = cost_CoalBoiler(cost, q/100, 20, 0)                 -- execute it
  print('The bara module cost of boiler is\t'..costBoiler.BM)
  
end
