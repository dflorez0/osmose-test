#!/usr/bin/lua
--[[------------------------------------------------------

  # services

--]]------------------------------------------------------

local osmose = require 'osmose'
local lib = osmose.Model 'services'


lib.inputs = { 
 -- selling prices
elec_sell_EU_price = {default = -0.14, unit = 'USD/kWh'},
ethanol99_price = {default = -0.74, unit = 'USD/L'},
ethanol95_price = {default = -0.71, unit = 'USD/L'},
ethanol93_price = {default = -0.695, unit = 'USD/L'},
succinic_acid_price = {default = -5, unit = 'USD/kg'},
lactic_acid_price = {default = -1.32, unit = 'USD/kg'},
ethylene_price = {default = -1.105, unit = 'USD/kg'},
vanillin_price = {default = -10, unit = 'USD/kg'},
n_butanol_price = {default = -0.6, unit = 'USD/kg'},
acetone_price = {default = -0.5, unit = 'USD/kg'},
acetic_acid_price = {default = -0.9, unit = 'USD/kg'},
formic_acid_price = {default = -1.0, unit = 'USD/kg'},
lignin_os_price = {default = -0.45, unit = 'USD/kg'},
xylitol_price = {default = -10, unit = 'USD/kg'},
methanol_price = {default = -0.384, unit = 'USD/kg'},
glucose_20_price = {default = -1, unit = 'USD/kg'}, -- this is not real price. Just for testing !!!!

-- density of ethanol products
dens_ethanol_99 = {default = 0.791, min=0, max=100000, unit = 'kg/L'}, 
dens_ethanol_95 = {default = 0.801, min=0, max=100000, unit = 'kg/L'}, 
dens_ethanol_93 = {default = 0.805, min=0, max=100000, unit = 'kg/L'}, 

-- reference size for units
elec_ref = {default = 1000, unit = 'kW'},
ethanol99_ref = {default = 100, unit = 'kg/h'},
ethanol95_ref = {default = 100, unit = 'kg/h'},
ethanol93_ref = {default = 100, unit = 'kg/h'},
succinic_acid_ref = {default = 1000, unit = 'kg/h'},
lactic_acid_ref = {default = 1000, unit = 'kg/h'},
ethylene_ref = {default = 100, unit = 'kg/h'},
vanillin_ref = {default = 100, unit = 'kg/h'},
n_butanol_ref = {default = 100, unit = 'kg/h'},
acetone_ref = {default = 100, unit = 'kg/h'},
acetic_acid_ref = {default = 1000, unit = 'kg/h'},
formic_acid_ref = {default = 1000, unit = 'kg/h'},
lignin_os_ref  = {default = 100, unit = 'kg/h'},
ethanol_ref  = {default = 10, unit = 'kg/h'},
xylitol_ref  = {default = 100, unit = 'kg/h'},
methanol_ref  = {default = 100, unit = 'kg/h'},
glucose_20_ref = {default = 100, unit = 'kg/h'},


--add to problem products
atp_electricity_sell = {default = 1, unit = '-'},
atp_ethanol99 = {default = 1, unit = '-'},
atp_ethanol95 = {default = 1, unit = '-'},
atp_ethanol93 = {default = 1, unit = '-'},
atp_succinic_acid = {default = 1, unit = '-'},
atp_lactic_acid = {default = 1, unit = '-'},
atp_ethylene = {default = 1, unit = '-'},
atp_vanillin = {default = 1, unit = '-'},
atp_n_butanol = {default = 1, unit = '-'},
atp_acetone = {default = 1, unit = '-'},
atp_acetic_acid = {default = 1, unit = '-'},
atp_formic_acid = {default = 1, unit = '-'},
atp_lignin_os = {default = 1, unit = '-'},
atp_xylitol = {default = 1, unit = '-'},
atp_methanol = {default = 1, unit = '-'},
}

