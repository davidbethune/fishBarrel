-- JOBS.LUA
-- by Garran Plum
--
-- 

-- IMPORT GP OBJECT
local myMod, GP = ... 

GP:log("Jobs",GP:version())

-- FUNCTION Register All Jobs
-- FUNCTIONAL, GAME EFFECT CALL
function GP:registerAllJobs()

    -- Sugar for GP:config()
    local config = GP:config()

    -- Sugar for config.jobsList
    local jobsList = config.jobs

    for jobName, jobConfig in pairs(jobsList) do
        GP:registerJob(jobName, jobConfig)
    end
end

-- FUNCTION Register Job
-- FUNCTIONAL, GAME EFFECT
function GP:registerJob(jobName, jobConfig) 
    
myMod:register({
	DataType = "JOB",
	Id = jobName,
	JobName = jobName,
	JobDescription = jobName .. "_DESC",
	IsLockedByDefault = false,
    ProductionDelay = jobConfig.Delay,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        DataType = "CHARACTER_SETUP",
        WalkAnimation = jobConfig.Walk,
		IdleAnimation = jobConfig.Work
		
	}
})

-- Job Allowed for Newcomers
myMod:override({
    Id = "NEWCOMER",
    CompatibleJobList = {
        Action = "APPEND",
        jobName
    }
})

-- Job Allowed for Serfs
myMod:override({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        jobName
    }
})

end