-- MODULE STARTUP.LUA
-- by Garran Plum
--
-- Load game assets and create mod buildings.
-- 

-- IMPORT GP OBJECT
local myMod, GP = ... 

function GP:startMod()

    -- Sugar for GP:config()
    local config = GP:config()

    GP:log("Starting", config.modName, GP:version())
    GP:logKeys("Found",config)

    -- STARTUP Register Model Files
    GP:registerModelFiles()
    
    -- STARTUP Register Jobs
    GP:registerAllJobs(config)
    
    -- STARTUP Register Workplaces
    GP:registerAllWorkplaces(config)
    
    -- STARTUP Register Monument
    GP:registerMonumentList(config)

end





