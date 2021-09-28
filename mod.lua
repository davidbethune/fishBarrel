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
-- Join The Orchard, a GP modding Discord:
-- https://discord.gg/aeehVjMtzB
--
-- Acknowledgements:
-- Contains versions of models by @Batyushki and @RaisinMuffin, used with permission. 
-- License:
-- This source code is public domain to use as you wish. Attribution is appreciated:
-- "Contains portions of GP mods by Garran Plum. https://mod.io/members/garranplum"
-- 
--

-- BASIC CONFIGURATION
-- Change the line below to the name of file you wish to use, or make your own.
-- Config files are loaded from the /settings folder.

-- MY CONFIG File
local configFile = "config.lua"

-- BUG NOTICE
--
-- I fix all bugs! Please report them at The Orchard link above.
-- Or leave a comment at: https://foundation.mod.io/barrel-ofish
-- Thank you. :-)
--

-- MODULE MOD.LUA
-- Main Entrypoint & Loader

-- CREATE: GP Object 
local GP = {
    mod = foundation.createMod()
}

-- EXECUTE FILE: Loader
-- Sets up GPS.
GP.mod:dofile("gp/loader.lua", GP)

-- EXECUTE FILE: Global Foundation Functions
-- Defines Foundation-specific functions used by all GP mods.
GP.mod:dofile("gp/foundation.lua", GP)

-- EXECUTE FILE: Global Utility Functions
-- Defines general Lua functions used by all GP mods.
GP:load("gp/utility.lua")

-- EXECUTE FILE: Global Magic Word Declarations & Functions
-- Declares string literals used by all GP mods.
GP:load("gp/magic.lua")

-- EXECUTE FILE: Global Datatype Declarations & Functions
-- Defines functions that return string literals for Foundation datatypes.
GP:load("gp/datatypes.lua")

-- EXECUTE FILE: Prefab Functions
-- Defines prefab registration functions used by all GP mods.
GP:load("gp/prefabs.lua")

-- EXECUTE FILE: Attach Functions
-- Defines attach point registration functions used by all GP mods.
GP:load("gp/attach.lua")

-- EXECUTE FILE: Path Functions
-- Defines path registration functions used by all GP mods.
GP:load("gp/paths.lua")

-- EXECUTE FILE: Model File Functions
-- Defines .fbx model file functions used by all GP mods.
GP:load("gp/models.lua")

-- EXECUTE FILE: Building Part Functions
-- Defines building part registration functions used by all GP mods.
GP:load("gp/parts.lua")

-- EXECUTE FILE: Building & Monument Functions
-- Defines building and monument registration functions used by all GP mods.
GP:load("gp/buildings.lua")

-- EXECUTE FILE: Custom Configuration
-- Declares custom settings for this individual mod.
GP:load("settings/" .. configFile)

-- EXECUTE FILE: Job Registration Functions
-- Registers all jobs named in the config.
GP:load("gp/jobs.lua")

-- EXECUTE FILE: Resource Generator Registration Functions
-- Registers all generator functions named in the config.
GP:load("gp/generators.lua")

-- EXECUTE FILE: Workplace Registration Functions
-- Defines all workplace functions named in the config.
GP:load("gp/workplaces.lua")

-- EXECUTE FILE: Override Functions
-- Defines all override functions used by all GP mods.
GP:load("gp/overrides.lua")

-- EXECUTE FILE: Startup Sequence
-- Defines the startup sequence for this mod.
GP:load("gp/startup.lua")

-- CALL: Start your engines!
-- Calls the defined functions in sequence to start the mod.
GP:startMod()

-- EXECUTE FILE: Apply Custom Overrides, If Any
-- Applies custom overrides to any built-in or defined objects.
local customOverrides = "settings/customOverrides.lua"
if GP.mod:fileExists(customOverrides) then
    GP:load(customOverrides)
end

-- CALL: Log Finished Loading
GP:log("Finished Loading", GP:config().modName, GP:version())