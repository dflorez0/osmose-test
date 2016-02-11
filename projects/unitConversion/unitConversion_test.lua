local physical = require 'lib.physical'

-- initialize units
local x = physical.Unit(3,'C')
local y = physical.Unit(304,'K')

-- perform operations as you usually would
-- ATTENTION: 
-- - division not working properly
-- - units after multiplication, division and exponentiation will not be correct
local z1 = x + y
local z2 = y + x

-- units will be converted to unit of first variable
print('x = '..x.value..' '..x.unit)
print('y = '..y.value..' '..y.unit)

print('z = x + y = '..z1.value..' '..z1.unit)
print('z = y + x = '..z2.value..' '..z2.unit)