lib.outputs = { 
elec_unit_price = {unit = '$/h', job = "elec_sell_EU_price*elec_ref " },  
ethanol99_unit_price = {unit = '$/h', job = "(ethanol99_price/dens_ethanol_99)*ethanol99_ref " },
ethanol95_unit_price = {unit = '$/h', job = "(ethanol95_price/dens_ethanol_95)*ethanol95_ref " },
ethanol93_unit_price = {unit = '$/h', job = "(ethanol93_price/dens_ethanol_93)*ethanol93_ref " },
succinic_acid_unit_price = {unit = '$/h', job = "succinic_acid_price*succinic_acid_ref " },  
lactic_acid_unit_price = {unit = '$/h', job = "lactic_acid_price*lactic_acid_ref " },  
ethylene_unit_price = {unit = '$/h', job = "ethylene_price*ethylene_ref " },  
vanillin_unit_price = {unit = '$/h', job = "vanillin_price*vanillin_ref " },  
n_butanol_unit_price = {unit = '$/h', job = "n_butanol_price*n_butanol_ref " },  
acetone_unit_price = {unit = '$/h', job = "acetone_price*acetone_ref " },  
acetic_acid_unit_price = {unit = '$/h', job = "acetic_acid_price*acetic_acid_ref " },  
formic_acid_unit_price = {unit = '$/h', job = "formic_acid_price*formic_acid_ref " },  
lignin_os_unit_price = {unit = '$/h', job = "lignin_os_price*lignin_os_ref " },  
xylitol_unit_price = {unit = '$/h', job = "xylitol_price*xylitol_ref " },
methanol_unit_price = {unit = '$/h', job = "methanol_price*methanol_ref " },

glucose_20_unit_price = {unit = '$/h', job = "glucose_20_price*glucose_20_ref " },

atp_electricity_sell_unit = {unit = '$/h', job = "atp_electricity_sell " }, 
atp_ethanol99_unit = {unit = '$/h', job = "atp_ethanol99 " },  
atp_ethanol95_unit = {unit = '$/h', job = "atp_ethanol95 " }, 
atp_ethanol93_unit = {unit = '$/h', job = "atp_ethanol93 " }, 
atp_vanillin_unit = {unit = '$/h', job = "atp_vanillin " }, 
atp_succinic_acid_unit = {unit = '$/h', job = "atp_succinic_acid " }, 
atp_lactic_acid_unit = {unit = '$/h', job = "atp_lactic_acid " }, 
atp_ethylene_unit = {unit = '$/h', job = "atp_ethylene " }, 
atp_n_butanol_unit = {unit = '$/h', job = "atp_n_butanol " }, 
atp_acetone_unit = {unit = '$/h', job = "atp_acetone " }, 
atp_acetic_acid_unit = {unit = '$/h', job = "atp_acetic_acid " }, 
atp_formic_acid_unit = {unit = '$/h', job = "atp_formic_acid " }, 
atp_lignin_os_unit = {unit = '$/h', job = "atp_lignin_os " }, 
atp_xylitol_unit = {unit = '$/h', job = "atp_xylitol " }, 
atp_methanol_unit = {unit = '$/h', job = "atp_methanol " }, 
}



