local physical = require 'lib.physical'

-- initialize units
local x = physical.Unit(3,'°C')
local y = physical.Unit(304,'K')
local a = physical.Unit(2,'m')
local b = physical.Unit(5,'m')

-- perform operations as you usually would
-- ATTENTION: 
-- - division not working properly
-- - units after multiplication, division and exponentiation will not be correct
local z1 = x + y
local z2 = y + x
local c = a * b

print('x = '..x.value..' '..x.unit)
print('y = '..y.value..' '..y.unit)

print('\nsimple unit conversion:')
local y_conv = y:convert('°C')
print(string.format('y = %f %s = %f %s' ,y.value, y.unit, y_conv.value, y_conv.unit))
print('\ndirect printing works as well:')
print(y_conv)

print('\nunits will be converted to unit of first variable of operation:')
print('z = x + y = '..z1.value..' '..z1.unit)
print('z = y + x = '..z2.value..' '..z2.unit)

print('\nunit after multiplication:')
print('a = '..a.value..' '..a.unit)
print('b = '..b.value..' '..b.unit)

print('c = a * b = '..c.value..' '..c.unit)
