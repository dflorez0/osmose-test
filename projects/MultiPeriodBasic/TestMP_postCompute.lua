function TestMP_postCompute(project)
    print('POST COMPUTE:\n')

    -------------------
    -- Example BEGIN --
    -------------------
    -- Unit ouputs : Mult and Use factors
    -- local UnitNameAlt = project:getUnit('[project name]_[cluster name]_[location name]_[model name]_[unit name]')
    -- local UnitNameAlt_mult = UnitNameAlt.Units_Mult_t[1]
    -- local UnitNameAlt_use = UnitNameAlt.Units_Use_t[1]

    -- Get input/output value
    -- local InputName = project:getTag('[location name].[model name].[input name]',[period],[time])
    -- local OuputName = project:getTag('[location name].[model name].[input name]',[period],[time])

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

    local sizing_factor = 1.1

    -- Utility utilization at each time-step for beer factory

    -- Gas boiler
    local BeerFact_gasboil = project:getUnit('test_MultiPeriod_c2_beer_fact_gb_GasBoiler')
    local gasboil_Pmax = project:getTag('beer_fact.gb.QMAX')
    local BeerFact_gasboil_P1 = BeerFact_gasboil.Units_Mult_t[1]*gasboil_Pmax
    local BeerFact_gasboil_P2 = BeerFact_gasboil.Units_Mult_t[2]*gasboil_Pmax
    local BeerFact_gasboil_P3 = BeerFact_gasboil.Units_Mult_t[3]*gasboil_Pmax
    local BeerFact_gasboil_P4 = BeerFact_gasboil.Units_Mult_t[4]*gasboil_Pmax
    local BeerFact_gasboil_P5 = BeerFact_gasboil.Units_Mult_t[5]*gasboil_Pmax
    local BeerFact_gasboil_P6 = BeerFact_gasboil.Units_Mult_t[6]*gasboil_Pmax
    local BeerFact_gasboil_P7 = BeerFact_gasboil.Units_Mult_t[7]*gasboil_Pmax
    local BeerFact_gasboil_M1 = BeerFact_gasboil.Units_Mult[1]*gasboil_Pmax
    local BeerFact_gasboil_M2 = BeerFact_gasboil.Units_Mult[2]*gasboil_Pmax

    results='Gas boiler;kW;'..tostring(BeerFact_gasboil_P1)
    results=results..';'..tostring(BeerFact_gasboil_P2)
    results=results..';'..tostring(BeerFact_gasboil_P3)
    results=results..';'..tostring(BeerFact_gasboil_P4)
    results=results..';'..tostring(BeerFact_gasboil_P5)
    results=results..';'..tostring(BeerFact_gasboil_P6)
    results=results..';'..tostring(BeerFact_gasboil_P7)

    fid = io.open ('.\\projects\\MultiPeriodBasic\\Output\\output.csv', 'w')

    fid:write(results)

    fid:close()

end