--[[------------------------------------------------------
--]]------------------------------------------------------


local osmose = require 'osmose'

local project = osmose.Project('sten_clust2', 'MER')

project.operationalCosts = {cost_elec_in = 17.19, cost_elec_out = 16.9, op_time= 1}
project.operationalCosts = 'data/op_costs.ods'

project:load(
--  {sc = "ET_SB.Sten_clust.sten_cluster_hucu", with = 'data/sten_cluster2_actsys_mt.ods'}
-- {sc = "ET_SB.Sten_clust.sten_cluster_hucp", with = 'data/sten_cluster2_optsys_mt.ods'}
  {sc = "ET.Sten_clust.sten_cluster_hucu", with = 'data/sten_cluster2_possys_mt.ods'}
  
)

project:periode(1):time(20)
--project:periode(2):time(2)
--print project:periode(1)
--print(project.operationalCosts)
local oneRun = osmose.Eiampl(project)

osmose.Glpk(oneRun)
--osmose.Graph(oneRun,'svg')
osmose.Graph(oneRun,nil,{force_enthalpy=true})
