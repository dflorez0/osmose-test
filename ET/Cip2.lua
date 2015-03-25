local cip2 = require 'ET.Cip'

cip2.inputs.raw_water_rate = {default = 55, min = 55, max = 55, unit = '%m/m'}
cip2.inputs.new_tag = {}

cip2["CipUnit"]["cleaning_agent"]= qt{ 'cleaning_agent_temp', 0,'tank_temp','cleaning_agent_load',3, 'water_h'}




return cip2