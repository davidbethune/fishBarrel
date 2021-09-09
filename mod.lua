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

-- GP OBJECT
GP = {version = "2.1.0",}

-- FUNCTION REGISTERMOD
-- Register mod to the GP object.
function GP:registerMod()
    GP.mod = foundation.createMod()
    GP.mod:log("GPS " .. GP.version .. " by Garran Plum")
    GP.mod:log("GP | " .. "https://mod.io/members/garranplum")
end

-- REGISTER MOD
-- Register this mod with Foundation and the GP object.
GP.registerMod()

-- GLOBAL UTILITIES
-- Setup utility functions used by all GP mods.
GP.mod:dofile("gp/utility.lua", GP)

-- GLOBAL BUILDING FUNCTIONS
GP:load("gp/building.lua")

-- CONFIG
-- Load custom building information.
GP:load("gp/config.lua")

-- JOBS
GP:load("gp/jobs.lua")

-- WORKPLACES
GP:load("scripts/workplaces.lua")

-- STARTUP
-- Register custom buildings using GP object functions.
GP:load("gp/startup.lua")

-- OVERRIDES
GP:load("scripts/overrides.lua")

-- DONE LOADING
GP:log("Finished Loading",GP.config.modName,GP.version)