lib:addLayers {electricity = {type ='MassBalance', unit ='kW'}}
lib:addLayers {bioethanol_99 = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {bioethanol_93 = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {bioethanol_95 = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {vanillin = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {acetic_acid = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {lactic_acid = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {formic_acid = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {recoveredwater = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {wastewater = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {co2 = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {yeast = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {n_butanol = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {acetone = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {ethanol = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {succinic_acid = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {ethylene = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {lignin_os = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {xylitol = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {methanol = {type ='MassBalance', unit ='kg/h'}}
lib:addLayers {glucose_20 = {type ='MassBalance', unit ='kg/h'}}

-- units
lib:addUnit("glucose_20_prod" , {type = 'Utility' , addToProblem= 0 })
lib["glucose_20_prod"].Fmax = 10000
lib["glucose_20_prod"].Fmin = 0
lib["glucose_20_prod"].Cost2 = 'glucose_20_unit_price'
lib["glucose_20_prod"]:addStreams ({glucose_20_out = ms({'glucose_20', 'in', 'glucose_20_ref' }) }) 

-- units
lib:addUnit("methanol_prod" , {type = 'Utility' , addToProblem='atp_methanol_unit'})
lib["methanol_prod"].Fmax = 10000
lib["methanol_prod"].Fmin = 0
lib["methanol_prod"].Cost2 = 'methanol_unit_price'
lib["methanol_prod"]:addStreams ({ethanol_out = ms({'methanol', 'in', 'methanol_ref', AddToProblem=1 }) }) 

-- units
lib:addUnit("bioethanol_99_prod" , {type = 'Utility' , addToProblem='atp_ethanol99_unit'})
lib["bioethanol_99_prod"].Fmax = 10000
lib["bioethanol_99_prod"].Fmin = 0
lib["bioethanol_99_prod"].Cost2 = 'ethanol99_unit_price'
lib["bioethanol_99_prod"]:addStreams ({bioethanol_99_out = ms({'bioethanol_99', 'in', 'ethanol99_ref', AddToProblem=1 }) }) 

lib:addUnit("bioethanol_93_prod" , {type = 'Utility' , addToProblem='atp_ethanol93_unit'})
lib["bioethanol_93_prod"].Fmax = 10000
lib["bioethanol_93_prod"].Fmin = 0
lib["bioethanol_93_prod"].Cost2 = 'ethanol93_unit_price'
lib["bioethanol_93_prod"]:addStreams ({bioethanol_93_out = ms({'bioethanol_93', 'in', 'ethanol93_ref', AddToProblem=1 }) }) 

lib:addUnit("bioethanol_95_prod" , {type = 'Utility' , addToProblem='atp_ethanol95_unit'})
lib["bioethanol_95_prod"].Fmax = 10000
lib["bioethanol_95_prod"].Fmin = 0
lib["bioethanol_95_prod"].Cost2 = 'ethanol95_unit_price'
lib["bioethanol_95_prod"]:addStreams ({bioethanol_95_out = ms({'bioethanol_95', 'in', 'ethanol95_ref', AddToProblem=1 }) }) 

-- units
lib:addUnit("vanillin_prod" , {type = 'Utility', addToProblem='atp_vanillin_unit' })
lib["vanillin_prod"].Fmax = 10000
lib["vanillin_prod"].Fmin = 0
lib["vanillin_prod"].Cost2 = 'vanillin_unit_price'
lib["vanillin_prod"]:addStreams ({vanillin_out = ms({'vanillin', 'in', 'vanillin_ref', AddToProblem=1 }) }) 

-- units
lib:addUnit("formic_acid_prod" , {type = 'Utility' , addToProblem='atp_formic_acid_unit'})
lib["formic_acid_prod"].Fmax = 10000
lib["formic_acid_prod"].Fmin = 0
lib["formic_acid_prod"].Cost2 = 'formic_acid_unit_price'
lib["formic_acid_prod"]:addStreams ({formic_acid_out = ms({'formic_acid', 'in', 'formic_acid_ref', AddToProblem=1 }) }) 

-- units
lib:addUnit("acetic_acid_prod" , {type = 'Utility' , addToProblem='atp_acetic_acid_unit'})
lib["acetic_acid_prod"].Fmax = 10000
lib["acetic_acid_prod"].Fmin = 0
lib["acetic_acid_prod"].Cost2 = 'acetic_acid_unit_price'
lib["acetic_acid_prod"]:addStreams ({acetic_acid_out = ms({'acetic_acid', 'in', 'acetic_acid_ref', AddToProblem=1 }) }) 

-- units
lib:addUnit("lactic_acid_prod" , {type = 'Utility', addToProblem='atp_lactic_acid_unit' })
lib["lactic_acid_prod"].Fmax = 10000
lib["lactic_acid_prod"].Fmin = 0
lib["lactic_acid_prod"].Cost2 = 'lactic_acid_unit_price'
lib["lactic_acid_prod"]:addStreams ({lactic_acid_out = ms({'lactic_acid', 'in', 'lactic_acid_ref', AddToProblem=1 }) }) 

-- units
lib:addUnit("n_butanol_prod" , {type = 'Utility' , addToProblem='atp_n_butanol_unit' })
lib["n_butanol_prod"].Fmax = 10000
lib["n_butanol_prod"].Fmin = 0
lib["n_butanol_prod"].Cost2 = 'n_butanol_unit_price'
lib["n_butanol_prod"]:addStreams ({n_butanol_out = ms({'n_butanol', 'in', 'n_butanol_ref', AddToProblem=1 }) }) 

-- units
lib:addUnit("acetone_prod" , {type = 'Utility', addToProblem='atp_acetone_unit' })
lib["acetone_prod"].Fmax = 10000
lib["acetone_prod"].Fmin = 0
lib["acetone_prod"].Cost2 = 'acetone_unit_price'
lib["acetone_prod"]:addStreams ({acetone_out = ms({'acetone', 'in', 'acetone_ref', AddToProblem=1 }) }) 

-- units
lib:addUnit("succinic_acid_prod" , {type = 'Utility', addToProblem='atp_succinic_acid_unit' })
lib["succinic_acid_prod"].Fmax = 10000
lib["succinic_acid_prod"].Fmin = 0
lib["succinic_acid_prod"].Cost2 = 'succinic_acid_unit_price'
lib["succinic_acid_prod"]:addStreams ({succinic_acid_out = ms({'succinic_acid', 'in', 'succinic_acid_ref', AddToProblem=1 }) }) 

-- units
lib:addUnit("ethylene_prod" , {type = 'Utility' , addToProblem='atp_ethylene_unit' })
lib["ethylene_prod"].Fmax = 10000
lib["ethylene_prod"].Fmin = 0
lib["ethylene_prod"].Cost2 = 'ethylene_unit_price'
lib["ethylene_prod"]:addStreams ({ethylene_out = ms({'ethylene', 'in', 'ethylene_ref', AddToProblem=1 }) }) 

-- units
lib:addUnit("electricity_prod" , {type = 'Utility' , addToProblem='atp_electricity_sell_unit'} )
lib["electricity_prod"].Fmax = 1000
lib["electricity_prod"].Fmin = 0
lib["electricity_prod"].Cost2 = 'elec_unit_price'
lib["electricity_prod"]:addStreams({electricity_in = ms({'electricity', 'in', 'elec_ref', AddToProblem=1}) })

-- units
lib:addUnit("lignin_os_prod" , {type = 'Utility' , addToProblem='atp_lignin_os_unit'} )
lib["lignin_os_prod"].Fmax = 1000
lib["lignin_os_prod"].Fmin = 0
lib["lignin_os_prod"].Cost2 = 'lignin_os_unit_price'
lib["lignin_os_prod"]:addStreams({electricity_out = ms({'lignin_os', 'in', 'lignin_os_ref', AddToProblem=1}) })

-- units
lib:addUnit("xylitol_prod" , {type = 'Utility', addToProblem='atp_xylitol_unit' })
lib["xylitol_prod"].Fmax = 10000
lib["xylitol_prod"].Fmin = 0
lib["xylitol_prod"].Cost2 = 'xylitol_unit_price'
lib["xylitol_prod"]:addStreams ({xylitol_out = ms({'xylitol', 'in', 'xylitol_ref', AddToProblem=1 }) }) 

-- units
lib:addUnit("recoveredwater_prod" , {type = 'Utility'} )
lib["recoveredwater_prod"].Fmax = 10000
lib["recoveredwater_prod"].Fmin = 0
lib["recoveredwater_prod"].Cost2 = 0
lib["recoveredwater_prod"]:addStreams({recoveredwater_out = ms({'recoveredwater', 'in', 10000, AddToProblem=1}) })

-- units
lib:addUnit("wastewater_prod" , {type = 'Utility'} )
lib["wastewater_prod"].Fmax = 10000
lib["wastewater_prod"].Fmin = 0
lib["wastewater_prod"].Cost2 = 0
lib["wastewater_prod"]:addStreams({wastewater_out = ms({'wastewater', 'in', 100000, AddToProblem=1}) })

-- units
lib:addUnit("co2_prod" , {type = 'Utility'} )
lib["co2_prod"].Fmax = 10000
lib["co2_prod"].Fmin = 0
lib["co2_prod"].Cost2 = 0
lib["co2_prod"]:addStreams({co2_out = ms({'co2', 'in', 100, AddToProblem=1}) })

lib:addUnit("yeast_prod" , {type = 'Utility'} )
lib["yeast_prod"].Fmax = 10000
lib["yeast_prod"].Fmin = 0
lib["yeast_prod"].Cost2 = 0
lib["yeast_prod"]:addStreams({yeast_out = ms({'yeast', 'in', 10, AddToProblem=1}) })

-- units
lib:addUnit("ethanol_prod" , {type = 'Utility' })
lib["ethanol_prod"].Fmax = 10000
lib["ethanol_prod"].Fmin = 0
lib["ethanol_prod"].Cost2 = 0
lib["ethanol_prod"]:addStreams ({ethanol_out = ms({'ethanol', 'in', 'ethanol_ref', AddToProblem=1 }) }) 



return lib

