--[[------------------------------------------------------

  # sofc

  The model is used to test Vali interface.

--]]------------------------------------------------------

local osmose = require 'osmose'
local sofc = osmose.Model 'sofc' 

sofc.values={
  air_cp=1.007,--;% kJ/kg/C 
  water_cp=4.18,--;% kJ/kg/C 
  ice_cp=2.09,--;% kj/kg/C 
  water_molarmass=18,--; % g/mol 
  air_molarmass=29,--;% g/mol
}

sofc.software = {'VALI','cement.bls' } -- (name of soft, name of model)
--sofc.software = {'VALI','evap.bls' }-- (name of soft, name of model)

-- ## INPUTS: List of the CST tags to be assigned to vali 
sofc.inputs = { -- doc 
  
		-- Steam to carbon ratio, check range
		H2O_C = {default = 1.34, min = 0.1, max = 2, unit = '-', status = 'CST', accuracy = '3'}, 
     --[[
    -- Steam reforming temperature, check range
    SR_OUT_T = {default = 1010, min = 1000, max = 1020, unit = 'K', status = 'CST'}, 
    
    -- Fuel cell temperature, check range
    FC_A_1_T = {default = 1015, min = 1000, max = 1020, unit = 'K', status = 'CST'}, 
    
     -- Excess air, check range
    LAMBDA = {default = 2, min = 1.5, max = 2.5, unit = '-', status = 'CST'}
  ]]--
}

-- ##RESULTS:  List of the OFF tags computed by vali 
sofc.outputs = { -- doc 
  
 		-- description
		--PH2_T= {unit = 'C '},

    -- description
	--[[	FC_C_1_T= {unit = 'K '},
    
		-- description
		FC_C_2_T= {unit = 'K '},
    
    -- description
		FC_C_4_T= {unit = 'K '},
    
     -- description
		FC_A_3_T= {unit = 'K '},
    
    -- description
		FC_COUT_T= {unit = 'K '},
    
    -- description
		FC_AOUT_T= {unit = 'K '},
    
		-- description
    FC_Q_1_LOAD= {unit = 'kW '},

		-- description
		FC_Q_2_LOAD= {unit = 'kW '},

		-- description
		FC_Q_3_LOAD= {unit = 'kW '},
    
    		-- description
		FC_Q_4_LOAD= {unit = 'kW '}
		]]--
}

-- ##ADVANCED
sofc.advanced = {  
  -- Heat transfer film coefficient of water is used for all stream definitions.
  -- [math][/math]
  water_h = {default = 1.136, min = 1, max = 2, unit = 'kW/m2 C'},


	h_prod =  {default = 1.136, min = 1, max = 2, unit = 'kW/m2 C'},
} 




-- Streams
-- adding the stream to the unit 
-- BE SURE THAT ALL THE TAGS ARE DEFINED IN THE vali model!!!
-- BE sure about the definition of the signs of the heat streams !
-- be sure that all the vali tag have the right unit!, [K], [kW] ..
-- evap.addUnit("evap_1_effect",type = "Process",IN) -- Flag : IN or OUT

-- FUEL CELL
sofc:addUnit("FC",{ type = "Process"}) 
    sofc["FC"]:addStreams {    
  fc_q_1={ 1000,100,150,0,5, 'h_prod'}

-- fc_q_1={ 'SR_OUT_T','FC_Q_1_LOAD','FC_A_1_T',0,5, 'h_prod'}
 --fc_q_2={ 'FC_C_1_T','FC_Q_2_LOAD','FC_C_2_T',0,5, 'h_prod'},
 --fc_q_3={ 'FC_AOUT_T','FC_Q_3_LOAD','FC_A_1_T',0,5, 'h_prod'},
 --fc_q_4={ 'FC_COUT_T','FC_Q_4_LOAD','FC_C_2_T',0,5, 'h_prod'}
 }
 --technology.EI.Streams(ns).Short = {'qt','FC','fc_q_1test','@SR_OUT_T','@FC_Q_1_LOAD','@FC_A_1_T',0,5};
 
 
 --technology.EI.Streams(ns).Short = {'qt','FC','fc_q_2test','@FC_C_1_T','@FC_Q_2_LOAD','@FC_C_2_T',0,5}; 
  

 --technology.EI.Streams(ns).Short = {'qt','FC','fc_q_3test','@FC_AOUT_T','@FC_Q_3_LOAD','@FC_A_1_T',0,5}; 
 
 
 --technology.EI.Streams(ns).Short = {'qt','FC','fc_q_4test','@FC_COUT_T','@FC_Q_4_LOAD','@FC_C_2_T',0,5}; 
 
  --    prod_preheat_1 =  { 'PIN_T',0,'PH1_T','CPI_LOAD',3, 'h_prod'},  -- what is the 3 ema? whta is h prod? how does it correspond to the dtmin and where?
  --    prod_preheat_2 =  { 'PIN_T','CPI_LOAD','PH1_T',0,3, 'h_prod'},
  --    prod_preheat_5 = { 'PH1_T', 0,'PH2_T','QCC1_LOAD', 3,'water_h'},
  --    prod_preheat_6 =  { 'PH3_T','Q_THERM_LOAD','PH2_T',0, 3, 'water_h'}}
    -- evap["evap_1_effect"]:addStreams {      
    --   prod_preheat_1 =  { 36,0,36.01,'CPI_LOAD',3, 'h_prod'},
    --   prod_preheat_5 = { 36, 0,'PH2_T','QCC1_LOAD', 3,'water_h'},
    --   prod_preheat_6 =  { 'PH3_T','Q_THERM_LOAD','PH2_T',0, 3, 'water_h'}}

return sofc

