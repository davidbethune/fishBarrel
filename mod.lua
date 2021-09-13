-- BARREL O'FISH
-- by Garran Plum
--
-- Provides a barrel which quickly produces fish.
-- Creates a Fishmonger job to fill the barrel. 
-- Transporters take produced fish to the Granary.
-- 
-- Find usage and modding instructions:
-- https://foundation.mod.io/barrel-ofish
--
-- Get more GP mods at mod.io:
-- https://mod.io/members/garranplum
--
-- Join the Foundation modding community:
-- https://discord.gg/foundation
--
-- Join The Orchard, a GP modding server:
-- https://discord.gg/aeehVjMtzB
--
-- Acknowledgements:
-- Contains versions of models by @Batyushki and @RaisinMuffin, used with permission. 
-- Inspired by code from these modders and @Minotorious and @SkunkMonkey.

-- License:
-- This source code is public domain to use as you wish. Attribution is appreciated:
-- "Contains portions of GP mods by Garran Plum. https://mod.io/members/garranplum"
-- 

-- MODULE MOD.LUA
-- Mod Main Entrypoint & Loader

-- GPS VERSION
local version = "2.5.0"

-- GP OBJECT
local GP = {}

-- FUNCTION VERSION
-- Return version number inside GP functions.
function GP:version() 
    return version
end

-- FUNCTION REGISTERMOD
-- Register mod to the GP object.
function GP:registerMod()
    GP.mod = foundation.createMod()
    GP.mod:log("GPS " .. GP:version() .. " by Garran Plum")
    GP.mod:log("GP | " .. "https://mod.io/members/garranplum")
end


-- REGISTER MOD
-- Registers this mod with Foundation.
GP:registerMod()

-- GLOBAL FOUNDATION FUNCTIONS
-- Defines Foundation-specific functions used by all GP mods.
GP.mod:dofile("gp/foundation.lua", GP)

-- GLOBAL UTILITY FUNCTIONS
-- Defines general Lua functions used by all GP mods.
GP:load("gp/utility.lua")

-- GLOBAL MAGIC WORD FUNCTIONS
-- Defines functions that return string literals used by all GP mods.
GP:load("gp/magic.lua")

-- GLOBAL UTILITY FUNCTIONS
-- Defines utility functions used by all GP mods.
GP:load("gp/utility.lua")

-- GLOBAL BUILDING FUNCTIONS
-- Defines building functions used by all GP mods.
GP:load("gp/building.lua")

-- CONFIG DECLARATIONS
-- Declares custom settings for this individual mod.
GP:load("settings/config.lua")

-- JOB FUNCTIONS
-- Defines all jobs named in the config.
GP:load("gp/jobs.lua")

-- GENERATOR FUNCTIONS
-- Defines all generator functions named in the config.
GP:load("gp/generators.lua")

-- WORKPLACE FUNCTIONS
-- Defines all workplace functions named in the config.
GP:load("gp/workplaces.lua")

-- STARTUP FUNCTION
-- Defines the startup sequence for this mod.
GP:load("gp/startup.lua")

-- START MOD
-- Calls the defined functions in sequence to start the mod.
GP:startMod()

-- APPLY OVERRIDES
-- Applies custom overrides to any built-in or defined objects.
GP:load("scripts/overrides.lua")

-- DONE LOADING
GP:log("Finished Loading", GP:config().modName, GP:version())