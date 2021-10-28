-- CASA DE FRUTA
-- by Garran Plum
--
-- Provides a flexible fruit stand with fresh produce.
-- 
-- Find usage and modding instructions:
-- https://foundation.mod.io/casa-de-fruta
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
-- Or leave a comment at: https://foundation.mod.io/casa-de-fruta
-- Thank you. :-)
--

-- MODULE MOD.LUA
-- Main Entrypoint & Loader

-- CREATE: GP Object 
local GP = {mod = foundation.createMod()}

-- EXECUTE FILE: Loader
-- Sets up GPS.
GP.mod:dofile("gp/loader.lua", GP, configFile)
