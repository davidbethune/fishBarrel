-- JOBS.LUA
-- by Garran Plum
--
-- Provides a market seller animation at the barrel, collecting from the crate.
--

-- IMPORT GP OBJECT
local myMod, GP = ... 

GP:log("Jobs",GP.version)

-- JOB Fishmonger
myMod:register({
	DataType = "JOB",
	Id = "FISHMONGER",
	JobName = "FISHMONGER",
	JobDescription = "FISHMONGER_DESC",
	IsLockedByDefault = false,
    ProductionDelay = 7,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        DataType = "CHARACTER_SETUP",
        WalkAnimation = "WALKING",
		IdleAnimation = "MARKET_TENDER"
		
	}
})

-- JOB Fishmonger: Allowed for Newcomers
myMod:override({
    Id = "NEWCOMER",
    CompatibleJobList = {
        Action = "APPEND",
        "FISHMONGER"
    }
})

-- JOB Fishmonger: Allowed for Serfs
myMod:override({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "FISHMONGER"
    }
})