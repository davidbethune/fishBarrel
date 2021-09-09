-- MODULE STARTUP.LUA
-- by Garran Plum
--
-- Load game assets and create mod buildings.
-- 

-- IMPORT GP OBJECT
local myMod, GP = ... 

GP:log("Starting", GP.config.modName, GP.version)

-- STARTUP Register Model Files
GP:registerModelFiles(GP.config.modelFiles)

-- STARTUP Register Jobs
GP:registerAllJobs(GP.config.jobs)

-- STARTUP Register Workplaces
GP:registerAllWorkplaces(GP.config.workplaces)

-- STARTUP Register Building Part Types
GP:registerBuildingPartTypes(GP.config.categories)

-- STARTUP Register Monument
GP:registerMonumentList(GP.config.monuments)



