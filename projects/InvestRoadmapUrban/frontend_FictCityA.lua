--[[
This model was developed to test the multi-period investment roadmap functionality, in the context of urban energy systems. The description of the (fictional) case study and data used can be found in .\Description\Data.xlsx
]]

local osmose = require 'lib.osmose'
local frontend = osmose.Project ('test_investRoadmap', 'TotalCost')

-- connections between zones
-- connection between zone1 and zone2 if zone_connect[zone1][zone2] = true
local zone_connect = {
    {false, true, false, true, true},
    {true, false, true, true, false},
    {false, true, false, true, true},
    {true, true, true, false, true},
    {true, false, true, true, false}
}

-- biomass availability in each zone
local zone_biomass = {
    true,
    true,
    true,
    false,
    true
}

-- geothermal availability in each zone
local zone_geo = {
    true,
    false,
    false,
    true,
    true
}

-- hydrothermal availability in each zone
local zone_hydro = {
    false,
    false,
    true,
    false,
    false
}

-- MSWI availability in each zone
local zone_mswi = {
    false,
    false,
    false,
    false,
    true
}

-- MSWI availability in each zone
local zone_indrec = {
    false,
    false,
    true,
    false,
    true
}

local nb_zones = #zone_connect    -- number of zones considered

-- define multi-period
frontend.operationalCosts = 'Data/op_costs.csv'
frontend:scenario(1):period(1):time(4)
frontend:scenario(1):period(2):time(4)
frontend:scenario(1):period(3):time(4)
frontend:scenario(1):period(4):time(4)

frontend:scenario(2):period(1):time(4)
frontend:scenario(2):period(2):time(4)
frontend:scenario(2):period(3):time(4)
frontend:scenario(2):period(4):time(4)

frontend:scenario(3):period(1):time(4)
frontend:scenario(3):period(2):time(4)
frontend:scenario(3):period(3):time(4)
frontend:scenario(3):period(4):time(4)

frontend:scenario(4):period(1):time(4)
frontend:scenario(4):period(2):time(4)
frontend:scenario(4):period(3):time(4)
frontend:scenario(4):period(4):time(4)

-- generation of clusters
local clusters = {}     -- table containing all cluster tables
clusters['ext'] = {'ext'}   -- cluster corresponding to the outside of the system (where imported resources come from)
for zone = 1, nb_zones do -- one cluster per zone
    clusters['c'..tostring(zone)] = {'c'..tostring(zone)}
end
frontend.clusters = (clusters)

-- load models for each cluster
for zone = 1, nb_zones do
    -- services
    frontend:load (
        {serv = 'FictCityA.Services', locations = {'c'..tostring(zone)}, with = 'Data/zone'..tostring(zone)..'_demand.csv'}
    )
    -- technologies available in all zones
    frontend:load (
        {gas_boil = 'FictCityA.GasBoiler', locations = {'c'..tostring(zone)} },
        {gas_chp = 'FictCityA.GasCHP', locations = {'c'..tostring(zone)} },
        {hts = 'FictCityA.HTS', locations = {'c'..tostring(zone)} }  -- heat transfer station for waste heat recovery
    )

    if zone_biomass[zone] then
        frontend:load (
            {bm_boil = 'FictCityA.BiomassBoiler', locations = {'c'..tostring(zone)} }
        )
    end

    if zone_geo[zone] then
        frontend:load (
            {geo_hp = 'FictCityA.GeoHP', locations = {'c'..tostring(zone)} }
        )
    end

    if zone_hydro[zone] then
        frontend:load (
            {hyd_hp = 'FictCityA.HydroHP', locations = {'c'..tostring(zone)} }
        )
    end

    if zone_mswi[zone] then
        frontend:load (
            {mswi = 'FictCityA.IndRec', locations = {'c'..tostring(zone)}, with = 'Data/zone'..tostring(zone)..'_mswi.csv'}
        )
    end

    if zone_indrec[zone] then
        frontend:load (
            {ind = 'FictCityA.IndRec', locations = {'c'..tostring(zone)}, with = 'Data/zone'..tostring(zone)..'_ind.csv'}
        )
    end

    -- connections to other zones via DHN
    for zone2 = zone+1, nb_zones do
        if zone_connect[zone][zone2] then
            --[[
            zone_sub = zone
            zone2_sub = zone2
            if zone_sub > zone2_sub then
                zone_sub = zone_sub + zone2_sub
                zone2_sub = zone_sub - zone2_sub
                zone_sub = zone_sub - zone2_sub
            end
            ]]
            frontend:load (
                {dhn_con = 'FictCityA.DHN_C'..tostring(zone)..'_C'..tostring(zone2), locations = {'c'..tostring(zone), 'c'..tostring(zone2)} }
            )
        end
    end
end

-- load general models
frontend:load (
    {dhn = 'FictCityA.Networks', locations = {'ext'}},
    {res = 'FictCityA.Resources', locations = {'ext'}, with = 'Data/resources_price.csv'}
)

--frontend.options.mathProg.language = 'glpk'
--frontend.options.mathProg.options = {'--mipgap 0.001','--tmlim 20'}
frontend.options.mathProg.language = 'ampl'
frontend.options.mathProg.solver = 'cplexamp'
frontend.options.mathProg.options  = {"cplex_options  'mipgap=0.01 mipdisplay=2 time=300'"} 
frontend.options.graph = false
--frontend.options.graph.format = 'jpg'               -- 'eps', 'jpg', 'svg'
--frontend.options.graph.force_enthalpy
--frontend.options.graph.spaghetti             true OR false( or not defined)
frontend.options.clusters = {'ext','c1','c2','c3','c4','c5'}
--frontend.options.return_solver
frontend.options.doLCA = false
--frontend.options.postprint                   true OR false

frontend:solve()

frontend:compute('FictCityA_postCompute.lua')