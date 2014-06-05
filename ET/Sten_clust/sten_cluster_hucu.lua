#!/usr/bin/lua
--[[------------------------------------------------------

  # Cooking Mixing

  The model class stores the elements of the energy technology
  such as  *utility*, *stream* and *operational costs*.
  
  
  TODO: 
        

--]]------------------------------------------------------

local osmose = require 'osmose'
local lib = osmose.Model 'sten_clust'

-- ## Inlet Parameters  (isVIT = 1)
lib.inputs = { 
dt_util={default = 0, min = 5, max = 1050, unit = 'C'},
dt_proc={default = 0, min = 5, max = 1050, unit = 'C'},
-- New utility system
util_h_flue_load={default=10393,min=0,max=15588.78968,unit='MW'},
util_h_85bsh_load={default=310,min=0,max=465,unit='MW'},
util_h_85b_load={default=690,min=0,max=1035,unit='MW'},
util_h_hot_oil_load={default=1972,min=0,max=2958,unit='MW'},
util_h_40b_load={default=42783,min=0,max=64174.5,unit='MW'},
util_h_8_8bsh_load={default=933,min=0,max=1399.236,unit='MW'},
util_h_28b_load={default=6322,min=0,max=9483.285714,unit='MW'},
util_h_20b_load={default=38016,min=0,max=57023.40476,unit='MW'},
util_h_14b_load={default=12690,min=0,max=19035,unit='MW'},
util_h_11b_load={default=3794,min=0,max=5691,unit='MW'},
util_h_10b_load={default=16804,min=0,max=25205.57143,unit='MW'},
util_h_8_8b_250_load={default=89441,min=0,max=134161.764,unit='MW'},
util_h_1_8b_180sh_load={default=3292,min=0,max=4938.165,unit='MW'},
util_h_7b_load={default=15330,min=0,max=22995,unit='MW'},
util_h_6b_load={default=14164,min=0,max=21245.97619,unit='MW'},
util_h_Cond6b_load={default=4508,min=0,max=6762,unit='MW'},
util_h_4b_load={default=2228,min=0,max=3342,unit='MW'},
util_h_2_7b_load={default=4748,min=0,max=7122,unit='MW'},
util_h_1_8b_180_load={default=91670.89,min=0,max=137506.335,unit='MW'},
util_h_2b_load={default=36680,min=0,max=55020,unit='MW'},
util_h_1b_load={default=8390.063492,min=0,max=12585.09524,unit='MW'},
util_h_NewHW50_100_load={default=0,min=0,max=0,unit='MW'},
util_h_NewHW55_79_load={default=0,min=0,max=0,unit='MW'},
util_h_NewHW75_97_load={default=0,min=0,max=0,unit='MW'},
util_h_HotWh_load={default=1670,min=0,max=2505,unit='MW'},
util_h_CircWh_load={default=7140,min=0,max=10710,unit='MW'},
util_h_C3_9h_load={default=27770,min=0,max=41655,unit='MW'},
util_h_C3_21h_load={default=1235,min=0,max=1852.5,unit='MW'},



util_c_C2_100c_load={default=645,min=0,max=967.5,unit='MW'},
util_c_C2_84c_load={default=7320,min=0,max=10980,unit='MW'},
util_c_C2_62c_load={default=930,min=0,max=1395,unit='MW'},
util_c_C3_41c_load={default=39662.75132,min=0,max=59494.12698,unit='MW'},
util_c_C3_21c_load={default=18980,min=0,max=28470,unit='MW'},
util_c_CCW_load={default=8928.571429,min=0,max=13392.85714,unit='MW'},
util_c_Air_load={default=81635.3,min=0,max=122452.95,unit='MW'},
util_c_C3_9c_load={default=500,min=0,max=750,unit='MW'},
util_c_CW_load={default=469886.3185,min=0,max=704829.4778,unit='MW'},
util_c_NewHW_load={default=0.01,min=0,max=0,unit='MW'},
util_c_NewHW55_79_load={default=0.01,min=0,max=0,unit='MW'},
util_c_NewHW75_97_load={default=0.01,min=0,max=0,unit='MW'},
util_c_HotWc_load={default=34478,min=0,max=51717,unit='MW'},
util_c_CircWc_load={default=9000,min=0,max=13500,unit='MW'},
util_c_CircW_load={default=0.01,min=0,max=0,unit='MW'},
util_c_BFW1b_load={default=595.2380952,min=0,max=892.8571429,unit='MW'},
util_c_BFW2b_load={default=5270,min=0,max=7905,unit='MW'},
util_c_BFW1_8b_load={default=50000,min=0,max=75000,unit='MW'},
util_c_BFW2_7b_load={default=13000,min=0,max=19500,unit='MW'},
util_c_BFW4b_load={default=26100,min=0,max=39150,unit='MW'},
util_c_BFW8_8b_load={default=27300,min=0,max=40950,unit='MW'},
util_c_BFW10b_load={default=13392.85714,min=0,max=20089.28571,unit='MW'},
util_c_BFW11b_load={default=8700,min=0,max=13050,unit='MW'},
util_c_BFW14b_load={default=15200,min=0,max=22800,unit='MW'},
util_c_BFW20b_load={default=28640,min=0,max=42960,unit='MW'},
util_c_BFW40b_load={default=41950,min=0,max=62925,unit='MW'},
util_c_BFW85b_load={default=50800,min=0,max=76200,unit='MW'},

-- -- Cold process

  }

