-- MODULE MAGIC.LUA
-- by Garran Plum
--
-- Lua functions that return magic words for all GP mods.
-- 
-- FUNCTION ASSIGNMENTS

-- IMPORT GP OBJECT
local myMod, GP = ... 

local magicWords = {
    part = {
        separator = "_Part",
        idPrefix = "BUILDING_PART_"
    },
    prefab = {
        folder = "Prefab",
        idPrefix = "PREFAB_"
    }
}

function GP:magicWords()
    return magicWords 
end

-- GP UTILITY FUNCTION fbx Name
-- PURE LUA
-- PURE FUNCTIONAL, MAGIC WORDS
function GP:fbxName (partName) 
    return partName .. GP:magicWords().part.separator
end

-- GP UTILITY FUNCTION Prefab Path
-- PURE LUA
-- PURE FUNCTIONAL, MAGIC WORDS
function GP:prefabPath (modelFile, partName)
    local prefabPath = "/" .. modelFile .. "/" .. GP:magicWords().prefab.folder .. "/" .. GP:fbxName(partName) .. "/" 
    return prefabPath
end

-- GP UTILITY FUNCTION Prefab ID
-- PURE LUA
-- PURE FUNCTIONAL, MAGIC WORDS
function GP:prefabId (partName) 
    return GP:magicWords().prefab.idPrefix .. GP:fbxName(partName)
end

-- GP UTILITY FUNCTION Part ID
-- PURE LUA
-- PURE FUNCTIONAL, MAGIC WORDS
function GP:partId (partName) 
    return GP:magicWords().part.idPrefix .. partName
end