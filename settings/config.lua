-- MODULE CONFIG.LUA
-- by Garran Plum
--
-- GP Configuration for this individual mod.

-- IMPORT GP OBJECT
local myMod, GP = ...

GP:log("config.lua", GP:version())

-- MY CONFIG Mod Name
local modName = "fishBarrel"

-- MY CONFIG Paths
local pathList = {"Worker_1", "Worker_2", "Transport", "Visitor"}

-- MY CONFIG Jobs
local jobs = {
    FISHMONGER = {Work = "MARKET_TENDER", Walk = "WALKING", Delay = 7}
}

-- MY CONFIG Workplaces
local workplaces = {
    FISH_PRODUCER = {
        Job = "FISHMONGER",
        Positions = 1,
        Produces = {FISH = 5},
        Requires = {FISH = 0}
    },
    FISH_GENERATOR = {Produces = {FISH = 5}, Rate = 0.03125}
}

-- MY CONFIG Categories
local categories = {
    BARREL = {
        Barrel = {
            Function = "FISH_PRODUCER",
            PathNodes = pathList,
            PathTypes = {DEFAULT = "Worker_1"}
        }
    },
    CRATE = {
        Crate = {
            Order = 1,
            Function = "FISH_GENERATOR",
            PathNodes = pathList,
            PathTypes = {DEFAULT = "Transport"}
        },
        Crate_Stack = {
            Order = 2,
            Function = "FISH_GENERATOR",
            PathNodes = pathList,
            PathTypes = {DEFAULT = "Transport"}
        }
    },
    FISH = {
        Ahi = {Order = 1},
        Roughy = {Order = 2},
        Grouper = {Order = 3},
        Salmon = {Order = 4},
        Bass = {Order = 5},
        Trout = {Order = 6},
        Choice = {Order = 7}
    },
    FRIENDS = {
        Black_Cat = {}, 
        Coon_Cat = {}, 
        Boxer_Dog = {}, 
        Collie_Dog = {}
    },
    DECOR = {
        MARKET_BLUE_TENT = {
            Order = 1,
            AssetRegistered = true,
            BuildingRegistered = true
        },
        MARKET_FOOD_SIGN = {
            Order = 2,
            AssetRegistered = true,
            BuildingRegistered = true
        },
        Flower_Yellow = {Order = 3},
        Flower_Blue = {Order = 4},
        Flower_Orange = {Order = 5}
    }
}

-- MY CONFIG Model Files
local modelFiles = {
    [modName] = {"CRATE", "DECOR", "BARREL", "FISH"},
    friends = {"FRIENDS"}
}

-- MY CONFIG Node Types
local nodeTypes = {MINOR = {"FISH"}}

-- MY CONFIG Monuments
local monuments = {
    FISH_BARREL = {
        Categories = {
            BARREL = {Order = 1, Min = 1},
            CRATE = {Order = 2, Min = 1},
            FISH = {Order = 3},
            FRIENDS = {Order = 4},
            DECOR = {Order = 5}
        },
        Type = "FOOD_PRODUCTION",
        Function = {}
    }
}

function GP:config()
    -- Create config object
    local config = {
        version = GP:version(),
        modName = modName,
        modelFiles = modelFiles,
        categories = categories,
        nodeTypes = nodeTypes,
        jobs = jobs,
        workplaces = workplaces,
        monuments = monuments
    }
    return GP:copyTable(config)
end

