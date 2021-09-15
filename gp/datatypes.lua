-- MODULE DATATYPES.LUA
-- by Garran Plum
--
-- Lua functions that return Foundation datatypes for all GP mods.
-- 
-- FUNCTION ASSIGNMENTS

-- IMPORT GP OBJECT
local myMod, GP = ... 

local datatypes = {
    building = {
        part = "BUILDING_PART",
        constructor = "BUILDING_CONSTRUCTOR_DEFAULT",
        processor = "BUILDING_ASSET_PROCESSOR",
        component = "COMP_BUILDING_PART",
        generatorFunction = "BUILDING_FUNCTION_RESOURCE_GENERATOR",
        generator = "BUILDING_RESOURCE_GENERATOR",

    },
    part = {
        type = "BUILDING_PART_TYPE",
    },
    prefab = {
    },
    model = {
    },
    path = {
    },
    category = {
    }
}

function GP:datatypes()
    return datatypes 
end

