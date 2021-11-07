-- MODULE CONFIG.LUA
-- by Garran Plum
--
-- GP Configuration for this individual mod.
-- IMPORT GP OBJECT
local myMod, GP = ...

-- MY CONFIG Mod Name
local modName = "casaDeFruta"

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
        Produces = {FISH = 0},
        Requires = {FISH = 1},
        Carries = {FISH = 5}
    },
    FISH_GENERATOR = {Produces = {FISH = 5}, Rate = 0.03125},
    BERRY_GENERATOR = {Produces = {BERRIES = 5}, Rate = 0.03125}
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
            Order = 2,
            Function = "FISH_GENERATOR",
            PathNodes = pathList,
            PathTypes = {DEFAULT = "Transport"}
        },
        CRATE_FLAT_IRON = {
            Order = 1,
            AssetRegistered = true,
            BuildingRegistered = true
        },
        Crate_Stack = {
            Order = 1,
            Function = "FISH_GENERATOR",
            PathNodes = pathList,
            PathTypes = {DEFAULT = "Transport"}
        }
    },
    PRODUCE_CRATE = {Produce_Crate = {Function = "BERRY_GENERATOR"}},
    TROUGH = {TROUGH_HAY = {AssetRegistered = true, BuildingRegistered = true}},
    BUCKET = {
        BUCKET_WATER = {AssetRegistered = true, BuildingRegistered = true}
    },
    TABLE = {
        TABLE_WOOD1 = {AssetRegistered = true, BuildingRegistered = true},
        TABLE_WOOD2 = {AssetRegistered = true, BuildingRegistered = true}
    },
    SEATING = {
        BENCH_WOOD1 = {AssetRegistered = true, BuildingRegistered = true},
        STOOL_WOOD1 = {AssetRegistered = true, BuildingRegistered = true},
        STOOL_WOOD2 = {AssetRegistered = true, BuildingRegistered = true}
    },

    FRIENDS = {Black_Cat = {}, Coon_Cat = {}, Boxer_Dog = {}, Collie_Dog = {}},
    DECOR = {
        BUILDING_PART_MARKET_BLUE_TENT = {
            Order = 1,
            AssetRegistered = true,
            BuildingRegistered = true
        },
        BUILDING_PART_MARKET_FOOD_SIGN = {
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
    [modName] = {"PRODUCE_CRATE"},
    fishBarrel = {"CRATE", "DECOR", "BARREL"},
    friends = {"FRIENDS"}
}

-- MY CONFIG Node Types
-- local nodeTypes = {MINOR = {"FISH"}}

-- MY CONFIG Monuments
local monuments = {
    CASA_DE_FRUTA = {
        Categories = {
            BARREL = {Order = 1},
            CRATE = {Order = 2},
            PRODUCE_CRATE = {Order = 3},
            BUCKET = {Order = 4},
            TROUGH = {Order = 5},
            TABLE = {Order = 6},
            SEATING = {Order = 7},
            FRIENDS = {Order = 8},
            DECOR = {Order = 9}
        },
        Type = "FOOD_PRODUCTION",
        Function = {},
        Logo = "BUILDING_PART_MARKET_FOOD_SIGN"
    }
}

-- WARNING!
--
-- MY CONFIG Ends Here. Changing code below this line will change *GPS*, not just your mod!
-- As an alternative to the code above, you may return your own config table.
--
--
-- Create the config table.
local config = {
    version = GP:gpsVersion(),
    remix = remix or {},
    modName = modName,
    modelFiles = modelFiles or {},
    categories = categories or {},
    nodeTypes = nodeTypes or {},
    jobs = jobs or {},
    workplaces = workplaces or {},
    generators = generators or {},
    monuments = monuments or {},
    buildings = buildings or {},
    logo = logo or {}
}

-- Return config to loader
return config