-- ## Result (isVIT = 2)
lib.outputs = {  }


lib:addUnit("sten_clust", {type = 'Process'})
lib["sten_clust"].Cost2 = 10
lib["sten_clust"]:addStreams({
    

util_h_flue ={300.0,0,1400.0,'util_h_flue_load','dt_util'},
util_h_85bsh ={300.0,0,500.0,'util_h_85bsh_load','dt_util'},
util_h_85b ={299.0,0,300.0,'util_h_85b_load','dt_util'},
util_h_hot_oil ={272.0,0,277.0,'util_h_hot_oil_load','dt_util'},
util_h_40b ={250.0,0,251.0,'util_h_40b_load','dt_util'},
util_h_8_8bsh ={180.0,0,250.0,'util_h_8_8bsh_load','dt_util'},
util_h_28b ={231.0,0,232.0,'util_h_28b_load','dt_util'},
util_h_20b ={214.0,0,215.0,'util_h_20b_load','dt_util'},
util_h_14b ={199.0,0,200.0,'util_h_14b_load','dt_util'},
util_h_11b ={187.0,0,188.0,'util_h_11b_load','dt_util'},
util_h_10b ={183.0,0,184.0,'util_h_10b_load','dt_util'},
util_h_8_8b_250 ={179.0,0,180.0,'util_h_8_8b_250_load','dt_util'},
util_h_1_8b_180sh ={133.0,0,180.0,'util_h_1_8b_180sh_load','dt_util'},
util_h_7b ={169.0,0,170.0,'util_h_7b_load','dt_util'},
util_h_6b ={164.0,0,165.0,'util_h_6b_load','dt_util'},
util_h_Cond6b ={150,0,165,'util_h_Cond6b_load','dt_util'},
util_h_4b ={150,0,151,'util_h_4b_load','dt_util'},
util_h_2_7b ={139,0,140,'util_h_2_7b_load','dt_util'},
util_h_1_8b_180 ={132,0,133,'util_h_1_8b_180_load','dt_util'},
util_h_2b ={132,0,133,'util_h_2b_load','dt_util'},
util_h_1b ={119,0,120,'util_h_1b_load','dt_util'},
util_h_NewHW50_100 ={50,0,100,'util_h_NewHW50_100_load','dt_util'},
util_h_NewHW55_79 ={55,0,79,'util_h_NewHW55_79_load','dt_util'},
util_h_NewHW75_97 ={75,0,97,'util_h_NewHW75_97_load','dt_util'},
util_h_HotWh ={40,0,120,'util_h_HotWh_load','dt_util'},
util_h_CircWh ={50,0,60,'util_h_CircWh_load','dt_util'},
util_h_C3_9h ={8,0,9,'util_h_C3_9h_load','dt_util'},
util_h_C3_21h ={-22,0,-21,'util_h_C3_21h_load','dt_util'},


util_c_C2_100c ={-99,'util_c_C2_100c_load',-100,0,'dt_util'},
util_c_C2_84c ={-83,'util_c_C2_84c_load',-84,0,'dt_util'},
util_c_C2_62c ={-61,'util_c_C2_62c_load',-62,0,'dt_util'},
util_c_C3_41c ={-39,'util_c_C3_41c_load',-40,0,'dt_util'},
util_c_C3_21c ={-20,'util_c_C3_21c_load',-21,0,'dt_util'},
util_c_CCW ={7,'util_c_CCW_load',4,0,'dt_util'},
util_c_Air ={10,'util_c_Air_load',8,0,'dt_util'},
util_c_C3_9c ={10,'util_c_C3_9c_load',9,0,'dt_util'},
util_c_CW ={15,'util_c_CW_load',10,0,'dt_util'},
util_c_NewHW ={100,'util_c_NewHW_load',50,0,'dt_util'},
util_c_NewHW55_79 ={79,'util_c_NewHW55_79_load',55,0,'dt_util'},
util_c_NewHW75_97 ={97,'util_c_NewHW75_97_load',75,0,'dt_util'},
util_c_HotWc ={120,'util_c_HotWc_load',40,0,'dt_util'},
util_c_CircWc ={60,'util_c_CircWc_load',50,0,'dt_util'},
util_c_CircW ={85,'util_c_CircW_load',65,0,'dt_util'},
util_c_BFW1b ={121,'util_c_BFW1b_load',120,0,'dt_util'},
util_c_BFW2b ={133,'util_c_BFW2b_load',132,0,'dt_util'},
util_c_BFW1_8b ={133,'util_c_BFW1_8b_load',132,0,'dt_util'},
util_c_BFW2_7b ={140,'util_c_BFW2_7b_load',139,0,'dt_util'},
util_c_BFW4b ={151,'util_c_BFW4b_load',150,0,'dt_util'},
util_c_BFW8_8b ={180,'util_c_BFW8_8b_load',179,0,'dt_util'},
util_c_BFW10b ={185,'util_c_BFW10b_load',184,0,'dt_util'},
util_c_BFW11b ={188,'util_c_BFW11b_load',187,0,'dt_util'},
util_c_BFW14b ={200,'util_c_BFW14b_load',199,0,'dt_util'},
util_c_BFW20b ={216,'util_c_BFW20b_load',215,0,'dt_util'},
util_c_BFW40b ={251,'util_c_BFW40b_load',250,0,'dt_util'},
util_c_BFW85b ={301,'util_c_BFW85b_load',300,0,'dt_util'},



})

return lib
