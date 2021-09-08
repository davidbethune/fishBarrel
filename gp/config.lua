-- MODULE CONFIG.LUA
-- by Garran Plum
--
-- GP Configuration for this individual mod.

-- IMPORT GP OBJECT
local myMod, GP = ...

GP:log("Config",GP.version)

-- MY CONFIG Mod Name
local modName = "fishBarrel"

-- MY CONFIG Paths
local pathList = {"Worker_1", "Worker_2","Transport", "Visitor"}

-- MY CONFIG Categories
local categories = {
    BARREL = {
        Barrel = {
            Function = "FISH_PRODUCER",
            PathNodes = pathList,
            PathTypes = {
                DEFAULT = "Worker_1"
            }
        },
    },
    FISH = {
        Ahi = {},
        Bass = {},
        Choice = {},
        Roughy = {},
        Salmon = {},
        Trout = {},
    },
    CRATE = {
        Crate = {
            Function = "FISH_GENERATOR",
            PathNodes = pathList,
            PathTypes = {
                DEFAULT = "Transport"
            }
        },
        Crate_Stack = {
            Function = "FISH_GENERATOR",
            PathNodes = pathList,
            PathTypes = {
                DEFAULT = "Transport"
            }
        },
    },
    DECOR = {
        MARKET_BLUE_TENT = {AssetRegistered = true, BuildingRegistered = true},
        MARKET_FOOD_SIGN = {AssetRegistered = true, BuildingRegistered = true},
        FLOWER_YELLOW = {AssetRegistered = true},
        FLOWER_BLUE = {AssetRegistered = true},
    },
}

-- MY CONFIG Model Files
local modelFiles = { 
    [modName] = {"BARREL", "CRATE", "FISH", "DECOR"}
}

-- MY CONFIG Node Types
local nodeTypes = {
    MINOR = {"FISH"}
}

-- MY CONFIG Monuments
local monuments = {
    FISH_BARREL = {
        Categories = {
            FISH,
            CRATE,
            BARREL,
            DECOR
            },
        Type = "FOOD_PRODUCTION",
        Function = {}
    }
}

-- Create config object
GP.config = {
    modName = modName,
    modelFiles = modelFiles,
    categories = categories,
    nodeTypes = nodeTypes,
    monuments = monuments
}