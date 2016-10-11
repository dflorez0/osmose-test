local osmose = require 'lib.osmose'
local frontend = osmose.Project ('test_MultiPeriod', 'OperatingCost')

frontend.operationalCosts = 'Data/default_op_costs.csv'
frontend:scenario(1):period(1):time(3)
frontend:scenario(1):period(2):time(4)
frontend:scenario(2):period(1):time(1)
frontend:scenario(2):period(2):time(3)

frontend.clusters = {c1={'world'},c2={'beer_fact'}}

frontend:load (
    -- Processes
    {beer_fact = 'EPOS_OsmoseCourse.BeerFactory', locations = {'beer_fact'}, with='Data/beer_factory_mt.csv'},
    -- Connections World <-> Cluster
    {network = 'EPOS_OsmoseCourse.Networks', locations = {'world'}, with='Data/network_mt.csv'},
    {raw_res = 'EPOS_OsmoseCourse.RawResources', locations = {'world'}, with='Data/mt.csv'},
    {market = 'EPOS_OsmoseCourse.Market', locations = {'world'}, with='Data/mt.csv'},
    {waste = 'EPOS_OsmoseCourse.Waste', locations = {'world'}, with='Data/mt.csv'},
    -- Utilities
    {gb = 'EPOS_OsmoseCourse.GasBoiler', locations = {'beer_fact'}},
    {cooler = 'EPOS_OsmoseCourse.CoolingTower', locations = {'beer_fact'}, with='Data/mt.csv'}
)


--frontend.options.mathProg = {}
frontend.options.mathProg.language = 'glpk'
frontend.options.mathProg.options = {'--mipgap 0.001','--tmlim 200'}
frontend.options.graph = {format='jpg'}
--frontend.options.graph.icc = {'models','units','utilities'}
--frontend.options.graph.carnot = {'models','units','utilities', Tamb = 298}
--frontend.options.graph.format = 'jpg'               -- 'eps', 'jpg', 'svg'
--frontend.options.graph.force_enthalpy
--frontend.options.graph.spaghetti             true OR false( or not defined)
frontend.options.clusters = {'c1','c2'}
--frontend.options.return_solver
frontend.options.doLCA = false
--frontend.options.postprint                   true OR false

frontend:solve()

frontend:compute('TestMP_postCompute.lua')