-- MODULE DATATYPES.LUA
-- by Garran Plum
--
-- Lua functions that return Foundation datatypes and built-in IDs for all GP mods.
-- 
-- FUNCTION ASSIGNMENTS

-- IMPORT GP OBJECT
local myMod, GP = ... 

local datatypes = {
    building = {
        registrationType = "BUILDING",
        part = "BUILDING_PART",
        constructor = "BUILDING_CONSTRUCTOR_DEFAULT",
        processor = "BUILDING_ASSET_PROCESSOR",
        generatorFunction = "BUILDING_FUNCTION_RESOURCE_GENERATOR",
        generator = "BUILDING_RESOURCE_GENERATOR",

    },
    part = {
        registrationType = "COMP_BUILDING_PART",
        type = "BUILDING_PART_TYPE",
    },
    workplace = {
        registrationType = "BUILDING_FUNCTION_WORKPLACE",
    },
    job = {
        registrationType = "JOB",
        character = "CHARACTER_SETUP",
        behavior = "BEHAVIOR_WORK",
    },
    action = {
        append = "APPEND"
    }
}

local datatype ids = {
    monumentPole = "BUILDING_PART_MONUMENT_POLE",
    jobProgression = "DEFAULT_JOB_PROGRESSION",
    serf = "SERF",
    newcomer = "NEWCOMER",
}

function GP:datatypes()
    return datatypes 
end

function GP:ids()
    return ids 
end
