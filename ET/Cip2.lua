-- Attention:
-- function 'require' checks in table package.loaded whether the module is already loaded. If so, require returns its corresponding value. 
-- Therefore, once a module is loaded, other calls requiring the same module simply return the same value, without running any code again. 
-- [Ierusalimschy 2013, Programming in Lua, sect. 15.1]
-- This does not lead to a problem as long as there is only one child inheriting from this class. As soon as one wants to create a cip3 
-- which inherits from Cip, it will due to the use of the require function also inherit from Cip2. This can cause unwanted effects as 
-- having an additionally defined stream for Cip2 also in Cip3. Therefore the information that the package (i.e. parent class) was already
-- loaded once, has to be erased. 
--
-- For the future: Maybe the implementation can be improved by using the setmetatable function (see Iersualimschy chapt. 16)
local cip2 = require 'ET.Cip'

cip2.inputs.raw_water_rate = {default = 55, min = 55, max = 55, unit = '%m/m'}
cip2.inputs.new_tag = {}

cip2["CipUnit"]["cleaning_agent"]= qt{ 'cleaning_agent_temp', 0,'tank_temp','cleaning_agent_load',3, 'water_h'}


package.loaded['ET.Cip'] = nil  --  erase the library entry to force require into loading the same module twice [Ierusalimschy 2013, Programming in Lua, sect. 15.1]
return cip2