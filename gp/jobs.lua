-- JOBS.LUA
-- by Garran Plum
--
-- 

-- IMPORT GP OBJECT
local myMod, GP = ... 

GP:log("Jobs",GP.version)

function GP:registerAllJobs(jobsList)
    for jobName, jobConfig in pairs(jobsList) do
        GP:registerJob(jobName, jobConfig)
    end
end

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