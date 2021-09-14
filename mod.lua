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

-- DECLARE: GPS Version
local version = "2.6.0"

-- DECLARE: GP Object
local GP = {}

-- FUNCTION: Version
-- Return GPS version number inside GP functions.
function GP:version() 
    return version
end

-- FUNCTION: Register Mod
-- Registers a mod with Foundation.
-- FUNCTIONAL, GAME EFFECT
function GP:registerMod()
    GP.mod = foundation.createMod()
    GP.mod:log("GPS " .. GP:version() .. " by Garran Plum")
    GP.mod:log("GP | " .. "https://mod.io/members/garranplum")
end

-- CALL: Register Mod
-- Registers this mod with Foundation.
GP:registerMod()

-- EXECUTE FILE: Global Foundation Functions
-- Defines Foundation-specific functions used by all GP mods.
GP.mod:dofile("gp/foundation.lua", GP)

-- EXECUTE FILE: Global Utility Functions
-- Defines general Lua functions used by all GP mods.
GP:load("gp/utility.lua")

-- EXECUTE FILE: Global Magic Word Functions
-- Defines functions that return string literals used by all GP mods.
GP:load("gp/magic.lua")

-- EXECUTE FILE: Prefab Functions
-- Defines prefab registration functions used by all GP mods.
GP:load("gp/prefabs.lua")

-- EXECUTE FILE: Building Functions
-- Defines building part and monument registration functions used by all GP mods.
GP:load("gp/building.lua")

-- EXECUTE FILE: Custom Configuration
-- Declares custom settings for this individual mod.
GP:load("settings/config.lua")

-- EXECUTE FILE: Job Registration Functions
-- Registers all jobs named in the config.
GP:load("gp/jobs.lua")

-- EXECUTE FILE: Resource Generator Registration Functions
-- Registers all generator functions named in the config.
GP:load("gp/generators.lua")

-- EXECUTE FILE: Workplace Registration Functions
-- Defines all workplace functions named in the config.
GP:load("gp/workplaces.lua")

-- EXECUTE FILE: Startup Sequence
-- Defines the startup sequence for this mod.
GP:load("gp/startup.lua")

-- CALL: Start your engines!
-- Calls the defined functions in sequence to start the mod.
GP:startMod()

-- EXECUTE FILE: Apply Custom Overrides
-- Applies custom overrides to any built-in or defined objects.
GP:load("scripts/overrides.lua")

-- CALL: Log Finished Loading
GP:log("Finished Loading", GP:config().modName, GP:version())