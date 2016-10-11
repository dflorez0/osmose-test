function FictCityA_postCompute(project)
  print('POST COMPUTE:\n')

  -------------------
  -- Example BEGIN --
  -------------------
  -- Unit ouputs : Mult and Use factors
  -- UnitNameAlt = project:getUnit('[project name]_[cluster name]_[location name]_[model name]_[unit name]')
  -- UnitNameAlt_mult = UnitNameAlt.Units_Mult_t[1]
  -- UnitNameAlt_use = UnitNameAlt.Units_Use_t[1]

  -- Get input/output value
  -- InputName = project:getTag('[location name].[model name].[input name]',[period],[time])
  -- OuputName = project:getTag('[location name].[model name].[input name]',[period],[time])

  -- Output to csv file
  --[[
  results='Indicator name;Value;Unit\n'
  results=results..'Indicator1;'..tostring(Indicator1_value)..';MW\n'
  results=results..'Indicator2;'..tostring(Indicator2_value)..';MWh\n'

  fid = io.open ('PathOfCurrentFrontend\\outputFileName.csv', 'w')

  fid:write(results)

  fid:close()
  ]]
  -----------------
  -- Example END --
  -----------------

  for is=1,#project.scenarios do

  ------------
  -- Zone 1 --
  ------------
  
  -- Gas boiler
  gb_c1 = project:getUnit('test_investRoadmap_c1_c1_gas_boil_GasBoiler',is)
  gb_c1_Pmax = project:getTag('c1.gas_boil.QMAXTOT')
  -- Design
  gb_c1_P1 = gb_c1.Units_Mult[1]*gb_c1_Pmax
  gb_c1_P2 = gb_c1.Units_Mult[2]*gb_c1_Pmax
  gb_c1_P3 = gb_c1.Units_Mult[3]*gb_c1_Pmax
  gb_c1_P4 = gb_c1.Units_Mult[4]*gb_c1_Pmax
  -- Operation
  gb_c1_T1 = gb_c1.Units_Mult_t[1]*gb_c1_Pmax
  gb_c1_T2 = gb_c1.Units_Mult_t[2]*gb_c1_Pmax
  gb_c1_T3 = gb_c1.Units_Mult_t[3]*gb_c1_Pmax
  gb_c1_T4 = gb_c1.Units_Mult_t[4]*gb_c1_Pmax
  gb_c1_T5 = gb_c1.Units_Mult_t[5]*gb_c1_Pmax
  gb_c1_T6 = gb_c1.Units_Mult_t[6]*gb_c1_Pmax
  gb_c1_T7 = gb_c1.Units_Mult_t[7]*gb_c1_Pmax
  gb_c1_T8 = gb_c1.Units_Mult_t[8]*gb_c1_Pmax
  gb_c1_T9 = gb_c1.Units_Mult_t[9]*gb_c1_Pmax
  gb_c1_T10 = gb_c1.Units_Mult_t[10]*gb_c1_Pmax
  gb_c1_T11 = gb_c1.Units_Mult_t[11]*gb_c1_Pmax
  gb_c1_T12 = gb_c1.Units_Mult_t[12]*gb_c1_Pmax
  gb_c1_T13 = gb_c1.Units_Mult_t[13]*gb_c1_Pmax
  gb_c1_T14 = gb_c1.Units_Mult_t[14]*gb_c1_Pmax
  gb_c1_T15 = gb_c1.Units_Mult_t[15]*gb_c1_Pmax
  gb_c1_T16 = gb_c1.Units_Mult_t[16]*gb_c1_Pmax
  
  -- CHP
  chp_c1 = project:getUnit('test_investRoadmap_c1_c1_gas_chp_GasCHP',is)
  chp_c1_Pmax = project:getTag('c1.gas_chp.QMAXTOT')
  -- Design
  chp_c1_P1 = chp_c1.Units_Mult[1]*chp_c1_Pmax
  chp_c1_P2 = chp_c1.Units_Mult[2]*chp_c1_Pmax
  chp_c1_P3 = chp_c1.Units_Mult[3]*chp_c1_Pmax
  chp_c1_P4 = chp_c1.Units_Mult[4]*chp_c1_Pmax
  -- Operation
  chp_c1_T1 = chp_c1.Units_Mult_t[1]*chp_c1_Pmax
  chp_c1_T2 = chp_c1.Units_Mult_t[2]*chp_c1_Pmax
  chp_c1_T3 = chp_c1.Units_Mult_t[3]*chp_c1_Pmax
  chp_c1_T4 = chp_c1.Units_Mult_t[4]*chp_c1_Pmax
  chp_c1_T5 = chp_c1.Units_Mult_t[5]*chp_c1_Pmax
  chp_c1_T6 = chp_c1.Units_Mult_t[6]*chp_c1_Pmax
  chp_c1_T7 = chp_c1.Units_Mult_t[7]*chp_c1_Pmax
  chp_c1_T8 = chp_c1.Units_Mult_t[8]*chp_c1_Pmax
  chp_c1_T9 = chp_c1.Units_Mult_t[9]*chp_c1_Pmax
  chp_c1_T10 = chp_c1.Units_Mult_t[10]*chp_c1_Pmax
  chp_c1_T11 = chp_c1.Units_Mult_t[11]*chp_c1_Pmax
  chp_c1_T12 = chp_c1.Units_Mult_t[12]*chp_c1_Pmax
  chp_c1_T13 = chp_c1.Units_Mult_t[13]*chp_c1_Pmax
  chp_c1_T14 = chp_c1.Units_Mult_t[14]*chp_c1_Pmax
  chp_c1_T15 = chp_c1.Units_Mult_t[15]*chp_c1_Pmax
  chp_c1_T16 = chp_c1.Units_Mult_t[16]*chp_c1_Pmax
  
  -- Biomass
  bio_c1 = project:getUnit('test_investRoadmap_c1_c1_bm_boil_BiomassBoiler',is)
  bio_c1_Pmax = project:getTag('c1.bm_boil.QMAXTOT')
  -- Design
  bio_c1_P1 = bio_c1.Units_Mult[1]*bio_c1_Pmax
  bio_c1_P2 = bio_c1.Units_Mult[2]*bio_c1_Pmax
  bio_c1_P3 = bio_c1.Units_Mult[3]*bio_c1_Pmax
  bio_c1_P4 = bio_c1.Units_Mult[4]*bio_c1_Pmax
  -- Operation
  bio_c1_T1 = bio_c1.Units_Mult_t[1]*bio_c1_Pmax
  bio_c1_T2 = bio_c1.Units_Mult_t[2]*bio_c1_Pmax
  bio_c1_T3 = bio_c1.Units_Mult_t[3]*bio_c1_Pmax
  bio_c1_T4 = bio_c1.Units_Mult_t[4]*bio_c1_Pmax
  bio_c1_T5 = bio_c1.Units_Mult_t[5]*bio_c1_Pmax
  bio_c1_T6 = bio_c1.Units_Mult_t[6]*bio_c1_Pmax
  bio_c1_T7 = bio_c1.Units_Mult_t[7]*bio_c1_Pmax
  bio_c1_T8 = bio_c1.Units_Mult_t[8]*bio_c1_Pmax
  bio_c1_T9 = bio_c1.Units_Mult_t[9]*bio_c1_Pmax
  bio_c1_T10 = bio_c1.Units_Mult_t[10]*bio_c1_Pmax
  bio_c1_T11 = bio_c1.Units_Mult_t[11]*bio_c1_Pmax
  bio_c1_T12 = bio_c1.Units_Mult_t[12]*bio_c1_Pmax
  bio_c1_T13 = bio_c1.Units_Mult_t[13]*bio_c1_Pmax
  bio_c1_T14 = bio_c1.Units_Mult_t[14]*bio_c1_Pmax
  bio_c1_T15 = bio_c1.Units_Mult_t[15]*bio_c1_Pmax
  bio_c1_T16 = bio_c1.Units_Mult_t[16]*bio_c1_Pmax
  
  -- Geothermal
  geohp_c1 = project:getUnit('test_investRoadmap_c1_c1_geo_hp_HP',is)
  geohp_c1_Pmax = project:getTag('c1.geo_hp.QMAXCOND')
  -- Design
  geohp_c1_P1 = geohp_c1.Units_Mult[1]*geohp_c1_Pmax
  geohp_c1_P2 = geohp_c1.Units_Mult[2]*geohp_c1_Pmax
  geohp_c1_P3 = geohp_c1.Units_Mult[3]*geohp_c1_Pmax
  geohp_c1_P4 = geohp_c1.Units_Mult[4]*geohp_c1_Pmax
  -- Operation
  geohp_c1_T1 = geohp_c1.Units_Mult_t[1]*geohp_c1_Pmax
  geohp_c1_T2 = geohp_c1.Units_Mult_t[2]*geohp_c1_Pmax
  geohp_c1_T3 = geohp_c1.Units_Mult_t[3]*geohp_c1_Pmax
  geohp_c1_T4 = geohp_c1.Units_Mult_t[4]*geohp_c1_Pmax
  geohp_c1_T5 = geohp_c1.Units_Mult_t[5]*geohp_c1_Pmax
  geohp_c1_T6 = geohp_c1.Units_Mult_t[6]*geohp_c1_Pmax
  geohp_c1_T7 = geohp_c1.Units_Mult_t[7]*geohp_c1_Pmax
  geohp_c1_T8 = geohp_c1.Units_Mult_t[8]*geohp_c1_Pmax
  geohp_c1_T9 = geohp_c1.Units_Mult_t[9]*geohp_c1_Pmax
  geohp_c1_T10 = geohp_c1.Units_Mult_t[10]*geohp_c1_Pmax
  geohp_c1_T11 = geohp_c1.Units_Mult_t[11]*geohp_c1_Pmax
  geohp_c1_T12 = geohp_c1.Units_Mult_t[12]*geohp_c1_Pmax
  geohp_c1_T13 = geohp_c1.Units_Mult_t[13]*geohp_c1_Pmax
  geohp_c1_T14 = geohp_c1.Units_Mult_t[14]*geohp_c1_Pmax
  geohp_c1_T15 = geohp_c1.Units_Mult_t[15]*geohp_c1_Pmax
  geohp_c1_T16 = geohp_c1.Units_Mult_t[16]*geohp_c1_Pmax
  
  
  ------------
  -- Zone 2 --
  ------------
  
  -- Gas boiler
  gb_c2 = project:getUnit('test_investRoadmap_c2_c2_gas_boil_GasBoiler',is)
  gb_c2_Pmax = project:getTag('c2.gas_boil.QMAXTOT')
  -- Design
  gb_c2_P1 = gb_c2.Units_Mult[1]*gb_c2_Pmax
  gb_c2_P2 = gb_c2.Units_Mult[2]*gb_c2_Pmax
  gb_c2_P3 = gb_c2.Units_Mult[3]*gb_c2_Pmax
  gb_c2_P4 = gb_c2.Units_Mult[4]*gb_c2_Pmax
  -- Operation
  gb_c2_T1 = gb_c2.Units_Mult_t[1]*gb_c2_Pmax
  gb_c2_T2 = gb_c2.Units_Mult_t[2]*gb_c2_Pmax
  gb_c2_T3 = gb_c2.Units_Mult_t[3]*gb_c2_Pmax
  gb_c2_T4 = gb_c2.Units_Mult_t[4]*gb_c2_Pmax
  gb_c2_T5 = gb_c2.Units_Mult_t[5]*gb_c2_Pmax
  gb_c2_T6 = gb_c2.Units_Mult_t[6]*gb_c2_Pmax
  gb_c2_T7 = gb_c2.Units_Mult_t[7]*gb_c2_Pmax
  gb_c2_T8 = gb_c2.Units_Mult_t[8]*gb_c2_Pmax
  gb_c2_T9 = gb_c2.Units_Mult_t[9]*gb_c2_Pmax
  gb_c2_T10 = gb_c2.Units_Mult_t[10]*gb_c2_Pmax
  gb_c2_T11 = gb_c2.Units_Mult_t[11]*gb_c2_Pmax
  gb_c2_T12 = gb_c2.Units_Mult_t[12]*gb_c2_Pmax
  gb_c2_T13 = gb_c2.Units_Mult_t[13]*gb_c2_Pmax
  gb_c2_T14 = gb_c2.Units_Mult_t[14]*gb_c2_Pmax
  gb_c2_T15 = gb_c2.Units_Mult_t[15]*gb_c2_Pmax
  gb_c2_T16 = gb_c2.Units_Mult_t[16]*gb_c2_Pmax
  
  -- CHP
  chp_c2 = project:getUnit('test_investRoadmap_c2_c2_gas_chp_GasCHP',is)
  chp_c2_Pmax = project:getTag('c2.gas_chp.QMAXTOT')
  -- Design
  chp_c2_P1 = chp_c2.Units_Mult[1]*chp_c2_Pmax
  chp_c2_P2 = chp_c2.Units_Mult[2]*chp_c2_Pmax
  chp_c2_P3 = chp_c2.Units_Mult[3]*chp_c2_Pmax
  chp_c2_P4 = chp_c2.Units_Mult[4]*chp_c2_Pmax
  -- Operation
  chp_c2_T1 = chp_c2.Units_Mult_t[1]*chp_c2_Pmax
  chp_c2_T2 = chp_c2.Units_Mult_t[2]*chp_c2_Pmax
  chp_c2_T3 = chp_c2.Units_Mult_t[3]*chp_c2_Pmax
  chp_c2_T4 = chp_c2.Units_Mult_t[4]*chp_c2_Pmax
  chp_c2_T5 = chp_c2.Units_Mult_t[5]*chp_c2_Pmax
  chp_c2_T6 = chp_c2.Units_Mult_t[6]*chp_c2_Pmax
  chp_c2_T7 = chp_c2.Units_Mult_t[7]*chp_c2_Pmax
  chp_c2_T8 = chp_c2.Units_Mult_t[8]*chp_c2_Pmax
  chp_c2_T9 = chp_c2.Units_Mult_t[9]*chp_c2_Pmax
  chp_c2_T10 = chp_c2.Units_Mult_t[10]*chp_c2_Pmax
  chp_c2_T11 = chp_c2.Units_Mult_t[11]*chp_c2_Pmax
  chp_c2_T12 = chp_c2.Units_Mult_t[12]*chp_c2_Pmax
  chp_c2_T13 = chp_c2.Units_Mult_t[13]*chp_c2_Pmax
  chp_c2_T14 = chp_c2.Units_Mult_t[14]*chp_c2_Pmax
  chp_c2_T15 = chp_c2.Units_Mult_t[15]*chp_c2_Pmax
  chp_c2_T16 = chp_c2.Units_Mult_t[16]*chp_c2_Pmax
  
  -- Biomass
  bio_c2 = project:getUnit('test_investRoadmap_c2_c2_bm_boil_BiomassBoiler',is)
  bio_c2_Pmax = project:getTag('c2.bm_boil.QMAXTOT')
  -- Design
  bio_c2_P1 = bio_c2.Units_Mult[1]*bio_c2_Pmax
  bio_c2_P2 = bio_c2.Units_Mult[2]*bio_c2_Pmax
  bio_c2_P3 = bio_c2.Units_Mult[3]*bio_c2_Pmax
  bio_c2_P4 = bio_c2.Units_Mult[4]*bio_c2_Pmax
  -- Operation
  bio_c2_T1 = bio_c2.Units_Mult_t[1]*bio_c2_Pmax
  bio_c2_T2 = bio_c2.Units_Mult_t[2]*bio_c2_Pmax
  bio_c2_T3 = bio_c2.Units_Mult_t[3]*bio_c2_Pmax
  bio_c2_T4 = bio_c2.Units_Mult_t[4]*bio_c2_Pmax
  bio_c2_T5 = bio_c2.Units_Mult_t[5]*bio_c2_Pmax
  bio_c2_T6 = bio_c2.Units_Mult_t[6]*bio_c2_Pmax
  bio_c2_T7 = bio_c2.Units_Mult_t[7]*bio_c2_Pmax
  bio_c2_T8 = bio_c2.Units_Mult_t[8]*bio_c2_Pmax
  bio_c2_T9 = bio_c2.Units_Mult_t[9]*bio_c2_Pmax
  bio_c2_T10 = bio_c2.Units_Mult_t[10]*bio_c2_Pmax
  bio_c2_T11 = bio_c2.Units_Mult_t[11]*bio_c2_Pmax
  bio_c2_T12 = bio_c2.Units_Mult_t[12]*bio_c2_Pmax
  bio_c2_T13 = bio_c2.Units_Mult_t[13]*bio_c2_Pmax
  bio_c2_T14 = bio_c2.Units_Mult_t[14]*bio_c2_Pmax
  bio_c2_T15 = bio_c2.Units_Mult_t[15]*bio_c2_Pmax
  bio_c2_T16 = bio_c2.Units_Mult_t[16]*bio_c2_Pmax
  
  
  ------------
  -- Zone 3 --
  ------------
  
  -- Gas boiler
  gb_c3 = project:getUnit('test_investRoadmap_c3_c3_gas_boil_GasBoiler',is)
  gb_c3_Pmax = project:getTag('c3.gas_boil.QMAXTOT')
  -- Design
  gb_c3_P1 = gb_c3.Units_Mult[1]*gb_c3_Pmax
  gb_c3_P2 = gb_c3.Units_Mult[2]*gb_c3_Pmax
  gb_c3_P3 = gb_c3.Units_Mult[3]*gb_c3_Pmax
  gb_c3_P4 = gb_c3.Units_Mult[4]*gb_c3_Pmax
  -- Operation
  gb_c3_T1 = gb_c3.Units_Mult_t[1]*gb_c3_Pmax
  gb_c3_T2 = gb_c3.Units_Mult_t[2]*gb_c3_Pmax
  gb_c3_T3 = gb_c3.Units_Mult_t[3]*gb_c3_Pmax
  gb_c3_T4 = gb_c3.Units_Mult_t[4]*gb_c3_Pmax
  gb_c3_T5 = gb_c3.Units_Mult_t[5]*gb_c3_Pmax
  gb_c3_T6 = gb_c3.Units_Mult_t[6]*gb_c3_Pmax
  gb_c3_T7 = gb_c3.Units_Mult_t[7]*gb_c3_Pmax
  gb_c3_T8 = gb_c3.Units_Mult_t[8]*gb_c3_Pmax
  gb_c3_T9 = gb_c3.Units_Mult_t[9]*gb_c3_Pmax
  gb_c3_T10 = gb_c3.Units_Mult_t[10]*gb_c3_Pmax
  gb_c3_T11 = gb_c3.Units_Mult_t[11]*gb_c3_Pmax
  gb_c3_T12 = gb_c3.Units_Mult_t[12]*gb_c3_Pmax
  gb_c3_T13 = gb_c3.Units_Mult_t[13]*gb_c3_Pmax
  gb_c3_T14 = gb_c3.Units_Mult_t[14]*gb_c3_Pmax
  gb_c3_T15 = gb_c3.Units_Mult_t[15]*gb_c3_Pmax
  gb_c3_T16 = gb_c3.Units_Mult_t[16]*gb_c3_Pmax
  
  -- CHP
  chp_c3 = project:getUnit('test_investRoadmap_c3_c3_gas_chp_GasCHP',is)
  chp_c3_Pmax = project:getTag('c3.gas_chp.QMAXTOT')
  -- Design
  chp_c3_P1 = chp_c3.Units_Mult[1]*chp_c3_Pmax
  chp_c3_P2 = chp_c3.Units_Mult[2]*chp_c3_Pmax
  chp_c3_P3 = chp_c3.Units_Mult[3]*chp_c3_Pmax
  chp_c3_P4 = chp_c3.Units_Mult[4]*chp_c3_Pmax
  -- Operation
  chp_c3_T1 = chp_c3.Units_Mult_t[1]*chp_c3_Pmax
  chp_c3_T2 = chp_c3.Units_Mult_t[2]*chp_c3_Pmax
  chp_c3_T3 = chp_c3.Units_Mult_t[3]*chp_c3_Pmax
  chp_c3_T4 = chp_c3.Units_Mult_t[4]*chp_c3_Pmax
  chp_c3_T5 = chp_c3.Units_Mult_t[5]*chp_c3_Pmax
  chp_c3_T6 = chp_c3.Units_Mult_t[6]*chp_c3_Pmax
  chp_c3_T7 = chp_c3.Units_Mult_t[7]*chp_c3_Pmax
  chp_c3_T8 = chp_c3.Units_Mult_t[8]*chp_c3_Pmax
  chp_c3_T9 = chp_c3.Units_Mult_t[9]*chp_c3_Pmax
  chp_c3_T10 = chp_c3.Units_Mult_t[10]*chp_c3_Pmax
  chp_c3_T11 = chp_c3.Units_Mult_t[11]*chp_c3_Pmax
  chp_c3_T12 = chp_c3.Units_Mult_t[12]*chp_c3_Pmax
  chp_c3_T13 = chp_c3.Units_Mult_t[13]*chp_c3_Pmax
  chp_c3_T14 = chp_c3.Units_Mult_t[14]*chp_c3_Pmax
  chp_c3_T15 = chp_c3.Units_Mult_t[15]*chp_c3_Pmax
  chp_c3_T16 = chp_c3.Units_Mult_t[16]*chp_c3_Pmax
  
  -- Biomass
  bio_c3 = project:getUnit('test_investRoadmap_c3_c3_bm_boil_BiomassBoiler',is)
  bio_c3_Pmax = project:getTag('c3.bm_boil.QMAXTOT')
  -- Design
  bio_c3_P1 = bio_c3.Units_Mult[1]*bio_c3_Pmax
  bio_c3_P2 = bio_c3.Units_Mult[2]*bio_c3_Pmax
  bio_c3_P3 = bio_c3.Units_Mult[3]*bio_c3_Pmax
  bio_c3_P4 = bio_c3.Units_Mult[4]*bio_c3_Pmax
  -- Operation
  bio_c3_T1 = bio_c3.Units_Mult_t[1]*bio_c3_Pmax
  bio_c3_T2 = bio_c3.Units_Mult_t[2]*bio_c3_Pmax
  bio_c3_T3 = bio_c3.Units_Mult_t[3]*bio_c3_Pmax
  bio_c3_T4 = bio_c3.Units_Mult_t[4]*bio_c3_Pmax
  bio_c3_T5 = bio_c3.Units_Mult_t[5]*bio_c3_Pmax
  bio_c3_T6 = bio_c3.Units_Mult_t[6]*bio_c3_Pmax
  bio_c3_T7 = bio_c3.Units_Mult_t[7]*bio_c3_Pmax
  bio_c3_T8 = bio_c3.Units_Mult_t[8]*bio_c3_Pmax
  bio_c3_T9 = bio_c3.Units_Mult_t[9]*bio_c3_Pmax
  bio_c3_T10 = bio_c3.Units_Mult_t[10]*bio_c3_Pmax
  bio_c3_T11 = bio_c3.Units_Mult_t[11]*bio_c3_Pmax
  bio_c3_T12 = bio_c3.Units_Mult_t[12]*bio_c3_Pmax
  bio_c3_T13 = bio_c3.Units_Mult_t[13]*bio_c3_Pmax
  bio_c3_T14 = bio_c3.Units_Mult_t[14]*bio_c3_Pmax
  bio_c3_T15 = bio_c3.Units_Mult_t[15]*bio_c3_Pmax
  bio_c3_T16 = bio_c3.Units_Mult_t[16]*bio_c3_Pmax
  
  -- Hydrothermal
  hydhp_c3 = project:getUnit('test_investRoadmap_c3_c3_hyd_hp_HP',is)
  hydhp_c3_Pmax = project:getTag('c3.hyd_hp.QMAXCOND')
  -- Design
  hydhp_c3_P1 = hydhp_c3.Units_Mult[1]*hydhp_c3_Pmax
  hydhp_c3_P2 = hydhp_c3.Units_Mult[2]*hydhp_c3_Pmax
  hydhp_c3_P3 = hydhp_c3.Units_Mult[3]*hydhp_c3_Pmax
  hydhp_c3_P4 = hydhp_c3.Units_Mult[4]*hydhp_c3_Pmax
  -- Operation
  hydhp_c3_T1 = hydhp_c3.Units_Mult_t[1]*hydhp_c3_Pmax
  hydhp_c3_T2 = hydhp_c3.Units_Mult_t[2]*hydhp_c3_Pmax
  hydhp_c3_T3 = hydhp_c3.Units_Mult_t[3]*hydhp_c3_Pmax
  hydhp_c3_T4 = hydhp_c3.Units_Mult_t[4]*hydhp_c3_Pmax
  hydhp_c3_T5 = hydhp_c3.Units_Mult_t[5]*hydhp_c3_Pmax
  hydhp_c3_T6 = hydhp_c3.Units_Mult_t[6]*hydhp_c3_Pmax
  hydhp_c3_T7 = hydhp_c3.Units_Mult_t[7]*hydhp_c3_Pmax
  hydhp_c3_T8 = hydhp_c3.Units_Mult_t[8]*hydhp_c3_Pmax
  hydhp_c3_T9 = hydhp_c3.Units_Mult_t[9]*hydhp_c3_Pmax
  hydhp_c3_T10 = hydhp_c3.Units_Mult_t[10]*hydhp_c3_Pmax
  hydhp_c3_T11 = hydhp_c3.Units_Mult_t[11]*hydhp_c3_Pmax
  hydhp_c3_T12 = hydhp_c3.Units_Mult_t[12]*hydhp_c3_Pmax
  hydhp_c3_T13 = hydhp_c3.Units_Mult_t[13]*hydhp_c3_Pmax
  hydhp_c3_T14 = hydhp_c3.Units_Mult_t[14]*hydhp_c3_Pmax
  hydhp_c3_T15 = hydhp_c3.Units_Mult_t[15]*hydhp_c3_Pmax
  hydhp_c3_T16 = hydhp_c3.Units_Mult_t[16]*hydhp_c3_Pmax
  
  -- Industrial heat recovery
  hts_c3 = project:getUnit('test_investRoadmap_c3_c3_hts_HTS',is)
  ind_c3 = project:getUnit('test_investRoadmap_c3_c3_ind_IndRec',is)
  hts_c3_Pmax = project:getTag('c3.hts.QMAXTOT',is)
  -- Design
  hts_c3_P1 = hts_c3.Units_Mult[1]*hts_c3_Pmax
  hts_c3_P2 = hts_c3.Units_Mult[2]*hts_c3_Pmax
  hts_c3_P3 = hts_c3.Units_Mult[3]*hts_c3_Pmax
  hts_c3_P4 = hts_c3.Units_Mult[4]*hts_c3_Pmax
  -- Operation
  ind_c3_T1 = ind_c3.Units_Mult_t[1]*project:getTag('c3.ind.HEAT_AVAIL',is,1)
  ind_c3_T2 = ind_c3.Units_Mult_t[2]*project:getTag('c3.ind.HEAT_AVAIL',is,2)
  ind_c3_T3 = ind_c3.Units_Mult_t[3]*project:getTag('c3.ind.HEAT_AVAIL',is,3)
  ind_c3_T4 = ind_c3.Units_Mult_t[4]*project:getTag('c3.ind.HEAT_AVAIL',is,4)
  ind_c3_T5 = ind_c3.Units_Mult_t[5]*project:getTag('c3.ind.HEAT_AVAIL',is,5)
  ind_c3_T6 = ind_c3.Units_Mult_t[6]*project:getTag('c3.ind.HEAT_AVAIL',is,6)
  ind_c3_T7 = ind_c3.Units_Mult_t[7]*project:getTag('c3.ind.HEAT_AVAIL',is,7)
  ind_c3_T8 = ind_c3.Units_Mult_t[8]*project:getTag('c3.ind.HEAT_AVAIL',is,8)
  ind_c3_T9 = ind_c3.Units_Mult_t[9]*project:getTag('c3.ind.HEAT_AVAIL',is,9)
  ind_c3_T10 = ind_c3.Units_Mult_t[10]*project:getTag('c3.ind.HEAT_AVAIL',is,10)
  ind_c3_T11 = ind_c3.Units_Mult_t[11]*project:getTag('c3.ind.HEAT_AVAIL',is,11)
  ind_c3_T12 = ind_c3.Units_Mult_t[12]*project:getTag('c3.ind.HEAT_AVAIL',is,12)
  ind_c3_T13 = ind_c3.Units_Mult_t[13]*project:getTag('c3.ind.HEAT_AVAIL',is,13)
  ind_c3_T14 = ind_c3.Units_Mult_t[14]*project:getTag('c3.ind.HEAT_AVAIL',is,14)
  ind_c3_T15 = ind_c3.Units_Mult_t[15]*project:getTag('c3.ind.HEAT_AVAIL',is,15)
  ind_c3_T16 = ind_c3.Units_Mult_t[16]*project:getTag('c3.ind.HEAT_AVAIL',is,16)
  
  
  ------------
  -- Zone 4 --
  ------------
  
  -- Gas boiler
  gb_c4 = project:getUnit('test_investRoadmap_c4_c4_gas_boil_GasBoiler',is)
  gb_c4_Pmax = project:getTag('c4.gas_boil.QMAXTOT')
  -- Design
  gb_c4_P1 = gb_c4.Units_Mult[1]*gb_c4_Pmax
  gb_c4_P2 = gb_c4.Units_Mult[2]*gb_c4_Pmax
  gb_c4_P3 = gb_c4.Units_Mult[3]*gb_c4_Pmax
  gb_c4_P4 = gb_c4.Units_Mult[4]*gb_c4_Pmax
  -- Operation
  gb_c4_T1 = gb_c4.Units_Mult_t[1]*gb_c4_Pmax
  gb_c4_T2 = gb_c4.Units_Mult_t[2]*gb_c4_Pmax
  gb_c4_T3 = gb_c4.Units_Mult_t[3]*gb_c4_Pmax
  gb_c4_T4 = gb_c4.Units_Mult_t[4]*gb_c4_Pmax
  gb_c4_T5 = gb_c4.Units_Mult_t[5]*gb_c4_Pmax
  gb_c4_T6 = gb_c4.Units_Mult_t[6]*gb_c4_Pmax
  gb_c4_T7 = gb_c4.Units_Mult_t[7]*gb_c4_Pmax
  gb_c4_T8 = gb_c4.Units_Mult_t[8]*gb_c4_Pmax
  gb_c4_T9 = gb_c4.Units_Mult_t[9]*gb_c4_Pmax
  gb_c4_T10 = gb_c4.Units_Mult_t[10]*gb_c4_Pmax
  gb_c4_T11 = gb_c4.Units_Mult_t[11]*gb_c4_Pmax
  gb_c4_T12 = gb_c4.Units_Mult_t[12]*gb_c4_Pmax
  gb_c4_T13 = gb_c4.Units_Mult_t[13]*gb_c4_Pmax
  gb_c4_T14 = gb_c4.Units_Mult_t[14]*gb_c4_Pmax
  gb_c4_T15 = gb_c4.Units_Mult_t[15]*gb_c4_Pmax
  gb_c4_T16 = gb_c4.Units_Mult_t[16]*gb_c4_Pmax
  
  -- CHP
  chp_c4 = project:getUnit('test_investRoadmap_c4_c4_gas_chp_GasCHP',is)
  chp_c4_Pmax = project:getTag('c4.gas_chp.QMAXTOT')
  -- Design
  chp_c4_P1 = chp_c4.Units_Mult[1]*chp_c4_Pmax
  chp_c4_P2 = chp_c4.Units_Mult[2]*chp_c4_Pmax
  chp_c4_P3 = chp_c4.Units_Mult[3]*chp_c4_Pmax
  chp_c4_P4 = chp_c4.Units_Mult[4]*chp_c4_Pmax
  -- Operation
  chp_c4_T1 = chp_c4.Units_Mult_t[1]*chp_c4_Pmax
  chp_c4_T2 = chp_c4.Units_Mult_t[2]*chp_c4_Pmax
  chp_c4_T3 = chp_c4.Units_Mult_t[3]*chp_c4_Pmax
  chp_c4_T4 = chp_c4.Units_Mult_t[4]*chp_c4_Pmax
  chp_c4_T5 = chp_c4.Units_Mult_t[5]*chp_c4_Pmax
  chp_c4_T6 = chp_c4.Units_Mult_t[6]*chp_c4_Pmax
  chp_c4_T7 = chp_c4.Units_Mult_t[7]*chp_c4_Pmax
  chp_c4_T8 = chp_c4.Units_Mult_t[8]*chp_c4_Pmax
  chp_c4_T9 = chp_c4.Units_Mult_t[9]*chp_c4_Pmax
  chp_c4_T10 = chp_c4.Units_Mult_t[10]*chp_c4_Pmax
  chp_c4_T11 = chp_c4.Units_Mult_t[11]*chp_c4_Pmax
  chp_c4_T12 = chp_c4.Units_Mult_t[12]*chp_c4_Pmax
  chp_c4_T13 = chp_c4.Units_Mult_t[13]*chp_c4_Pmax
  chp_c4_T14 = chp_c4.Units_Mult_t[14]*chp_c4_Pmax
  chp_c4_T15 = chp_c4.Units_Mult_t[15]*chp_c4_Pmax
  chp_c4_T16 = chp_c4.Units_Mult_t[16]*chp_c4_Pmax
  
  
  -- Geothermal
  geohp_c4 = project:getUnit('test_investRoadmap_c4_c4_geo_hp_HP',is)
  geohp_c4_Pmax = project:getTag('c4.geo_hp.QMAXCOND')
  -- Design
  geohp_c4_P1 = geohp_c4.Units_Mult[1]*geohp_c4_Pmax
  geohp_c4_P2 = geohp_c4.Units_Mult[2]*geohp_c4_Pmax
  geohp_c4_P3 = geohp_c4.Units_Mult[3]*geohp_c4_Pmax
  geohp_c4_P4 = geohp_c4.Units_Mult[4]*geohp_c4_Pmax
  -- Operation
  geohp_c4_T1 = geohp_c4.Units_Mult_t[1]*geohp_c4_Pmax
  geohp_c4_T2 = geohp_c4.Units_Mult_t[2]*geohp_c4_Pmax
  geohp_c4_T3 = geohp_c4.Units_Mult_t[3]*geohp_c4_Pmax
  geohp_c4_T4 = geohp_c4.Units_Mult_t[4]*geohp_c4_Pmax
  geohp_c4_T5 = geohp_c4.Units_Mult_t[5]*geohp_c4_Pmax
  geohp_c4_T6 = geohp_c4.Units_Mult_t[6]*geohp_c4_Pmax
  geohp_c4_T7 = geohp_c4.Units_Mult_t[7]*geohp_c4_Pmax
  geohp_c4_T8 = geohp_c4.Units_Mult_t[8]*geohp_c4_Pmax
  geohp_c4_T9 = geohp_c4.Units_Mult_t[9]*geohp_c4_Pmax
  geohp_c4_T10 = geohp_c4.Units_Mult_t[10]*geohp_c4_Pmax
  geohp_c4_T11 = geohp_c4.Units_Mult_t[11]*geohp_c4_Pmax
  geohp_c4_T12 = geohp_c4.Units_Mult_t[12]*geohp_c4_Pmax
  geohp_c4_T13 = geohp_c4.Units_Mult_t[13]*geohp_c4_Pmax
  geohp_c4_T14 = geohp_c4.Units_Mult_t[14]*geohp_c4_Pmax
  geohp_c4_T15 = geohp_c4.Units_Mult_t[15]*geohp_c4_Pmax
  geohp_c4_T16 = geohp_c4.Units_Mult_t[16]*geohp_c4_Pmax
  
  
  ------------
  -- Zone 5 --
  ------------
  
  -- Gas boiler
  gb_c5 = project:getUnit('test_investRoadmap_c5_c5_gas_boil_GasBoiler',is)
  gb_c5_Pmax = project:getTag('c5.gas_boil.QMAXTOT')
  -- Design
  gb_c5_P1 = gb_c5.Units_Mult[1]*gb_c5_Pmax
  gb_c5_P2 = gb_c5.Units_Mult[2]*gb_c5_Pmax
  gb_c5_P3 = gb_c5.Units_Mult[3]*gb_c5_Pmax
  gb_c5_P4 = gb_c5.Units_Mult[4]*gb_c5_Pmax
  -- Operation
  gb_c5_T1 = gb_c5.Units_Mult_t[1]*gb_c5_Pmax
  gb_c5_T2 = gb_c5.Units_Mult_t[2]*gb_c5_Pmax
  gb_c5_T3 = gb_c5.Units_Mult_t[3]*gb_c5_Pmax
  gb_c5_T4 = gb_c5.Units_Mult_t[4]*gb_c5_Pmax
  gb_c5_T5 = gb_c5.Units_Mult_t[5]*gb_c5_Pmax
  gb_c5_T6 = gb_c5.Units_Mult_t[6]*gb_c5_Pmax
  gb_c5_T7 = gb_c5.Units_Mult_t[7]*gb_c5_Pmax
  gb_c5_T8 = gb_c5.Units_Mult_t[8]*gb_c5_Pmax
  gb_c5_T9 = gb_c5.Units_Mult_t[9]*gb_c5_Pmax
  gb_c5_T10 = gb_c5.Units_Mult_t[10]*gb_c5_Pmax
  gb_c5_T11 = gb_c5.Units_Mult_t[11]*gb_c5_Pmax
  gb_c5_T12 = gb_c5.Units_Mult_t[12]*gb_c5_Pmax
  gb_c5_T13 = gb_c5.Units_Mult_t[13]*gb_c5_Pmax
  gb_c5_T14 = gb_c5.Units_Mult_t[14]*gb_c5_Pmax
  gb_c5_T15 = gb_c5.Units_Mult_t[15]*gb_c5_Pmax
  gb_c5_T16 = gb_c5.Units_Mult_t[16]*gb_c5_Pmax
  
  -- CHP
  chp_c5 = project:getUnit('test_investRoadmap_c5_c5_gas_chp_GasCHP',is)
  chp_c5_Pmax = project:getTag('c5.gas_chp.QMAXTOT')
  -- Design
  chp_c5_P1 = chp_c5.Units_Mult[1]*chp_c5_Pmax
  chp_c5_P2 = chp_c5.Units_Mult[2]*chp_c5_Pmax
  chp_c5_P3 = chp_c5.Units_Mult[3]*chp_c5_Pmax
  chp_c5_P4 = chp_c5.Units_Mult[4]*chp_c5_Pmax
  -- Operation
  chp_c5_T1 = chp_c5.Units_Mult_t[1]*chp_c5_Pmax
  chp_c5_T2 = chp_c5.Units_Mult_t[2]*chp_c5_Pmax
  chp_c5_T3 = chp_c5.Units_Mult_t[3]*chp_c5_Pmax
  chp_c5_T4 = chp_c5.Units_Mult_t[4]*chp_c5_Pmax
  chp_c5_T5 = chp_c5.Units_Mult_t[5]*chp_c5_Pmax
  chp_c5_T6 = chp_c5.Units_Mult_t[6]*chp_c5_Pmax
  chp_c5_T7 = chp_c5.Units_Mult_t[7]*chp_c5_Pmax
  chp_c5_T8 = chp_c5.Units_Mult_t[8]*chp_c5_Pmax
  chp_c5_T9 = chp_c5.Units_Mult_t[9]*chp_c5_Pmax
  chp_c5_T10 = chp_c5.Units_Mult_t[10]*chp_c5_Pmax
  chp_c5_T11 = chp_c5.Units_Mult_t[11]*chp_c5_Pmax
  chp_c5_T12 = chp_c5.Units_Mult_t[12]*chp_c5_Pmax
  chp_c5_T13 = chp_c5.Units_Mult_t[13]*chp_c5_Pmax
  chp_c5_T14 = chp_c5.Units_Mult_t[14]*chp_c5_Pmax
  chp_c5_T15 = chp_c5.Units_Mult_t[15]*chp_c5_Pmax
  chp_c5_T16 = chp_c5.Units_Mult_t[16]*chp_c5_Pmax
  
  -- Biomass
  bio_c5 = project:getUnit('test_investRoadmap_c5_c5_bm_boil_BiomassBoiler',is)
  bio_c5_Pmax = project:getTag('c5.bm_boil.QMAXTOT')
  -- Design
  bio_c5_P1 = bio_c5.Units_Mult[1]*bio_c5_Pmax
  bio_c5_P2 = bio_c5.Units_Mult[2]*bio_c5_Pmax
  bio_c5_P3 = bio_c5.Units_Mult[3]*bio_c5_Pmax
  bio_c5_P4 = bio_c5.Units_Mult[4]*bio_c5_Pmax
  -- Operation
  bio_c5_T1 = bio_c5.Units_Mult_t[1]*bio_c5_Pmax
  bio_c5_T2 = bio_c5.Units_Mult_t[2]*bio_c5_Pmax
  bio_c5_T3 = bio_c5.Units_Mult_t[3]*bio_c5_Pmax
  bio_c5_T4 = bio_c5.Units_Mult_t[4]*bio_c5_Pmax
  bio_c5_T5 = bio_c5.Units_Mult_t[5]*bio_c5_Pmax
  bio_c5_T6 = bio_c5.Units_Mult_t[6]*bio_c5_Pmax
  bio_c5_T7 = bio_c5.Units_Mult_t[7]*bio_c5_Pmax
  bio_c5_T8 = bio_c5.Units_Mult_t[8]*bio_c5_Pmax
  bio_c5_T9 = bio_c5.Units_Mult_t[9]*bio_c5_Pmax
  bio_c5_T10 = bio_c5.Units_Mult_t[10]*bio_c5_Pmax
  bio_c5_T11 = bio_c5.Units_Mult_t[11]*bio_c5_Pmax
  bio_c5_T12 = bio_c5.Units_Mult_t[12]*bio_c5_Pmax
  bio_c5_T13 = bio_c5.Units_Mult_t[13]*bio_c5_Pmax
  bio_c5_T14 = bio_c5.Units_Mult_t[14]*bio_c5_Pmax
  bio_c5_T15 = bio_c5.Units_Mult_t[15]*bio_c5_Pmax
  bio_c5_T16 = bio_c5.Units_Mult_t[16]*bio_c5_Pmax
  
  -- Geothermal
  geohp_c5 = project:getUnit('test_investRoadmap_c5_c5_geo_hp_HP',is)
  geohp_c5_Pmax = project:getTag('c5.geo_hp.QMAXCOND')
  -- Design
  geohp_c5_P1 = geohp_c5.Units_Mult[1]*geohp_c5_Pmax
  geohp_c5_P2 = geohp_c5.Units_Mult[2]*geohp_c5_Pmax
  geohp_c5_P3 = geohp_c5.Units_Mult[3]*geohp_c5_Pmax
  geohp_c5_P4 = geohp_c5.Units_Mult[4]*geohp_c5_Pmax
  -- Operation
  geohp_c5_T1 = geohp_c5.Units_Mult_t[1]*geohp_c5_Pmax
  geohp_c5_T2 = geohp_c5.Units_Mult_t[2]*geohp_c5_Pmax
  geohp_c5_T3 = geohp_c5.Units_Mult_t[3]*geohp_c5_Pmax
  geohp_c5_T4 = geohp_c5.Units_Mult_t[4]*geohp_c5_Pmax
  geohp_c5_T5 = geohp_c5.Units_Mult_t[5]*geohp_c5_Pmax
  geohp_c5_T6 = geohp_c5.Units_Mult_t[6]*geohp_c5_Pmax
  geohp_c5_T7 = geohp_c5.Units_Mult_t[7]*geohp_c5_Pmax
  geohp_c5_T8 = geohp_c5.Units_Mult_t[8]*geohp_c5_Pmax
  geohp_c5_T9 = geohp_c5.Units_Mult_t[9]*geohp_c5_Pmax
  geohp_c5_T10 = geohp_c5.Units_Mult_t[10]*geohp_c5_Pmax
  geohp_c5_T11 = geohp_c5.Units_Mult_t[11]*geohp_c5_Pmax
  geohp_c5_T12 = geohp_c5.Units_Mult_t[12]*geohp_c5_Pmax
  geohp_c5_T13 = geohp_c5.Units_Mult_t[13]*geohp_c5_Pmax
  geohp_c5_T14 = geohp_c5.Units_Mult_t[14]*geohp_c5_Pmax
  geohp_c5_T15 = geohp_c5.Units_Mult_t[15]*geohp_c5_Pmax
  geohp_c5_T16 = geohp_c5.Units_Mult_t[16]*geohp_c5_Pmax
  
  -- Industrial heat recovery
  hts_c5 = project:getUnit('test_investRoadmap_c5_c5_hts_HTS',is)
  hts_c5_Pmax = project:getTag('c5.hts.QMAXTOT',is)
  -- Design (industry + mswi)
  hts_c5_P1 = hts_c5.Units_Mult[1]*hts_c5_Pmax
  hts_c5_P2 = hts_c5.Units_Mult[2]*hts_c5_Pmax
  hts_c5_P3 = hts_c5.Units_Mult[3]*hts_c5_Pmax
  hts_c5_P4 = hts_c5.Units_Mult[4]*hts_c5_Pmax
  -- Operation (industry)
  ind_c5 = project:getUnit('test_investRoadmap_c5_c5_ind_IndRec',is)
  ind_c5_T1 = ind_c5.Units_Mult_t[1]*project:getTag('c5.ind.HEAT_AVAIL',is,1)
  ind_c5_T2 = ind_c5.Units_Mult_t[2]*project:getTag('c5.ind.HEAT_AVAIL',is,2)
  ind_c5_T3 = ind_c5.Units_Mult_t[3]*project:getTag('c5.ind.HEAT_AVAIL',is,3)
  ind_c5_T4 = ind_c5.Units_Mult_t[4]*project:getTag('c5.ind.HEAT_AVAIL',is,4)
  ind_c5_T5 = ind_c5.Units_Mult_t[5]*project:getTag('c5.ind.HEAT_AVAIL',is,5)
  ind_c5_T6 = ind_c5.Units_Mult_t[6]*project:getTag('c5.ind.HEAT_AVAIL',is,6)
  ind_c5_T7 = ind_c5.Units_Mult_t[7]*project:getTag('c5.ind.HEAT_AVAIL',is,7)
  ind_c5_T8 = ind_c5.Units_Mult_t[8]*project:getTag('c5.ind.HEAT_AVAIL',is,8)
  ind_c5_T9 = ind_c5.Units_Mult_t[9]*project:getTag('c5.ind.HEAT_AVAIL',is,9)
  ind_c5_T10 = ind_c5.Units_Mult_t[10]*project:getTag('c5.ind.HEAT_AVAIL',is,10)
  ind_c5_T11 = ind_c5.Units_Mult_t[11]*project:getTag('c5.ind.HEAT_AVAIL',is,11)
  ind_c5_T12 = ind_c5.Units_Mult_t[12]*project:getTag('c5.ind.HEAT_AVAIL',is,12)
  ind_c5_T13 = ind_c5.Units_Mult_t[13]*project:getTag('c5.ind.HEAT_AVAIL',is,13)
  ind_c5_T14 = ind_c5.Units_Mult_t[14]*project:getTag('c5.ind.HEAT_AVAIL',is,14)
  ind_c5_T15 = ind_c5.Units_Mult_t[15]*project:getTag('c5.ind.HEAT_AVAIL',is,15)
  ind_c5_T16 = ind_c5.Units_Mult_t[16]*project:getTag('c5.ind.HEAT_AVAIL',is,16)
  -- Operation (MSWI)
  mswi_c5 = project:getUnit('test_investRoadmap_c5_c5_mswi_IndRec',is)
  mswi_c5_T1 = mswi_c5.Units_Mult_t[1]*project:getTag('c5.mswi.HEAT_AVAIL',is,1)
  mswi_c5_T2 = mswi_c5.Units_Mult_t[2]*project:getTag('c5.mswi.HEAT_AVAIL',is,2)
  mswi_c5_T3 = mswi_c5.Units_Mult_t[3]*project:getTag('c5.mswi.HEAT_AVAIL',is,3)
  mswi_c5_T4 = mswi_c5.Units_Mult_t[4]*project:getTag('c5.mswi.HEAT_AVAIL',is,4)
  mswi_c5_T5 = mswi_c5.Units_Mult_t[5]*project:getTag('c5.mswi.HEAT_AVAIL',is,5)
  mswi_c5_T6 = mswi_c5.Units_Mult_t[6]*project:getTag('c5.mswi.HEAT_AVAIL',is,6)
  mswi_c5_T7 = mswi_c5.Units_Mult_t[7]*project:getTag('c5.mswi.HEAT_AVAIL',is,7)
  mswi_c5_T8 = mswi_c5.Units_Mult_t[8]*project:getTag('c5.mswi.HEAT_AVAIL',is,8)
  mswi_c5_T9 = mswi_c5.Units_Mult_t[9]*project:getTag('c5.mswi.HEAT_AVAIL',is,9)
  mswi_c5_T10 = mswi_c5.Units_Mult_t[10]*project:getTag('c5.mswi.HEAT_AVAIL',is,10)
  mswi_c5_T11 = mswi_c5.Units_Mult_t[11]*project:getTag('c5.mswi.HEAT_AVAIL',is,11)
  mswi_c5_T12 = mswi_c5.Units_Mult_t[12]*project:getTag('c5.mswi.HEAT_AVAIL',is,12)
  mswi_c5_T13 = mswi_c5.Units_Mult_t[13]*project:getTag('c5.mswi.HEAT_AVAIL',is,13)
  mswi_c5_T14 = mswi_c5.Units_Mult_t[14]*project:getTag('c5.mswi.HEAT_AVAIL',is,14)
  mswi_c5_T15 = mswi_c5.Units_Mult_t[15]*project:getTag('c5.mswi.HEAT_AVAIL',is,15)
  mswi_c5_T16 = mswi_c5.Units_Mult_t[16]*project:getTag('c5.mswi.HEAT_AVAIL',is,16)
  

  --------------
  -- Networks --
  --------------
  
  dhn_Pmax = project:getTag('ext.dhn.PMAX')
  -- C1 <-> C2
  dhn_c1_c2 = project:getUnit('test_investRoadmap_ext_ext_dhn_DHN_C1_C2',is)
  ht_c1_c2 = project:getUnit('test_investRoadmap_c1_c1_dhn_con_DHN_Export',is)
  ht_c2_c1 = project:getUnit('test_investRoadmap_c1_c1_dhn_con_DHN_Import',is)
  -- Design
  dhn_c1_c2_P1 = dhn_c1_c2.Units_Mult[1]*dhn_Pmax
  dhn_c1_c2_P2 = dhn_c1_c2.Units_Mult[2]*dhn_Pmax
  dhn_c1_c2_P3 = dhn_c1_c2.Units_Mult[3]*dhn_Pmax
  dhn_c1_c2_P4 = dhn_c1_c2.Units_Mult[4]*dhn_Pmax
  -- Operation
  ht_c1_c2_T1 = ht_c1_c2.Units_Mult_t[1]*dhn_Pmax
  ht_c1_c2_T2 = ht_c1_c2.Units_Mult_t[2]*dhn_Pmax
  ht_c1_c2_T3 = ht_c1_c2.Units_Mult_t[3]*dhn_Pmax
  ht_c1_c2_T4 = ht_c1_c2.Units_Mult_t[4]*dhn_Pmax
  ht_c1_c2_T5 = ht_c1_c2.Units_Mult_t[5]*dhn_Pmax
  ht_c1_c2_T6 = ht_c1_c2.Units_Mult_t[6]*dhn_Pmax
  ht_c1_c2_T7 = ht_c1_c2.Units_Mult_t[7]*dhn_Pmax
  ht_c1_c2_T8 = ht_c1_c2.Units_Mult_t[8]*dhn_Pmax
  ht_c1_c2_T9 = ht_c1_c2.Units_Mult_t[9]*dhn_Pmax
  ht_c1_c2_T10 = ht_c1_c2.Units_Mult_t[10]*dhn_Pmax
  ht_c1_c2_T11 = ht_c1_c2.Units_Mult_t[11]*dhn_Pmax
  ht_c1_c2_T12 = ht_c1_c2.Units_Mult_t[12]*dhn_Pmax
  ht_c1_c2_T13 = ht_c1_c2.Units_Mult_t[13]*dhn_Pmax
  ht_c1_c2_T14 = ht_c1_c2.Units_Mult_t[14]*dhn_Pmax
  ht_c1_c2_T15 = ht_c1_c2.Units_Mult_t[15]*dhn_Pmax
  ht_c1_c2_T16 = ht_c1_c2.Units_Mult_t[16]*dhn_Pmax

  ht_c2_c1_T1 = ht_c2_c1.Units_Mult_t[1]*dhn_Pmax
  ht_c2_c1_T2 = ht_c2_c1.Units_Mult_t[2]*dhn_Pmax
  ht_c2_c1_T3 = ht_c2_c1.Units_Mult_t[3]*dhn_Pmax
  ht_c2_c1_T4 = ht_c2_c1.Units_Mult_t[4]*dhn_Pmax
  ht_c2_c1_T5 = ht_c2_c1.Units_Mult_t[5]*dhn_Pmax
  ht_c2_c1_T6 = ht_c2_c1.Units_Mult_t[6]*dhn_Pmax
  ht_c2_c1_T7 = ht_c2_c1.Units_Mult_t[7]*dhn_Pmax
  ht_c2_c1_T8 = ht_c2_c1.Units_Mult_t[8]*dhn_Pmax
  ht_c2_c1_T9 = ht_c2_c1.Units_Mult_t[9]*dhn_Pmax
  ht_c2_c1_T10 = ht_c2_c1.Units_Mult_t[10]*dhn_Pmax
  ht_c2_c1_T11 = ht_c2_c1.Units_Mult_t[11]*dhn_Pmax
  ht_c2_c1_T12 = ht_c2_c1.Units_Mult_t[12]*dhn_Pmax
  ht_c2_c1_T13 = ht_c2_c1.Units_Mult_t[13]*dhn_Pmax
  ht_c2_c1_T14 = ht_c2_c1.Units_Mult_t[14]*dhn_Pmax
  ht_c2_c1_T15 = ht_c2_c1.Units_Mult_t[15]*dhn_Pmax
  ht_c2_c1_T16 = ht_c2_c1.Units_Mult_t[16]*dhn_Pmax
  
  -- C1 <-> C4
  dhn_c1_c4 = project:getUnit('test_investRoadmap_ext_ext_dhn_DHN_C1_C4',is)
  ht_c1_c4 = project:getUnit('test_investRoadmap_c1_c1_dhn_con_DHN_Export',is)
  ht_c4_c1 = project:getUnit('test_investRoadmap_c1_c1_dhn_con_DHN_Import',is)
  -- Design
  dhn_c1_c4_P1 = dhn_c1_c4.Units_Mult[1]*dhn_Pmax
  dhn_c1_c4_P2 = dhn_c1_c4.Units_Mult[2]*dhn_Pmax
  dhn_c1_c4_P3 = dhn_c1_c4.Units_Mult[3]*dhn_Pmax
  dhn_c1_c4_P4 = dhn_c1_c4.Units_Mult[4]*dhn_Pmax
  -- Operation
  ht_c1_c4_T1 = ht_c1_c4.Units_Mult_t[1]*dhn_Pmax
  ht_c1_c4_T2 = ht_c1_c4.Units_Mult_t[2]*dhn_Pmax
  ht_c1_c4_T3 = ht_c1_c4.Units_Mult_t[3]*dhn_Pmax
  ht_c1_c4_T4 = ht_c1_c4.Units_Mult_t[4]*dhn_Pmax
  ht_c1_c4_T5 = ht_c1_c4.Units_Mult_t[5]*dhn_Pmax
  ht_c1_c4_T6 = ht_c1_c4.Units_Mult_t[6]*dhn_Pmax
  ht_c1_c4_T7 = ht_c1_c4.Units_Mult_t[7]*dhn_Pmax
  ht_c1_c4_T8 = ht_c1_c4.Units_Mult_t[8]*dhn_Pmax
  ht_c1_c4_T9 = ht_c1_c4.Units_Mult_t[9]*dhn_Pmax
  ht_c1_c4_T10 = ht_c1_c4.Units_Mult_t[10]*dhn_Pmax
  ht_c1_c4_T11 = ht_c1_c4.Units_Mult_t[11]*dhn_Pmax
  ht_c1_c4_T12 = ht_c1_c4.Units_Mult_t[12]*dhn_Pmax
  ht_c1_c4_T13 = ht_c1_c4.Units_Mult_t[13]*dhn_Pmax
  ht_c1_c4_T14 = ht_c1_c4.Units_Mult_t[14]*dhn_Pmax
  ht_c1_c4_T15 = ht_c1_c4.Units_Mult_t[15]*dhn_Pmax
  ht_c1_c4_T16 = ht_c1_c4.Units_Mult_t[16]*dhn_Pmax

  ht_c4_c1_T1 = ht_c4_c1.Units_Mult_t[1]*dhn_Pmax
  ht_c4_c1_T2 = ht_c4_c1.Units_Mult_t[2]*dhn_Pmax
  ht_c4_c1_T3 = ht_c4_c1.Units_Mult_t[3]*dhn_Pmax
  ht_c4_c1_T4 = ht_c4_c1.Units_Mult_t[4]*dhn_Pmax
  ht_c4_c1_T5 = ht_c4_c1.Units_Mult_t[5]*dhn_Pmax
  ht_c4_c1_T6 = ht_c4_c1.Units_Mult_t[6]*dhn_Pmax
  ht_c4_c1_T7 = ht_c4_c1.Units_Mult_t[7]*dhn_Pmax
  ht_c4_c1_T8 = ht_c4_c1.Units_Mult_t[8]*dhn_Pmax
  ht_c4_c1_T9 = ht_c4_c1.Units_Mult_t[9]*dhn_Pmax
  ht_c4_c1_T10 = ht_c4_c1.Units_Mult_t[10]*dhn_Pmax
  ht_c4_c1_T11 = ht_c4_c1.Units_Mult_t[11]*dhn_Pmax
  ht_c4_c1_T12 = ht_c4_c1.Units_Mult_t[12]*dhn_Pmax
  ht_c4_c1_T13 = ht_c4_c1.Units_Mult_t[13]*dhn_Pmax
  ht_c4_c1_T14 = ht_c4_c1.Units_Mult_t[14]*dhn_Pmax
  ht_c4_c1_T15 = ht_c4_c1.Units_Mult_t[15]*dhn_Pmax
  ht_c4_c1_T16 = ht_c4_c1.Units_Mult_t[16]*dhn_Pmax
  
  -- C1 <-> C5
  dhn_c1_c5 = project:getUnit('test_investRoadmap_ext_ext_dhn_DHN_C1_C5',is)
  ht_c1_c5 = project:getUnit('test_investRoadmap_c1_c1_dhn_con_DHN_Export',is)
  ht_c5_c1 = project:getUnit('test_investRoadmap_c1_c1_dhn_con_DHN_Import',is)
  -- Design
  dhn_c1_c5_P1 = dhn_c1_c5.Units_Mult[1]*dhn_Pmax
  dhn_c1_c5_P2 = dhn_c1_c5.Units_Mult[2]*dhn_Pmax
  dhn_c1_c5_P3 = dhn_c1_c5.Units_Mult[3]*dhn_Pmax
  dhn_c1_c5_P4 = dhn_c1_c5.Units_Mult[4]*dhn_Pmax
  -- Operation
  ht_c1_c5_T1 = ht_c1_c5.Units_Mult_t[1]*dhn_Pmax
  ht_c1_c5_T2 = ht_c1_c5.Units_Mult_t[2]*dhn_Pmax
  ht_c1_c5_T3 = ht_c1_c5.Units_Mult_t[3]*dhn_Pmax
  ht_c1_c5_T4 = ht_c1_c5.Units_Mult_t[4]*dhn_Pmax
  ht_c1_c5_T5 = ht_c1_c5.Units_Mult_t[5]*dhn_Pmax
  ht_c1_c5_T6 = ht_c1_c5.Units_Mult_t[6]*dhn_Pmax
  ht_c1_c5_T7 = ht_c1_c5.Units_Mult_t[7]*dhn_Pmax
  ht_c1_c5_T8 = ht_c1_c5.Units_Mult_t[8]*dhn_Pmax
  ht_c1_c5_T9 = ht_c1_c5.Units_Mult_t[9]*dhn_Pmax
  ht_c1_c5_T10 = ht_c1_c5.Units_Mult_t[10]*dhn_Pmax
  ht_c1_c5_T11 = ht_c1_c5.Units_Mult_t[11]*dhn_Pmax
  ht_c1_c5_T12 = ht_c1_c5.Units_Mult_t[12]*dhn_Pmax
  ht_c1_c5_T13 = ht_c1_c5.Units_Mult_t[13]*dhn_Pmax
  ht_c1_c5_T14 = ht_c1_c5.Units_Mult_t[14]*dhn_Pmax
  ht_c1_c5_T15 = ht_c1_c5.Units_Mult_t[15]*dhn_Pmax
  ht_c1_c5_T16 = ht_c1_c5.Units_Mult_t[16]*dhn_Pmax

  ht_c5_c1_T1 = ht_c5_c1.Units_Mult_t[1]*dhn_Pmax
  ht_c5_c1_T2 = ht_c5_c1.Units_Mult_t[2]*dhn_Pmax
  ht_c5_c1_T3 = ht_c5_c1.Units_Mult_t[3]*dhn_Pmax
  ht_c5_c1_T4 = ht_c5_c1.Units_Mult_t[4]*dhn_Pmax
  ht_c5_c1_T5 = ht_c5_c1.Units_Mult_t[5]*dhn_Pmax
  ht_c5_c1_T6 = ht_c5_c1.Units_Mult_t[6]*dhn_Pmax
  ht_c5_c1_T7 = ht_c5_c1.Units_Mult_t[7]*dhn_Pmax
  ht_c5_c1_T8 = ht_c5_c1.Units_Mult_t[8]*dhn_Pmax
  ht_c5_c1_T9 = ht_c5_c1.Units_Mult_t[9]*dhn_Pmax
  ht_c5_c1_T10 = ht_c5_c1.Units_Mult_t[10]*dhn_Pmax
  ht_c5_c1_T11 = ht_c5_c1.Units_Mult_t[11]*dhn_Pmax
  ht_c5_c1_T12 = ht_c5_c1.Units_Mult_t[12]*dhn_Pmax
  ht_c5_c1_T13 = ht_c5_c1.Units_Mult_t[13]*dhn_Pmax
  ht_c5_c1_T14 = ht_c5_c1.Units_Mult_t[14]*dhn_Pmax
  ht_c5_c1_T15 = ht_c5_c1.Units_Mult_t[15]*dhn_Pmax
  ht_c5_c1_T16 = ht_c5_c1.Units_Mult_t[16]*dhn_Pmax
  
  -- C2 <-> C3
  dhn_c2_c3 = project:getUnit('test_investRoadmap_ext_ext_dhn_DHN_C2_C3',is)
  ht_c2_c3 = project:getUnit('test_investRoadmap_c2_c2_dhn_con_DHN_Export',is)
  ht_c3_c2 = project:getUnit('test_investRoadmap_c2_c2_dhn_con_DHN_Import',is)
  -- Design
  dhn_c2_c3_P1 = dhn_c2_c3.Units_Mult[1]*dhn_Pmax
  dhn_c2_c3_P2 = dhn_c2_c3.Units_Mult[2]*dhn_Pmax
  dhn_c2_c3_P3 = dhn_c2_c3.Units_Mult[3]*dhn_Pmax
  dhn_c2_c3_P4 = dhn_c2_c3.Units_Mult[4]*dhn_Pmax
  -- Operation
  ht_c2_c3_T1 = ht_c2_c3.Units_Mult_t[1]*dhn_Pmax
  ht_c2_c3_T2 = ht_c2_c3.Units_Mult_t[2]*dhn_Pmax
  ht_c2_c3_T3 = ht_c2_c3.Units_Mult_t[3]*dhn_Pmax
  ht_c2_c3_T4 = ht_c2_c3.Units_Mult_t[4]*dhn_Pmax
  ht_c2_c3_T5 = ht_c2_c3.Units_Mult_t[5]*dhn_Pmax
  ht_c2_c3_T6 = ht_c2_c3.Units_Mult_t[6]*dhn_Pmax
  ht_c2_c3_T7 = ht_c2_c3.Units_Mult_t[7]*dhn_Pmax
  ht_c2_c3_T8 = ht_c2_c3.Units_Mult_t[8]*dhn_Pmax
  ht_c2_c3_T9 = ht_c2_c3.Units_Mult_t[9]*dhn_Pmax
  ht_c2_c3_T10 = ht_c2_c3.Units_Mult_t[10]*dhn_Pmax
  ht_c2_c3_T11 = ht_c2_c3.Units_Mult_t[11]*dhn_Pmax
  ht_c2_c3_T12 = ht_c2_c3.Units_Mult_t[12]*dhn_Pmax
  ht_c2_c3_T13 = ht_c2_c3.Units_Mult_t[13]*dhn_Pmax
  ht_c2_c3_T14 = ht_c2_c3.Units_Mult_t[14]*dhn_Pmax
  ht_c2_c3_T15 = ht_c2_c3.Units_Mult_t[15]*dhn_Pmax
  ht_c2_c3_T16 = ht_c2_c3.Units_Mult_t[16]*dhn_Pmax

  ht_c3_c2_T1 = ht_c3_c2.Units_Mult_t[1]*dhn_Pmax
  ht_c3_c2_T2 = ht_c3_c2.Units_Mult_t[2]*dhn_Pmax
  ht_c3_c2_T3 = ht_c3_c2.Units_Mult_t[3]*dhn_Pmax
  ht_c3_c2_T4 = ht_c3_c2.Units_Mult_t[4]*dhn_Pmax
  ht_c3_c2_T5 = ht_c3_c2.Units_Mult_t[5]*dhn_Pmax
  ht_c3_c2_T6 = ht_c3_c2.Units_Mult_t[6]*dhn_Pmax
  ht_c3_c2_T7 = ht_c3_c2.Units_Mult_t[7]*dhn_Pmax
  ht_c3_c2_T8 = ht_c3_c2.Units_Mult_t[8]*dhn_Pmax
  ht_c3_c2_T9 = ht_c3_c2.Units_Mult_t[9]*dhn_Pmax
  ht_c3_c2_T10 = ht_c3_c2.Units_Mult_t[10]*dhn_Pmax
  ht_c3_c2_T11 = ht_c3_c2.Units_Mult_t[11]*dhn_Pmax
  ht_c3_c2_T12 = ht_c3_c2.Units_Mult_t[12]*dhn_Pmax
  ht_c3_c2_T13 = ht_c3_c2.Units_Mult_t[13]*dhn_Pmax
  ht_c3_c2_T14 = ht_c3_c2.Units_Mult_t[14]*dhn_Pmax
  ht_c3_c2_T15 = ht_c3_c2.Units_Mult_t[15]*dhn_Pmax
  ht_c3_c2_T16 = ht_c3_c2.Units_Mult_t[16]*dhn_Pmax
  
  -- C2 <-> C4
  dhn_c2_c4 = project:getUnit('test_investRoadmap_ext_ext_dhn_DHN_C2_C4',is)
  ht_c2_c4 = project:getUnit('test_investRoadmap_c2_c2_dhn_con_DHN_Export',is)
  ht_c4_c2 = project:getUnit('test_investRoadmap_c2_c2_dhn_con_DHN_Import',is)
  -- Design
  dhn_c2_c4_P1 = dhn_c2_c4.Units_Mult[1]*dhn_Pmax
  dhn_c2_c4_P2 = dhn_c2_c4.Units_Mult[2]*dhn_Pmax
  dhn_c2_c4_P3 = dhn_c2_c4.Units_Mult[3]*dhn_Pmax
  dhn_c2_c4_P4 = dhn_c2_c4.Units_Mult[4]*dhn_Pmax
  -- Operation
  ht_c2_c4_T1 = ht_c2_c4.Units_Mult_t[1]*dhn_Pmax
  ht_c2_c4_T2 = ht_c2_c4.Units_Mult_t[2]*dhn_Pmax
  ht_c2_c4_T3 = ht_c2_c4.Units_Mult_t[3]*dhn_Pmax
  ht_c2_c4_T4 = ht_c2_c4.Units_Mult_t[4]*dhn_Pmax
  ht_c2_c4_T5 = ht_c2_c4.Units_Mult_t[5]*dhn_Pmax
  ht_c2_c4_T6 = ht_c2_c4.Units_Mult_t[6]*dhn_Pmax
  ht_c2_c4_T7 = ht_c2_c4.Units_Mult_t[7]*dhn_Pmax
  ht_c2_c4_T8 = ht_c2_c4.Units_Mult_t[8]*dhn_Pmax
  ht_c2_c4_T9 = ht_c2_c4.Units_Mult_t[9]*dhn_Pmax
  ht_c2_c4_T10 = ht_c2_c4.Units_Mult_t[10]*dhn_Pmax
  ht_c2_c4_T11 = ht_c2_c4.Units_Mult_t[11]*dhn_Pmax
  ht_c2_c4_T12 = ht_c2_c4.Units_Mult_t[12]*dhn_Pmax
  ht_c2_c4_T13 = ht_c2_c4.Units_Mult_t[13]*dhn_Pmax
  ht_c2_c4_T14 = ht_c2_c4.Units_Mult_t[14]*dhn_Pmax
  ht_c2_c4_T15 = ht_c2_c4.Units_Mult_t[15]*dhn_Pmax
  ht_c2_c4_T16 = ht_c2_c4.Units_Mult_t[16]*dhn_Pmax

  ht_c4_c2_T1 = ht_c4_c2.Units_Mult_t[1]*dhn_Pmax
  ht_c4_c2_T2 = ht_c4_c2.Units_Mult_t[2]*dhn_Pmax
  ht_c4_c2_T3 = ht_c4_c2.Units_Mult_t[3]*dhn_Pmax
  ht_c4_c2_T4 = ht_c4_c2.Units_Mult_t[4]*dhn_Pmax
  ht_c4_c2_T5 = ht_c4_c2.Units_Mult_t[5]*dhn_Pmax
  ht_c4_c2_T6 = ht_c4_c2.Units_Mult_t[6]*dhn_Pmax
  ht_c4_c2_T7 = ht_c4_c2.Units_Mult_t[7]*dhn_Pmax
  ht_c4_c2_T8 = ht_c4_c2.Units_Mult_t[8]*dhn_Pmax
  ht_c4_c2_T9 = ht_c4_c2.Units_Mult_t[9]*dhn_Pmax
  ht_c4_c2_T10 = ht_c4_c2.Units_Mult_t[10]*dhn_Pmax
  ht_c4_c2_T11 = ht_c4_c2.Units_Mult_t[11]*dhn_Pmax
  ht_c4_c2_T12 = ht_c4_c2.Units_Mult_t[12]*dhn_Pmax
  ht_c4_c2_T13 = ht_c4_c2.Units_Mult_t[13]*dhn_Pmax
  ht_c4_c2_T14 = ht_c4_c2.Units_Mult_t[14]*dhn_Pmax
  ht_c4_c2_T15 = ht_c4_c2.Units_Mult_t[15]*dhn_Pmax
  ht_c4_c2_T16 = ht_c4_c2.Units_Mult_t[16]*dhn_Pmax
  
  -- C3 <-> C4
  dhn_c3_c4 = project:getUnit('test_investRoadmap_ext_ext_dhn_DHN_C3_C4',is)
  ht_c3_c4 = project:getUnit('test_investRoadmap_c3_c3_dhn_con_DHN_Export',is)
  ht_c4_c3 = project:getUnit('test_investRoadmap_c3_c3_dhn_con_DHN_Import',is)
  -- Design
  dhn_c3_c4_P1 = dhn_c3_c4.Units_Mult[1]*dhn_Pmax
  dhn_c3_c4_P2 = dhn_c3_c4.Units_Mult[2]*dhn_Pmax
  dhn_c3_c4_P3 = dhn_c3_c4.Units_Mult[3]*dhn_Pmax
  dhn_c3_c4_P4 = dhn_c3_c4.Units_Mult[4]*dhn_Pmax
  -- Operation
  ht_c3_c4_T1 = ht_c3_c4.Units_Mult_t[1]*dhn_Pmax
  ht_c3_c4_T2 = ht_c3_c4.Units_Mult_t[2]*dhn_Pmax
  ht_c3_c4_T3 = ht_c3_c4.Units_Mult_t[3]*dhn_Pmax
  ht_c3_c4_T4 = ht_c3_c4.Units_Mult_t[4]*dhn_Pmax
  ht_c3_c4_T5 = ht_c3_c4.Units_Mult_t[5]*dhn_Pmax
  ht_c3_c4_T6 = ht_c3_c4.Units_Mult_t[6]*dhn_Pmax
  ht_c3_c4_T7 = ht_c3_c4.Units_Mult_t[7]*dhn_Pmax
  ht_c3_c4_T8 = ht_c3_c4.Units_Mult_t[8]*dhn_Pmax
  ht_c3_c4_T9 = ht_c3_c4.Units_Mult_t[9]*dhn_Pmax
  ht_c3_c4_T10 = ht_c3_c4.Units_Mult_t[10]*dhn_Pmax
  ht_c3_c4_T11 = ht_c3_c4.Units_Mult_t[11]*dhn_Pmax
  ht_c3_c4_T12 = ht_c3_c4.Units_Mult_t[12]*dhn_Pmax
  ht_c3_c4_T13 = ht_c3_c4.Units_Mult_t[13]*dhn_Pmax
  ht_c3_c4_T14 = ht_c3_c4.Units_Mult_t[14]*dhn_Pmax
  ht_c3_c4_T15 = ht_c3_c4.Units_Mult_t[15]*dhn_Pmax
  ht_c3_c4_T16 = ht_c3_c4.Units_Mult_t[16]*dhn_Pmax

  ht_c4_c3_T1 = ht_c4_c3.Units_Mult_t[1]*dhn_Pmax
  ht_c4_c3_T2 = ht_c4_c3.Units_Mult_t[2]*dhn_Pmax
  ht_c4_c3_T3 = ht_c4_c3.Units_Mult_t[3]*dhn_Pmax
  ht_c4_c3_T4 = ht_c4_c3.Units_Mult_t[4]*dhn_Pmax
  ht_c4_c3_T5 = ht_c4_c3.Units_Mult_t[5]*dhn_Pmax
  ht_c4_c3_T6 = ht_c4_c3.Units_Mult_t[6]*dhn_Pmax
  ht_c4_c3_T7 = ht_c4_c3.Units_Mult_t[7]*dhn_Pmax
  ht_c4_c3_T8 = ht_c4_c3.Units_Mult_t[8]*dhn_Pmax
  ht_c4_c3_T9 = ht_c4_c3.Units_Mult_t[9]*dhn_Pmax
  ht_c4_c3_T10 = ht_c4_c3.Units_Mult_t[10]*dhn_Pmax
  ht_c4_c3_T11 = ht_c4_c3.Units_Mult_t[11]*dhn_Pmax
  ht_c4_c3_T12 = ht_c4_c3.Units_Mult_t[12]*dhn_Pmax
  ht_c4_c3_T13 = ht_c4_c3.Units_Mult_t[13]*dhn_Pmax
  ht_c4_c3_T14 = ht_c4_c3.Units_Mult_t[14]*dhn_Pmax
  ht_c4_c3_T15 = ht_c4_c3.Units_Mult_t[15]*dhn_Pmax
  ht_c4_c3_T16 = ht_c4_c3.Units_Mult_t[16]*dhn_Pmax
  
  -- C3 <-> C5
  dhn_c3_c5 = project:getUnit('test_investRoadmap_ext_ext_dhn_DHN_C3_C5',is)
  ht_c3_c5 = project:getUnit('test_investRoadmap_c3_c3_dhn_con_DHN_Export',is)
  ht_c5_c3 = project:getUnit('test_investRoadmap_c3_c3_dhn_con_DHN_Import',is)
  -- Design
  dhn_c3_c5_P1 = dhn_c3_c5.Units_Mult[1]*dhn_Pmax
  dhn_c3_c5_P2 = dhn_c3_c5.Units_Mult[2]*dhn_Pmax
  dhn_c3_c5_P3 = dhn_c3_c5.Units_Mult[3]*dhn_Pmax
  dhn_c3_c5_P4 = dhn_c3_c5.Units_Mult[4]*dhn_Pmax
  -- Operation
  ht_c3_c5_T1 = ht_c3_c5.Units_Mult_t[1]*dhn_Pmax
  ht_c3_c5_T2 = ht_c3_c5.Units_Mult_t[2]*dhn_Pmax
  ht_c3_c5_T3 = ht_c3_c5.Units_Mult_t[3]*dhn_Pmax
  ht_c3_c5_T4 = ht_c3_c5.Units_Mult_t[4]*dhn_Pmax
  ht_c3_c5_T5 = ht_c3_c5.Units_Mult_t[5]*dhn_Pmax
  ht_c3_c5_T6 = ht_c3_c5.Units_Mult_t[6]*dhn_Pmax
  ht_c3_c5_T7 = ht_c3_c5.Units_Mult_t[7]*dhn_Pmax
  ht_c3_c5_T8 = ht_c3_c5.Units_Mult_t[8]*dhn_Pmax
  ht_c3_c5_T9 = ht_c3_c5.Units_Mult_t[9]*dhn_Pmax
  ht_c3_c5_T10 = ht_c3_c5.Units_Mult_t[10]*dhn_Pmax
  ht_c3_c5_T11 = ht_c3_c5.Units_Mult_t[11]*dhn_Pmax
  ht_c3_c5_T12 = ht_c3_c5.Units_Mult_t[12]*dhn_Pmax
  ht_c3_c5_T13 = ht_c3_c5.Units_Mult_t[13]*dhn_Pmax
  ht_c3_c5_T14 = ht_c3_c5.Units_Mult_t[14]*dhn_Pmax
  ht_c3_c5_T15 = ht_c3_c5.Units_Mult_t[15]*dhn_Pmax
  ht_c3_c5_T16 = ht_c3_c5.Units_Mult_t[16]*dhn_Pmax

  ht_c5_c3_T1 = ht_c5_c3.Units_Mult_t[1]*dhn_Pmax
  ht_c5_c3_T2 = ht_c5_c3.Units_Mult_t[2]*dhn_Pmax
  ht_c5_c3_T3 = ht_c5_c3.Units_Mult_t[3]*dhn_Pmax
  ht_c5_c3_T4 = ht_c5_c3.Units_Mult_t[4]*dhn_Pmax
  ht_c5_c3_T5 = ht_c5_c3.Units_Mult_t[5]*dhn_Pmax
  ht_c5_c3_T6 = ht_c5_c3.Units_Mult_t[6]*dhn_Pmax
  ht_c5_c3_T7 = ht_c5_c3.Units_Mult_t[7]*dhn_Pmax
  ht_c5_c3_T8 = ht_c5_c3.Units_Mult_t[8]*dhn_Pmax
  ht_c5_c3_T9 = ht_c5_c3.Units_Mult_t[9]*dhn_Pmax
  ht_c5_c3_T10 = ht_c5_c3.Units_Mult_t[10]*dhn_Pmax
  ht_c5_c3_T11 = ht_c5_c3.Units_Mult_t[11]*dhn_Pmax
  ht_c5_c3_T12 = ht_c5_c3.Units_Mult_t[12]*dhn_Pmax
  ht_c5_c3_T13 = ht_c5_c3.Units_Mult_t[13]*dhn_Pmax
  ht_c5_c3_T14 = ht_c5_c3.Units_Mult_t[14]*dhn_Pmax
  ht_c5_c3_T15 = ht_c5_c3.Units_Mult_t[15]*dhn_Pmax
  ht_c5_c3_T16 = ht_c5_c3.Units_Mult_t[16]*dhn_Pmax
  
  -- C4 <-> C5
  dhn_c4_c5 = project:getUnit('test_investRoadmap_ext_ext_dhn_DHN_C4_C5',is)
  ht_c4_c5 = project:getUnit('test_investRoadmap_c4_c4_dhn_con_DHN_Export',is)
  ht_c5_c4 = project:getUnit('test_investRoadmap_c4_c4_dhn_con_DHN_Import',is)
  -- Design
  dhn_c4_c5_P1 = dhn_c4_c5.Units_Mult[1]*dhn_Pmax
  dhn_c4_c5_P2 = dhn_c4_c5.Units_Mult[2]*dhn_Pmax
  dhn_c4_c5_P3 = dhn_c4_c5.Units_Mult[3]*dhn_Pmax
  dhn_c4_c5_P4 = dhn_c4_c5.Units_Mult[4]*dhn_Pmax
  -- Operation
  ht_c4_c5_T1 = ht_c4_c5.Units_Mult_t[1]*dhn_Pmax
  ht_c4_c5_T2 = ht_c4_c5.Units_Mult_t[2]*dhn_Pmax
  ht_c4_c5_T3 = ht_c4_c5.Units_Mult_t[3]*dhn_Pmax
  ht_c4_c5_T4 = ht_c4_c5.Units_Mult_t[4]*dhn_Pmax
  ht_c4_c5_T5 = ht_c4_c5.Units_Mult_t[5]*dhn_Pmax
  ht_c4_c5_T6 = ht_c4_c5.Units_Mult_t[6]*dhn_Pmax
  ht_c4_c5_T7 = ht_c4_c5.Units_Mult_t[7]*dhn_Pmax
  ht_c4_c5_T8 = ht_c4_c5.Units_Mult_t[8]*dhn_Pmax
  ht_c4_c5_T9 = ht_c4_c5.Units_Mult_t[9]*dhn_Pmax
  ht_c4_c5_T10 = ht_c4_c5.Units_Mult_t[10]*dhn_Pmax
  ht_c4_c5_T11 = ht_c4_c5.Units_Mult_t[11]*dhn_Pmax
  ht_c4_c5_T12 = ht_c4_c5.Units_Mult_t[12]*dhn_Pmax
  ht_c4_c5_T13 = ht_c4_c5.Units_Mult_t[13]*dhn_Pmax
  ht_c4_c5_T14 = ht_c4_c5.Units_Mult_t[14]*dhn_Pmax
  ht_c4_c5_T15 = ht_c4_c5.Units_Mult_t[15]*dhn_Pmax
  ht_c4_c5_T16 = ht_c4_c5.Units_Mult_t[16]*dhn_Pmax

  ht_c5_c4_T1 = ht_c5_c4.Units_Mult_t[1]*dhn_Pmax
  ht_c5_c4_T2 = ht_c5_c4.Units_Mult_t[2]*dhn_Pmax
  ht_c5_c4_T3 = ht_c5_c4.Units_Mult_t[3]*dhn_Pmax
  ht_c5_c4_T4 = ht_c5_c4.Units_Mult_t[4]*dhn_Pmax
  ht_c5_c4_T5 = ht_c5_c4.Units_Mult_t[5]*dhn_Pmax
  ht_c5_c4_T6 = ht_c5_c4.Units_Mult_t[6]*dhn_Pmax
  ht_c5_c4_T7 = ht_c5_c4.Units_Mult_t[7]*dhn_Pmax
  ht_c5_c4_T8 = ht_c5_c4.Units_Mult_t[8]*dhn_Pmax
  ht_c5_c4_T9 = ht_c5_c4.Units_Mult_t[9]*dhn_Pmax
  ht_c5_c4_T10 = ht_c5_c4.Units_Mult_t[10]*dhn_Pmax
  ht_c5_c4_T11 = ht_c5_c4.Units_Mult_t[11]*dhn_Pmax
  ht_c5_c4_T12 = ht_c5_c4.Units_Mult_t[12]*dhn_Pmax
  ht_c5_c4_T13 = ht_c5_c4.Units_Mult_t[13]*dhn_Pmax
  ht_c5_c4_T14 = ht_c5_c4.Units_Mult_t[14]*dhn_Pmax
  ht_c5_c4_T15 = ht_c5_c4.Units_Mult_t[15]*dhn_Pmax
  ht_c5_c4_T16 = ht_c5_c4.Units_Mult_t[16]*dhn_Pmax


  ---------------
  -- Resources --
  ---------------
  
  -- Gas
  gas = project:getUnit('test_investRoadmap_ext_ext_res_GasImport',is)
  gas_T1 = gas.Units_Mult_t[1]
  gas_T2 = gas.Units_Mult_t[2]
  gas_T3 = gas.Units_Mult_t[3]
  gas_T4 = gas.Units_Mult_t[4]
  gas_T5 = gas.Units_Mult_t[5]
  gas_T6 = gas.Units_Mult_t[6]
  gas_T7 = gas.Units_Mult_t[7]
  gas_T8 = gas.Units_Mult_t[8]
  gas_T9 = gas.Units_Mult_t[9]
  gas_T10 = gas.Units_Mult_t[10]
  gas_T11 = gas.Units_Mult_t[11]
  gas_T12 = gas.Units_Mult_t[12]
  gas_T13 = gas.Units_Mult_t[13]
  gas_T14 = gas.Units_Mult_t[14]
  gas_T15 = gas.Units_Mult_t[15]
  gas_T16 = gas.Units_Mult_t[16]
  
  -- Biomass
  biomass = project:getUnit('test_investRoadmap_ext_ext_res_Biomass',is)
  biomass_T1 = biomass.Units_Mult_t[1]
  biomass_T2 = biomass.Units_Mult_t[2]
  biomass_T3 = biomass.Units_Mult_t[3]
  biomass_T4 = biomass.Units_Mult_t[4]
  biomass_T5 = biomass.Units_Mult_t[5]
  biomass_T6 = biomass.Units_Mult_t[6]
  biomass_T7 = biomass.Units_Mult_t[7]
  biomass_T8 = biomass.Units_Mult_t[8]
  biomass_T9 = biomass.Units_Mult_t[9]
  biomass_T10 = biomass.Units_Mult_t[10]
  biomass_T11 = biomass.Units_Mult_t[11]
  biomass_T12 = biomass.Units_Mult_t[12]
  biomass_T13 = biomass.Units_Mult_t[13]
  biomass_T14 = biomass.Units_Mult_t[14]
  biomass_T15 = biomass.Units_Mult_t[15]
  biomass_T16 = biomass.Units_Mult_t[16] 
  
  -- Elec buy
  elec_imp = project:getUnit('test_investRoadmap_ext_ext_res_ElecImport',is)
  elec_imp_T1 = elec_imp.Units_Mult_t[1]
  elec_imp_T2 = elec_imp.Units_Mult_t[2]
  elec_imp_T3 = elec_imp.Units_Mult_t[3]
  elec_imp_T4 = elec_imp.Units_Mult_t[4]
  elec_imp_T5 = elec_imp.Units_Mult_t[5]
  elec_imp_T6 = elec_imp.Units_Mult_t[6]
  elec_imp_T7 = elec_imp.Units_Mult_t[7]
  elec_imp_T8 = elec_imp.Units_Mult_t[8]
  elec_imp_T9 = elec_imp.Units_Mult_t[9]
  elec_imp_T10 = elec_imp.Units_Mult_t[10]
  elec_imp_T11 = elec_imp.Units_Mult_t[11]
  elec_imp_T12 = elec_imp.Units_Mult_t[12]
  elec_imp_T13 = elec_imp.Units_Mult_t[13]
  elec_imp_T14 = elec_imp.Units_Mult_t[14]
  elec_imp_T15 = elec_imp.Units_Mult_t[15]
  elec_imp_T16 = elec_imp.Units_Mult_t[16] 
  
  -- Elec sell
  elec_exp = project:getUnit('test_investRoadmap_ext_ext_res_ElecExport',is)
  elec_exp_T1 = elec_exp.Units_Mult_t[1]
  elec_exp_T2 = elec_exp.Units_Mult_t[2]
  elec_exp_T3 = elec_exp.Units_Mult_t[3]
  elec_exp_T4 = elec_exp.Units_Mult_t[4]
  elec_exp_T5 = elec_exp.Units_Mult_t[5]
  elec_exp_T6 = elec_exp.Units_Mult_t[6]
  elec_exp_T7 = elec_exp.Units_Mult_t[7]
  elec_exp_T8 = elec_exp.Units_Mult_t[8]
  elec_exp_T9 = elec_exp.Units_Mult_t[9]
  elec_exp_T10 = elec_exp.Units_Mult_t[10]
  elec_exp_T11 = elec_exp.Units_Mult_t[11]
  elec_exp_T12 = elec_exp.Units_Mult_t[12]
  elec_exp_T13 = elec_exp.Units_Mult_t[13]
  elec_exp_T14 = elec_exp.Units_Mult_t[14]
  elec_exp_T15 = elec_exp.Units_Mult_t[15]
  elec_exp_T16 = elec_exp.Units_Mult_t[16] 

  -----------------
  -- Output file --
  -----------------

  -- Design
  results='Zone;Unit;Period 1;Period 2;Period 3;Period 4\n'
  results=results..'zone 1;gas boiler;'..tostring(gb_c1_P1)..';'..tostring(gb_c1_P2)..';'..tostring(gb_c1_P3)..';'..tostring(gb_c1_P4)..'\n'
  results=results..'zone 1;gas chp;'..tostring(chp_c1_P1)..';'..tostring(chp_c1_P2)..';'..tostring(chp_c1_P3)..';'..tostring(chp_c1_P4)..'\n'
  results=results..'zone 1;biomass boiler;'..tostring(bio_c1_P1)..';'..tostring(bio_c1_P2)..';'..tostring(bio_c1_P3)..';'..tostring(bio_c1_P4)..'\n'
  results=results..'zone 1;geothermal hp;'..tostring(geohp_c1_P1)..';'..tostring(geohp_c1_P2)..';'..tostring(geohp_c1_P3)..';'..tostring(geohp_c1_P4)..'\n'
  results=results..'zone 2;gas boiler;'..tostring(gb_c2_P1)..';'..tostring(gb_c2_P2)..';'..tostring(gb_c2_P3)..';'..tostring(gb_c2_P4)..'\n'
  results=results..'zone 2;gas chp;'..tostring(chp_c2_P1)..';'..tostring(chp_c2_P2)..';'..tostring(chp_c2_P3)..';'..tostring(chp_c2_P4)..'\n'
  results=results..'zone 2;biomass boiler;'..tostring(bio_c2_P1)..';'..tostring(bio_c2_P2)..';'..tostring(bio_c2_P3)..';'..tostring(bio_c2_P4)..'\n'
  results=results..'zone 3;gas boiler;'..tostring(gb_c3_P1)..';'..tostring(gb_c3_P2)..';'..tostring(gb_c3_P3)..';'..tostring(gb_c3_P4)..'\n'
  results=results..'zone 3;gas chp;'..tostring(chp_c3_P1)..';'..tostring(chp_c3_P2)..';'..tostring(chp_c3_P3)..';'..tostring(chp_c3_P4)..'\n'
  results=results..'zone 3;biomass boiler;'..tostring(bio_c3_P1)..';'..tostring(bio_c3_P2)..';'..tostring(bio_c3_P3)..';'..tostring(bio_c3_P4)..'\n'
  results=results..'zone 3;hydrothermal hp;'..tostring(hydhp_c3_P1)..';'..tostring(hydhp_c3_P2)..';'..tostring(hydhp_c3_P3)..';'..tostring(hydhp_c3_P4)..'\n'
  results=results..'zone 3;industrial waste heat;'..tostring(hts_c3_P1)..';'..tostring(hts_c3_P2)..';'..tostring(hts_c3_P3)..';'..tostring(hts_c3_P4)..'\n'
  results=results..'zone 4;gas boiler;'..tostring(gb_c4_P1)..';'..tostring(gb_c4_P2)..';'..tostring(gb_c4_P3)..';'..tostring(gb_c4_P4)..'\n'
  results=results..'zone 4;gas chp;'..tostring(chp_c4_P1)..';'..tostring(chp_c4_P2)..';'..tostring(chp_c4_P3)..';'..tostring(chp_c4_P4)..'\n'
  results=results..'zone 4;geothermal hp;'..tostring(geohp_c4_P1)..';'..tostring(geohp_c4_P2)..';'..tostring(geohp_c4_P3)..';'..tostring(geohp_c4_P4)..'\n'
  results=results..'zone 5;gas boiler;'..tostring(gb_c5_P1)..';'..tostring(gb_c5_P2)..';'..tostring(gb_c5_P3)..';'..tostring(gb_c5_P4)..'\n'
  results=results..'zone 5;gas chp;'..tostring(chp_c5_P1)..';'..tostring(chp_c5_P2)..';'..tostring(chp_c5_P3)..';'..tostring(chp_c5_P4)..'\n'
  results=results..'zone 5;biomass boiler;'..tostring(bio_c5_P1)..';'..tostring(bio_c5_P2)..';'..tostring(bio_c5_P3)..';'..tostring(bio_c5_P4)..'\n'
  results=results..'zone 5;geothermal hp;'..tostring(geohp_c5_P1)..';'..tostring(geohp_c5_P2)..';'..tostring(geohp_c5_P3)..';'..tostring(geohp_c5_P4)..'\n'
  results=results..'zone 5;industrial waste heat;'..tostring(hts_c5_P1)..';'..tostring(hts_c5_P2)..';'..tostring(hts_c5_P3)..';'..tostring(hts_c5_P4)..'\n'
  results=results..'dhn;c1<->c2;'..tostring(dhn_c1_c2_P1)..';'..tostring(dhn_c1_c2_P2)..';'..tostring(dhn_c1_c2_P3)..';'..tostring(dhn_c1_c2_P4)..'\n'
  results=results..'dhn;c1<->c4;'..tostring(dhn_c1_c4_P1)..';'..tostring(dhn_c1_c4_P2)..';'..tostring(dhn_c1_c4_P3)..';'..tostring(dhn_c1_c4_P4)..'\n'
  results=results..'dhn;c1<->c5;'..tostring(dhn_c1_c5_P1)..';'..tostring(dhn_c1_c5_P2)..';'..tostring(dhn_c1_c5_P3)..';'..tostring(dhn_c1_c5_P4)..'\n'
  results=results..'dhn;c2<->c3;'..tostring(dhn_c2_c3_P1)..';'..tostring(dhn_c2_c3_P2)..';'..tostring(dhn_c2_c3_P3)..';'..tostring(dhn_c2_c3_P4)..'\n'
  results=results..'dhn;c2<->c4;'..tostring(dhn_c2_c4_P1)..';'..tostring(dhn_c2_c4_P2)..';'..tostring(dhn_c2_c4_P3)..';'..tostring(dhn_c2_c4_P4)..'\n'
  results=results..'dhn;c3<->c4;'..tostring(dhn_c3_c4_P1)..';'..tostring(dhn_c3_c4_P2)..';'..tostring(dhn_c3_c4_P3)..';'..tostring(dhn_c3_c4_P4)..'\n'
  results=results..'dhn;c3<->c5;'..tostring(dhn_c3_c5_P1)..';'..tostring(dhn_c3_c5_P2)..';'..tostring(dhn_c3_c5_P3)..';'..tostring(dhn_c3_c5_P4)..'\n'
  results=results..'dhn;c4<->c5;'..tostring(dhn_c4_c5_P1)..';'..tostring(dhn_c4_c5_P2)..';'..tostring(dhn_c4_c5_P3)..';'..tostring(dhn_c4_c5_P4)..'\n'
  -- Operation
  results=results..'zone 1;gas boiler;'..tostring(gb_c1_T1)..';'..tostring(gb_c1_T2)..';'..tostring(gb_c1_T3)..';'..tostring(gb_c1_T4)..';'..tostring(gb_c1_T5)..';'..tostring(gb_c1_T6)..';'..tostring(gb_c1_T7)..';'..tostring(gb_c1_T8)..';'..tostring(gb_c1_T9)..';'..tostring(gb_c1_T10)..';'..tostring(gb_c1_T11)..';'..tostring(gb_c1_T12)..';'..tostring(gb_c1_T13)..';'..tostring(gb_c1_T14)..';'..tostring(gb_c1_T15)..';'..tostring(gb_c1_T16)..';'..'\n'
  results=results..'zone 1;gas chp;'..tostring(chp_c1_T1)..';'..tostring(chp_c1_T2)..';'..tostring(chp_c1_T3)..';'..tostring(chp_c1_T4)..';'..tostring(chp_c1_T5)..';'..tostring(chp_c1_T6)..';'..tostring(chp_c1_T7)..';'..tostring(chp_c1_T8)..';'..tostring(chp_c1_T9)..';'..tostring(chp_c1_T10)..';'..tostring(chp_c1_T11)..';'..tostring(chp_c1_T12)..';'..tostring(chp_c1_T13)..';'..tostring(chp_c1_T14)..';'..tostring(chp_c1_T15)..';'..tostring(chp_c1_T16)..';'..'\n'
  results=results..'zone 1;biomass boiler;'..tostring(bio_c1_T1)..';'..tostring(bio_c1_T2)..';'..tostring(bio_c1_T3)..';'..tostring(bio_c1_T4)..';'..tostring(bio_c1_T5)..';'..tostring(bio_c1_T6)..';'..tostring(bio_c1_T7)..';'..tostring(bio_c1_T8)..';'..tostring(bio_c1_T9)..';'..tostring(bio_c1_T10)..';'..tostring(bio_c1_T11)..';'..tostring(bio_c1_T12)..';'..tostring(bio_c1_T13)..';'..tostring(bio_c1_T14)..';'..tostring(bio_c1_T15)..';'..tostring(bio_c1_T16)..';'..'\n'
  results=results..'zone 1;geothermal hp;'..tostring(geohp_c1_T1)..';'..tostring(geohp_c1_T2)..';'..tostring(geohp_c1_T3)..';'..tostring(geohp_c1_T4)..';'..tostring(geohp_c1_T5)..';'..tostring(geohp_c1_T6)..';'..tostring(geohp_c1_T7)..';'..tostring(geohp_c1_T8)..';'..tostring(geohp_c1_T9)..';'..tostring(geohp_c1_T10)..';'..tostring(geohp_c1_T11)..';'..tostring(geohp_c1_T12)..';'..tostring(geohp_c1_T13)..';'..tostring(geohp_c1_T14)..';'..tostring(geohp_c1_T15)..';'..tostring(geohp_c1_T16)..';'..'\n'
  results=results..'zone 2;gas boiler;'..tostring(gb_c2_T1)..';'..tostring(gb_c2_T2)..';'..tostring(gb_c2_T3)..';'..tostring(gb_c2_T4)..';'..tostring(gb_c2_T5)..';'..tostring(gb_c2_T6)..';'..tostring(gb_c2_T7)..';'..tostring(gb_c2_T8)..';'..tostring(gb_c2_T9)..';'..tostring(gb_c2_T10)..';'..tostring(gb_c2_T11)..';'..tostring(gb_c2_T12)..';'..tostring(gb_c2_T13)..';'..tostring(gb_c2_T14)..';'..tostring(gb_c2_T15)..';'..tostring(gb_c2_T16)..';'..'\n'
  results=results..'zone 2;gas chp;'..tostring(chp_c2_T1)..';'..tostring(chp_c2_T2)..';'..tostring(chp_c2_T3)..';'..tostring(chp_c2_T4)..';'..tostring(chp_c2_T5)..';'..tostring(chp_c2_T6)..';'..tostring(chp_c2_T7)..';'..tostring(chp_c2_T8)..';'..tostring(chp_c2_T9)..';'..tostring(chp_c2_T10)..';'..tostring(chp_c2_T11)..';'..tostring(chp_c2_T12)..';'..tostring(chp_c2_T13)..';'..tostring(chp_c2_T14)..';'..tostring(chp_c2_T15)..';'..tostring(chp_c2_T16)..';'..'\n'
  results=results..'zone 2;biomass boiler;'..tostring(bio_c2_T1)..';'..tostring(bio_c2_T2)..';'..tostring(bio_c2_T3)..';'..tostring(bio_c2_T4)..';'..tostring(bio_c2_T5)..';'..tostring(bio_c2_T6)..';'..tostring(bio_c2_T7)..';'..tostring(bio_c2_T8)..';'..tostring(bio_c2_T9)..';'..tostring(bio_c2_T10)..';'..tostring(bio_c2_T11)..';'..tostring(bio_c2_T12)..';'..tostring(bio_c2_T13)..';'..tostring(bio_c2_T14)..';'..tostring(bio_c2_T15)..';'..tostring(bio_c2_T16)..';'..'\n'
  results=results..'zone 3;gas boiler;'..tostring(gb_c3_T1)..';'..tostring(gb_c3_T2)..';'..tostring(gb_c3_T3)..';'..tostring(gb_c3_T4)..';'..tostring(gb_c3_T5)..';'..tostring(gb_c3_T6)..';'..tostring(gb_c3_T7)..';'..tostring(gb_c3_T8)..';'..tostring(gb_c3_T9)..';'..tostring(gb_c3_T10)..';'..tostring(gb_c3_T11)..';'..tostring(gb_c3_T12)..';'..tostring(gb_c3_T13)..';'..tostring(gb_c3_T14)..';'..tostring(gb_c3_T15)..';'..tostring(gb_c3_T16)..';'..'\n'
  results=results..'zone 3;gas chp;'..tostring(chp_c3_T1)..';'..tostring(chp_c3_T2)..';'..tostring(chp_c3_T3)..';'..tostring(chp_c3_T4)..';'..tostring(chp_c3_T5)..';'..tostring(chp_c3_T6)..';'..tostring(chp_c3_T7)..';'..tostring(chp_c3_T8)..';'..tostring(chp_c3_T9)..';'..tostring(chp_c3_T10)..';'..tostring(chp_c3_T11)..';'..tostring(chp_c3_T12)..';'..tostring(chp_c3_T13)..';'..tostring(chp_c3_T14)..';'..tostring(chp_c3_T15)..';'..tostring(chp_c3_T16)..';'..'\n'
  results=results..'zone 3;biomass boiler;'..tostring(bio_c3_T1)..';'..tostring(bio_c3_T2)..';'..tostring(bio_c3_T3)..';'..tostring(bio_c3_T4)..';'..tostring(bio_c3_T5)..';'..tostring(bio_c3_T6)..';'..tostring(bio_c3_T7)..';'..tostring(bio_c3_T8)..';'..tostring(bio_c3_T9)..';'..tostring(bio_c3_T10)..';'..tostring(bio_c3_T11)..';'..tostring(bio_c3_T12)..';'..tostring(bio_c3_T13)..';'..tostring(bio_c3_T14)..';'..tostring(bio_c3_T15)..';'..tostring(bio_c3_T16)..';'..'\n'
  results=results..'zone 3;hydrothermal hp;'..tostring(hydhp_c3_T1)..';'..tostring(hydhp_c3_T2)..';'..tostring(hydhp_c3_T3)..';'..tostring(hydhp_c3_T4)..';'..tostring(hydhp_c3_T5)..';'..tostring(hydhp_c3_T6)..';'..tostring(hydhp_c3_T7)..';'..tostring(hydhp_c3_T8)..';'..tostring(hydhp_c3_T9)..';'..tostring(hydhp_c3_T10)..';'..tostring(hydhp_c3_T11)..';'..tostring(hydhp_c3_T12)..';'..tostring(hydhp_c3_T13)..';'..tostring(hydhp_c3_T14)..';'..tostring(hydhp_c3_T15)..';'..tostring(hydhp_c3_T16)..';'..'\n'
  results=results..'zone 3;industrial waste heat;'..tostring(ind_c3_T1)..';'..tostring(ind_c3_T2)..';'..tostring(ind_c3_T3)..';'..tostring(ind_c3_T4)..';'..tostring(ind_c3_T5)..';'..tostring(ind_c3_T6)..';'..tostring(ind_c3_T7)..';'..tostring(ind_c3_T8)..';'..tostring(ind_c3_T9)..';'..tostring(ind_c3_T10)..';'..tostring(ind_c3_T11)..';'..tostring(ind_c3_T12)..';'..tostring(ind_c3_T13)..';'..tostring(ind_c3_T14)..';'..tostring(ind_c3_T15)..';'..tostring(ind_c3_T16)..';'..'\n'
  results=results..'zone 4;gas boiler;'..tostring(gb_c4_T1)..';'..tostring(gb_c4_T2)..';'..tostring(gb_c4_T3)..';'..tostring(gb_c4_T4)..';'..tostring(gb_c4_T5)..';'..tostring(gb_c4_T6)..';'..tostring(gb_c4_T7)..';'..tostring(gb_c4_T8)..';'..tostring(gb_c4_T9)..';'..tostring(gb_c4_T10)..';'..tostring(gb_c4_T11)..';'..tostring(gb_c4_T12)..';'..tostring(gb_c4_T13)..';'..tostring(gb_c4_T14)..';'..tostring(gb_c4_T15)..';'..tostring(gb_c4_T16)..';'..'\n'
  results=results..'zone 4;gas chp;'..tostring(chp_c4_T1)..';'..tostring(chp_c4_T2)..';'..tostring(chp_c4_T3)..';'..tostring(chp_c4_T4)..';'..tostring(chp_c4_T5)..';'..tostring(chp_c4_T6)..';'..tostring(chp_c4_T7)..';'..tostring(chp_c4_T8)..';'..tostring(chp_c4_T9)..';'..tostring(chp_c4_T10)..';'..tostring(chp_c4_T11)..';'..tostring(chp_c4_T12)..';'..tostring(chp_c4_T13)..';'..tostring(chp_c4_T14)..';'..tostring(chp_c4_T15)..';'..tostring(chp_c4_T16)..';'..'\n'
  results=results..'zone 4;geothermal hp;'..tostring(geohp_c4_T1)..';'..tostring(geohp_c4_T2)..';'..tostring(geohp_c4_T3)..';'..tostring(geohp_c4_T4)..';'..tostring(geohp_c4_T5)..';'..tostring(geohp_c4_T6)..';'..tostring(geohp_c4_T7)..';'..tostring(geohp_c4_T8)..';'..tostring(geohp_c4_T9)..';'..tostring(geohp_c4_T10)..';'..tostring(geohp_c4_T11)..';'..tostring(geohp_c4_T12)..';'..tostring(geohp_c4_T13)..';'..tostring(geohp_c4_T14)..';'..tostring(geohp_c4_T15)..';'..tostring(geohp_c4_T16)..';'..'\n'
  results=results..'zone 5;gas boiler;'..tostring(gb_c5_T1)..';'..tostring(gb_c5_T2)..';'..tostring(gb_c5_T3)..';'..tostring(gb_c5_T4)..';'..tostring(gb_c5_T5)..';'..tostring(gb_c5_T6)..';'..tostring(gb_c5_T7)..';'..tostring(gb_c5_T8)..';'..tostring(gb_c5_T9)..';'..tostring(gb_c5_T10)..';'..tostring(gb_c5_T11)..';'..tostring(gb_c5_T12)..';'..tostring(gb_c5_T13)..';'..tostring(gb_c5_T14)..';'..tostring(gb_c5_T15)..';'..tostring(gb_c5_T16)..';'..'\n'
  results=results..'zone 5;gas chp;'..tostring(chp_c5_T1)..';'..tostring(chp_c5_T2)..';'..tostring(chp_c5_T3)..';'..tostring(chp_c5_T4)..';'..tostring(chp_c5_T5)..';'..tostring(chp_c5_T6)..';'..tostring(chp_c5_T7)..';'..tostring(chp_c5_T8)..';'..tostring(chp_c5_T9)..';'..tostring(chp_c5_T10)..';'..tostring(chp_c5_T11)..';'..tostring(chp_c5_T12)..';'..tostring(chp_c5_T13)..';'..tostring(chp_c5_T14)..';'..tostring(chp_c5_T15)..';'..tostring(chp_c5_T16)..';'..'\n'
  results=results..'zone 5;biomass boiler;'..tostring(bio_c5_T1)..';'..tostring(bio_c5_T2)..';'..tostring(bio_c5_T3)..';'..tostring(bio_c5_T4)..';'..tostring(bio_c5_T5)..';'..tostring(bio_c5_T6)..';'..tostring(bio_c5_T7)..';'..tostring(bio_c5_T8)..';'..tostring(bio_c5_T9)..';'..tostring(bio_c5_T10)..';'..tostring(bio_c5_T11)..';'..tostring(bio_c5_T12)..';'..tostring(bio_c5_T13)..';'..tostring(bio_c5_T14)..';'..tostring(bio_c5_T15)..';'..tostring(bio_c5_T16)..';'..'\n'
  results=results..'zone 5;geothermal hp;'..tostring(geohp_c5_T1)..';'..tostring(geohp_c5_T2)..';'..tostring(geohp_c5_T3)..';'..tostring(geohp_c5_T4)..';'..tostring(geohp_c5_T5)..';'..tostring(geohp_c5_T6)..';'..tostring(geohp_c5_T7)..';'..tostring(geohp_c5_T8)..';'..tostring(geohp_c5_T9)..';'..tostring(geohp_c5_T10)..';'..tostring(geohp_c5_T11)..';'..tostring(geohp_c5_T12)..';'..tostring(geohp_c5_T13)..';'..tostring(geohp_c5_T14)..';'..tostring(geohp_c5_T15)..';'..tostring(geohp_c5_T16)..';'..'\n'
  results=results..'zone 5;incinerator;'..tostring(mswi_c5_T1)..';'..tostring(mswi_c5_T2)..';'..tostring(mswi_c5_T3)..';'..tostring(mswi_c5_T4)..';'..tostring(mswi_c5_T5)..';'..tostring(mswi_c5_T6)..';'..tostring(mswi_c5_T7)..';'..tostring(mswi_c5_T8)..';'..tostring(mswi_c5_T9)..';'..tostring(mswi_c5_T10)..';'..tostring(mswi_c5_T11)..';'..tostring(mswi_c5_T12)..';'..tostring(mswi_c5_T13)..';'..tostring(mswi_c5_T14)..';'..tostring(mswi_c5_T15)..';'..tostring(mswi_c5_T16)..';'..'\n'
  results=results..'zone 5;industrial waste heat;'..tostring(ind_c5_T1)..';'..tostring(ind_c5_T2)..';'..tostring(ind_c5_T3)..';'..tostring(ind_c5_T4)..';'..tostring(ind_c5_T5)..';'..tostring(ind_c5_T6)..';'..tostring(ind_c5_T7)..';'..tostring(ind_c5_T8)..';'..tostring(ind_c5_T9)..';'..tostring(ind_c5_T10)..';'..tostring(ind_c5_T11)..';'..tostring(ind_c5_T12)..';'..tostring(ind_c5_T13)..';'..tostring(ind_c5_T14)..';'..tostring(ind_c5_T15)..';'..tostring(ind_c5_T16)..';'..'\n'
  results=results..'dhn;c1->c2;'..tostring(ht_c1_c2_T1)..';'..tostring(ht_c1_c2_T2)..';'..tostring(ht_c1_c2_T3)..';'..tostring(ht_c1_c2_T4)..';'..tostring(ht_c1_c2_T5)..';'..tostring(ht_c1_c2_T6)..';'..tostring(ht_c1_c2_T7)..';'..tostring(ht_c1_c2_T8)..';'..tostring(ht_c1_c2_T9)..';'..tostring(ht_c1_c2_T10)..';'..tostring(ht_c1_c2_T11)..';'..tostring(ht_c1_c2_T12)..';'..tostring(ht_c1_c2_T13)..';'..tostring(ht_c1_c2_T14)..';'..tostring(ht_c1_c2_T15)..';'..tostring(ht_c1_c2_T16)..';'..'\n'
  results=results..'dhn;c1->c4;'..tostring(ht_c1_c4_T1)..';'..tostring(ht_c1_c4_T2)..';'..tostring(ht_c1_c4_T3)..';'..tostring(ht_c1_c4_T4)..';'..tostring(ht_c1_c4_T5)..';'..tostring(ht_c1_c4_T6)..';'..tostring(ht_c1_c4_T7)..';'..tostring(ht_c1_c4_T8)..';'..tostring(ht_c1_c4_T9)..';'..tostring(ht_c1_c4_T10)..';'..tostring(ht_c1_c4_T11)..';'..tostring(ht_c1_c4_T12)..';'..tostring(ht_c1_c4_T13)..';'..tostring(ht_c1_c4_T14)..';'..tostring(ht_c1_c4_T15)..';'..tostring(ht_c1_c4_T16)..';'..'\n'
  results=results..'dhn;c1->c5;'..tostring(ht_c1_c5_T1)..';'..tostring(ht_c1_c5_T2)..';'..tostring(ht_c1_c5_T3)..';'..tostring(ht_c1_c5_T4)..';'..tostring(ht_c1_c5_T5)..';'..tostring(ht_c1_c5_T6)..';'..tostring(ht_c1_c5_T7)..';'..tostring(ht_c1_c5_T8)..';'..tostring(ht_c1_c5_T9)..';'..tostring(ht_c1_c5_T10)..';'..tostring(ht_c1_c5_T11)..';'..tostring(ht_c1_c5_T12)..';'..tostring(ht_c1_c5_T13)..';'..tostring(ht_c1_c5_T14)..';'..tostring(ht_c1_c5_T15)..';'..tostring(ht_c1_c5_T16)..';'..'\n'
  results=results..'dhn;c2->c3;'..tostring(ht_c2_c3_T1)..';'..tostring(ht_c2_c3_T2)..';'..tostring(ht_c2_c3_T3)..';'..tostring(ht_c2_c3_T4)..';'..tostring(ht_c2_c3_T5)..';'..tostring(ht_c2_c3_T6)..';'..tostring(ht_c2_c3_T7)..';'..tostring(ht_c2_c3_T8)..';'..tostring(ht_c2_c3_T9)..';'..tostring(ht_c2_c3_T10)..';'..tostring(ht_c2_c3_T11)..';'..tostring(ht_c2_c3_T12)..';'..tostring(ht_c2_c3_T13)..';'..tostring(ht_c2_c3_T14)..';'..tostring(ht_c2_c3_T15)..';'..tostring(ht_c2_c3_T16)..';'..'\n'
  results=results..'dhn;c2->c4;'..tostring(ht_c2_c4_T1)..';'..tostring(ht_c2_c4_T2)..';'..tostring(ht_c2_c4_T3)..';'..tostring(ht_c2_c4_T4)..';'..tostring(ht_c2_c4_T5)..';'..tostring(ht_c2_c4_T6)..';'..tostring(ht_c2_c4_T7)..';'..tostring(ht_c2_c4_T8)..';'..tostring(ht_c2_c4_T9)..';'..tostring(ht_c2_c4_T10)..';'..tostring(ht_c2_c4_T11)..';'..tostring(ht_c2_c4_T12)..';'..tostring(ht_c2_c4_T13)..';'..tostring(ht_c2_c4_T14)..';'..tostring(ht_c2_c4_T15)..';'..tostring(ht_c2_c4_T16)..';'..'\n'
  results=results..'dhn;c3->c4;'..tostring(ht_c3_c4_T1)..';'..tostring(ht_c3_c4_T2)..';'..tostring(ht_c3_c4_T3)..';'..tostring(ht_c3_c4_T4)..';'..tostring(ht_c3_c4_T5)..';'..tostring(ht_c3_c4_T6)..';'..tostring(ht_c3_c4_T7)..';'..tostring(ht_c3_c4_T8)..';'..tostring(ht_c3_c4_T9)..';'..tostring(ht_c3_c4_T10)..';'..tostring(ht_c3_c4_T11)..';'..tostring(ht_c3_c4_T12)..';'..tostring(ht_c3_c4_T13)..';'..tostring(ht_c3_c4_T14)..';'..tostring(ht_c3_c4_T15)..';'..tostring(ht_c3_c4_T16)..';'..'\n'
  results=results..'dhn;c3->c5;'..tostring(ht_c3_c5_T1)..';'..tostring(ht_c3_c5_T2)..';'..tostring(ht_c3_c5_T3)..';'..tostring(ht_c3_c5_T4)..';'..tostring(ht_c3_c5_T5)..';'..tostring(ht_c3_c5_T6)..';'..tostring(ht_c3_c5_T7)..';'..tostring(ht_c3_c5_T8)..';'..tostring(ht_c3_c5_T9)..';'..tostring(ht_c3_c5_T10)..';'..tostring(ht_c3_c5_T11)..';'..tostring(ht_c3_c5_T12)..';'..tostring(ht_c3_c5_T13)..';'..tostring(ht_c3_c5_T14)..';'..tostring(ht_c3_c5_T15)..';'..tostring(ht_c3_c5_T16)..';'..'\n'
  results=results..'dhn;c4->c5;'..tostring(ht_c4_c5_T1)..';'..tostring(ht_c4_c5_T2)..';'..tostring(ht_c4_c5_T3)..';'..tostring(ht_c4_c5_T4)..';'..tostring(ht_c4_c5_T5)..';'..tostring(ht_c4_c5_T6)..';'..tostring(ht_c4_c5_T7)..';'..tostring(ht_c4_c5_T8)..';'..tostring(ht_c4_c5_T9)..';'..tostring(ht_c4_c5_T10)..';'..tostring(ht_c4_c5_T11)..';'..tostring(ht_c4_c5_T12)..';'..tostring(ht_c4_c5_T13)..';'..tostring(ht_c4_c5_T14)..';'..tostring(ht_c4_c5_T15)..';'..tostring(ht_c4_c5_T16)..';'..'\n'
  results=results..'dhn;c2->c1;'..tostring(ht_c2_c1_T1)..';'..tostring(ht_c2_c1_T2)..';'..tostring(ht_c2_c1_T3)..';'..tostring(ht_c2_c1_T4)..';'..tostring(ht_c2_c1_T5)..';'..tostring(ht_c2_c1_T6)..';'..tostring(ht_c2_c1_T7)..';'..tostring(ht_c2_c1_T8)..';'..tostring(ht_c2_c1_T9)..';'..tostring(ht_c2_c1_T10)..';'..tostring(ht_c2_c1_T11)..';'..tostring(ht_c2_c1_T12)..';'..tostring(ht_c2_c1_T13)..';'..tostring(ht_c2_c1_T14)..';'..tostring(ht_c2_c1_T15)..';'..tostring(ht_c2_c1_T16)..';'..'\n'
  results=results..'dhn;c4->c1;'..tostring(ht_c4_c1_T1)..';'..tostring(ht_c4_c1_T2)..';'..tostring(ht_c4_c1_T3)..';'..tostring(ht_c4_c1_T4)..';'..tostring(ht_c4_c1_T5)..';'..tostring(ht_c4_c1_T6)..';'..tostring(ht_c4_c1_T7)..';'..tostring(ht_c4_c1_T8)..';'..tostring(ht_c4_c1_T9)..';'..tostring(ht_c4_c1_T10)..';'..tostring(ht_c4_c1_T11)..';'..tostring(ht_c4_c1_T12)..';'..tostring(ht_c4_c1_T13)..';'..tostring(ht_c4_c1_T14)..';'..tostring(ht_c4_c1_T15)..';'..tostring(ht_c4_c1_T16)..';'..'\n'
  results=results..'dhn;c5->c1;'..tostring(ht_c5_c1_T1)..';'..tostring(ht_c5_c1_T2)..';'..tostring(ht_c5_c1_T3)..';'..tostring(ht_c5_c1_T4)..';'..tostring(ht_c5_c1_T5)..';'..tostring(ht_c5_c1_T6)..';'..tostring(ht_c5_c1_T7)..';'..tostring(ht_c5_c1_T8)..';'..tostring(ht_c5_c1_T9)..';'..tostring(ht_c5_c1_T10)..';'..tostring(ht_c5_c1_T11)..';'..tostring(ht_c5_c1_T12)..';'..tostring(ht_c5_c1_T13)..';'..tostring(ht_c5_c1_T14)..';'..tostring(ht_c5_c1_T15)..';'..tostring(ht_c5_c1_T16)..';'..'\n'
  results=results..'dhn;c3->c2;'..tostring(ht_c3_c2_T1)..';'..tostring(ht_c3_c2_T2)..';'..tostring(ht_c3_c2_T3)..';'..tostring(ht_c3_c2_T4)..';'..tostring(ht_c3_c2_T5)..';'..tostring(ht_c3_c2_T6)..';'..tostring(ht_c3_c2_T7)..';'..tostring(ht_c3_c2_T8)..';'..tostring(ht_c3_c2_T9)..';'..tostring(ht_c3_c2_T10)..';'..tostring(ht_c3_c2_T11)..';'..tostring(ht_c3_c2_T12)..';'..tostring(ht_c3_c2_T13)..';'..tostring(ht_c3_c2_T14)..';'..tostring(ht_c3_c2_T15)..';'..tostring(ht_c3_c2_T16)..';'..'\n'
  results=results..'dhn;c4->c2;'..tostring(ht_c4_c2_T1)..';'..tostring(ht_c4_c2_T2)..';'..tostring(ht_c4_c2_T3)..';'..tostring(ht_c4_c2_T4)..';'..tostring(ht_c4_c2_T5)..';'..tostring(ht_c4_c2_T6)..';'..tostring(ht_c4_c2_T7)..';'..tostring(ht_c4_c2_T8)..';'..tostring(ht_c4_c2_T9)..';'..tostring(ht_c4_c2_T10)..';'..tostring(ht_c4_c2_T11)..';'..tostring(ht_c4_c2_T12)..';'..tostring(ht_c4_c2_T13)..';'..tostring(ht_c4_c2_T14)..';'..tostring(ht_c4_c2_T15)..';'..tostring(ht_c4_c2_T16)..';'..'\n'
  results=results..'dhn;c4->c3;'..tostring(ht_c4_c3_T1)..';'..tostring(ht_c4_c3_T2)..';'..tostring(ht_c4_c3_T3)..';'..tostring(ht_c4_c3_T4)..';'..tostring(ht_c4_c3_T5)..';'..tostring(ht_c4_c3_T6)..';'..tostring(ht_c4_c3_T7)..';'..tostring(ht_c4_c3_T8)..';'..tostring(ht_c4_c3_T9)..';'..tostring(ht_c4_c3_T10)..';'..tostring(ht_c4_c3_T11)..';'..tostring(ht_c4_c3_T12)..';'..tostring(ht_c4_c3_T13)..';'..tostring(ht_c4_c3_T14)..';'..tostring(ht_c4_c3_T15)..';'..tostring(ht_c4_c3_T16)..';'..'\n'
  results=results..'dhn;c5->c3;'..tostring(ht_c5_c3_T1)..';'..tostring(ht_c5_c3_T2)..';'..tostring(ht_c5_c3_T3)..';'..tostring(ht_c5_c3_T4)..';'..tostring(ht_c5_c3_T5)..';'..tostring(ht_c5_c3_T6)..';'..tostring(ht_c5_c3_T7)..';'..tostring(ht_c5_c3_T8)..';'..tostring(ht_c5_c3_T9)..';'..tostring(ht_c5_c3_T10)..';'..tostring(ht_c5_c3_T11)..';'..tostring(ht_c5_c3_T12)..';'..tostring(ht_c5_c3_T13)..';'..tostring(ht_c5_c3_T14)..';'..tostring(ht_c5_c3_T15)..';'..tostring(ht_c5_c3_T16)..';'..'\n'
  results=results..'dhn;c5->c4;'..tostring(ht_c5_c4_T1)..';'..tostring(ht_c5_c4_T2)..';'..tostring(ht_c5_c4_T3)..';'..tostring(ht_c5_c4_T4)..';'..tostring(ht_c5_c4_T5)..';'..tostring(ht_c5_c4_T6)..';'..tostring(ht_c5_c4_T7)..';'..tostring(ht_c5_c4_T8)..';'..tostring(ht_c5_c4_T9)..';'..tostring(ht_c5_c4_T10)..';'..tostring(ht_c5_c4_T11)..';'..tostring(ht_c5_c4_T12)..';'..tostring(ht_c5_c4_T13)..';'..tostring(ht_c5_c4_T14)..';'..tostring(ht_c5_c4_T15)..';'..tostring(ht_c5_c4_T16)..';'..'\n'
  -- Resources
  results=results..';gas;'..tostring(gas_T1)..';'..tostring(gas_T2)..';'..tostring(gas_T3)..';'..tostring(gas_T4)..';'..tostring(gas_T5)..';'..tostring(gas_T6)..';'..tostring(gas_T7)..';'..tostring(gas_T8)..';'..tostring(gas_T9)..';'..tostring(gas_T10)..';'..tostring(gas_T11)..';'..tostring(gas_T12)..';'..tostring(gas_T13)..';'..tostring(gas_T14)..';'..tostring(gas_T15)..';'..tostring(gas_T16)..';'..'\n'
  results=results..';biomass;'..tostring(biomass_T1)..';'..tostring(biomass_T2)..';'..tostring(biomass_T3)..';'..tostring(biomass_T4)..';'..tostring(biomass_T5)..';'..tostring(biomass_T6)..';'..tostring(biomass_T7)..';'..tostring(biomass_T8)..';'..tostring(biomass_T9)..';'..tostring(biomass_T10)..';'..tostring(biomass_T11)..';'..tostring(biomass_T12)..';'..tostring(biomass_T13)..';'..tostring(biomass_T14)..';'..tostring(biomass_T15)..';'..tostring(biomass_T16)..';'..'\n'
  results=results..';electricity import;'..tostring(elec_imp_T1)..';'..tostring(elec_imp_T2)..';'..tostring(elec_imp_T3)..';'..tostring(elec_imp_T4)..';'..tostring(elec_imp_T5)..';'..tostring(elec_imp_T6)..';'..tostring(elec_imp_T7)..';'..tostring(elec_imp_T8)..';'..tostring(elec_imp_T9)..';'..tostring(elec_imp_T10)..';'..tostring(elec_imp_T11)..';'..tostring(elec_imp_T12)..';'..tostring(elec_imp_T13)..';'..tostring(elec_imp_T14)..';'..tostring(elec_imp_T15)..';'..tostring(elec_imp_T16)..';'..'\n'
  results=results..';electricity export;'..tostring(elec_imp_T1)..';'..tostring(elec_imp_T2)..';'..tostring(elec_imp_T3)..';'..tostring(elec_imp_T4)..';'..tostring(elec_imp_T5)..';'..tostring(elec_imp_T6)..';'..tostring(elec_imp_T7)..';'..tostring(elec_imp_T8)..';'..tostring(elec_imp_T9)..';'..tostring(elec_imp_T10)..';'..tostring(elec_imp_T11)..';'..tostring(elec_imp_T12)..';'..tostring(elec_imp_T13)..';'..tostring(elec_imp_T14)..';'..tostring(elec_imp_T15)..';'..tostring(elec_imp_T16)..';'..'\n'


  fid = io.open ('.\\projects\\InvestRoadmapUrban\\Output\\output_fict_city_sc'..tostring(is-1)..'.csv', 'w')

  fid:write(results)

  fid:close()
  
  end  -- end loop on scenarios

end