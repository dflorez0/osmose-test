local lub = require 'lub'
local lib = lub.class 'osmose.PostCompute_Biorefinery.lua'

function lib.new(project)
  
  local lfs = require'lfs'
  osmose_dir=lfs.currentdir()
  local actual_periode
--	project.resultsHLD = {}
  lib.ei_result_filename='eiamplAll.out'
   
  -- check convergence files
  lib.ei_conv =  'GlpkOutMsg.txt'

  local alpha = 0.77  -- scalling factor
  
  
 
for periode in ipairs(project.periodes) do 
  local tmp_dir = ('./results/'..project.name..'/run_'..project.run..'/periode_'..periode..'/tmp/')
--  check convergence EI 
 local s1 = assert(io.open(tmp_dir..lib.ei_conv,"r"))
 for line in s1:lines() do
-- local eiout = line:match("(.*)")
 if line == "Status:     INTEGER OPTIMAL" then
 ei_conv = 1
 end
 end

if ei_conv == 1 then --and hld_conv ==1 and hens_conv == 1 then
 --  Retrieve results.
	local f = assert(io.open(tmp_dir..lib.ei_result_filename,"r"))
	  --  Reading each line.
	f1 = {}
  f2 = {}
    
  for line in f:lines() do
    --  print(line)
		--  Capture the param, domain, value regarding the pattern "param[domaine].val = value"
  --local param = line:match("(.*)% =") -- this when using glpk
  --local param = line:match("(.*)%s") -- this when using ampl
  --local field, value, spec  = line:match("(.*)%=,(%d*.*)%(,(.*)")
   
   --Find the investment value for each unit
  local s1,s2,s3,value  = line:match("(.*)%[DefaultInvCost,(.*)%](.*)%=(%d*.*)")
     if s1== 'Units_Cost'  then --and s2== 'DefaultMechPower'
     table.insert(f1, {unit_name = s2, value = tonumber(value)} )  
     --print ("Investment of unit "..s2.." is "..value.."(US$): ")
 
      end -- end if   
 
   --Find the mult of each unit
  local m1,m2,m3,value2  = line:match("(.*)%[(.*)%](.*)%=(%d*.*)")
    if m1== 'Units_Mult'  then 
     table.insert(f2, {unit_name = m2, value = tonumber(value2)} )  
     --print ("Mult of unit "..m2.." is "..value2)
    end -- end if  
  -- Recover the Total Operating Cost value
  local op1,op2,value3  = line:match("(.*)%](.*)%=(%d*.*)")
    if op1 == 'Costs_Cost[DefaultOpCost' then
      project.opcost = tonumber(value3)
      
    end  -- end if

  ---- Recover the Total Impact value 
  local im1,im2,value4  = line:match("(.*)%](.*)%=(%d*.*)")
    if im1 == 'Costs_Cost[DefaultImpact' then
      project.impact = tonumber(value4)
      
    end  -- end if
    
--[[
---- Recover the fresh water demand  
  local wat1,wat2,wat3,war4,value5  = line:match("(.*)%[(.*)%_(.*)%_(.*)%=(%d*.*)")
    if wat1== 'Units_supply' and wat2 == 'layers_freshwater,biorefinery' and wat4 == 'resources_biorefinery_freshwater,1].val ' then
      project.processwater = tonumber(value5)
      
    end  -- end if

]]--
end -- end for

  -- Update the investment with the scalling factor
  cinv = {}
  for id,cont in ipairs(f1) do
   for id2,cont2 in ipairs(f2) do
     if cont.unit_name == cont2.unit_name then
      --print('CONT',cont.unit_name, cont.value)
       table.insert(cinv, {unit_name = cont.unit_name, value = (cont.value*(1/(cont2.value+0.00001)))*(cont2.value^alpha)})
       --print("UPDATED INVESTMENT of unit " ..cont.unit_name.." is   " ..(cont.value*(1/(cont2.value+0.00001)))*(cont2.value^alpha))
     end
   end
 end

  project.tot_ic = 0
  for id,cont in ipairs(cinv) do
      project.tot_ic = project.tot_ic + cont.value
  end

  
  local total_units_opcost = project.opcost 
  local maint_and_labor = 0.06*project.tot_ic
  local total_op_cost = project.opcost + 0.06*project.tot_ic
  local total_impact_cost = project.impact
  local total_opcost_with_impact = project.impact + total_op_cost
  local total_cost = project.tot_ic + total_op_cost
  local total_cost_with_impact = total_cost + total_impact_cost
  --local freshwaterprocess = project.processwater
  
  print ("OPERATING COST :                                     "..total_units_opcost.."(US$/h): ")
  print ("MAINTAINANCE + LABOR :                               "..maint_and_labor.."(US$/h): ")
  print ("OPERATING COST + MAINTAINANCE + LABOR:               "..total_op_cost.."(US$/h): ")
  print ("IMPACT COST (CO2eq Tax) :                            "..total_impact_cost.."(US$/h): ")
  print ("INVESTMENT COST :                                    "..project.tot_ic.."(US$/h): ")
  print ("OPERATING COST + IMPACT :                            "..total_opcost_with_impact.."(US$/h): ")
  print ("OPERATING COST + INVESTMENT COST :                   "..total_cost.."(US$/h): ")
  print ("OPERATING COST + INVESTMENT COST + IMPACT COST:      "..total_cost_with_impact.."(US$/h): ")
  --print ("Fresh Water Process :                                "..freshwaterprocess.."(kg/h): ")
  
  local obj_file = ('./results/'..project.name)
  local file = io.open(obj_file.."/objective_function_lua.txt", "w")
  file:write(total_op_cost)
  --file:write("\n")
  --file:write(total_impact_cost)
  --file:write("\n")
  --file:write(freshwaterprocess)
  file:close() 
   
else -- convergence check
  -- calculate objective function
  -- writing non-solution txt file in myproject 
  local obj_file = ('./results/'..project.name)
  local file = io.open(obj_file.."/objective_function_lua.txt", "w")
  file:write("Inf")
  file:close()  
end -- end if of convergence check
end -- end for loop of periods
  
  end -- end function lib.new

return lib