-- MODULE MAGIC.LUA
-- by Garran Plum
--
-- Lua functions that return magic words for all GP mods.
-- 
-- FUNCTION ASSIGNMENTS

-- IMPORT GP OBJECT
local myMod, GP = ... 

-- GP UTILITY FUNCTION fbx Name
-- PURE LUA
-- MAGIC WORDS
-- PURE FUNCTIONAL
function GP:fbxName (partName) 
    return partName .. "_Part"
end

-- GP UTILITY FUNCTION Prefab Path
-- PURE LUA
-- MAGIC WORDS
-- PURE FUNCTIONAL
function GP:prefabPath (modelFile, partName)
    local prefabPath = "/" .. modelFile .. "/" .. "Prefab" .. "/" .. GP:fbxName(partName) .. "/" 
    return prefabPath
end

-- GP UTILITY FUNCTION Prefab ID
-- PURE LUA
-- MAGIC WORDS
-- PURE FUNCTIONAL
function GP:prefabId (partName) 
    return "PREFAB_" .. GP:fbxName(partName)
end

-- GP UTILITY FUNCTION Part ID
-- PURE LUA
-- MAGIC WORDS
-- PURE FUNCTIONAL
function GP:partId (partName) 
    return "BUILDING_PART_" .. partName
end