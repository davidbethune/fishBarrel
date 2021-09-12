-- MODULE STARTUP.LUA
-- by Garran Plum
--
-- Load game assets and create mod buildings.
-- 

-- IMPORT GP OBJECT
local myMod, GP = ... 

function GP:startMod(config)

    GP:log("Starting", config.modName, GP.version)

    -- STARTUP Register Model Files
    GP:registerModelFiles(config.modelFiles)
    
    -- STARTUP Register Jobs
    GP:registerAllJobs(config.jobs)
    
    -- STARTUP Register Workplaces
    GP:registerAllWorkplaces(config.workplaces)
    
    -- STARTUP Register Monument
    GP:registerMonumentList(config)

end





