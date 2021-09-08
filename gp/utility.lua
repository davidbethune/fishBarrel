-- MODULE UTILITY.LUA
-- by Garran Plum
--
-- Utility functions used throughout the mod.
-- 
-- FUNCTION ASSIGNMENTS

-- IMPORT GP OBJECT
local myMod, GP = ... 

GP.mod:log("GP | Utility Functions " .. GP.version)

-- GP OBJECT Scaffolding
GP.config = {}
GP.parts = {}
GP.ids = {}
GP.prefabs = {}


-- GP UTILITY FUNCTION load
-- FOUNDATION ONLY
-- UKNOWN EFFECTS (FILE LOAD)
function GP:load(file)
    GP:log("Loading:",[["]] .. file .. [["]])
    GP.mod:dofile(file, GP)
end

-- GP UTILITY FUNCTION Log
-- FOUNDATION ONLY
-- GAME EFFECTS
function GP:log (...)
    local messages = {...}
    local logMessage = ""
    for index, message in pairs(messages) do
        logMessage = logMessage .. " " .. message
    end
    GP.mod:log("GP |" .. logMessage)
end

-- GP UTILITY FUNCTION Log Keys
-- FOUNDATION ONLY
-- GAME EFFECT CALL
function GP:logKeys (label, incomingTable)
    if (not incomingTable) then
        incomingTable, label = label, "keys"
    end
    GP:log(label .. ":",GP:tableKeys(incomingTable))
end

-- GP UTILITY FUNCTION Ternary
-- PURE LUA
-- PURE FUNCTIONAL
function GP:ternary (test, ifTrue, ifFalse)
    local returnValue
    if (test) then 
        returnValue = ifTrue
    else
        returnValue = ifFalse
    end
    return returnValue
end

-- GP UTILITY FUNCTION Split
-- PURE LUA
-- PURE FUNCTIONAL
function GP:split(delimitedString, delimiter)
    if (not delimiter) then
        delimiter = ","
    end
    local resultTable = {};
    for match in (delimitedString .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(resultTable, match);
    end
    return resultTable;
end

-- GP UTILITY FUNCTION Table Length
-- PURE LUA
-- PURE FUNCTIONAL
function GP:tableLength (incomingTable)
    local count = 0
    for key, value in pairs(incomingTable) do 
        count = count + 1 
    end
    return count
end

-- GP UTILITY FUNCTION Array Keys
-- PURE LUA
-- PURE FUNCTIONAL
function GP:getKeys (array)
    local keysObject = {}
    for index, key in pairs(array) do
        keysObject[key] = {}
    end 
    return keysObject
end

-- GP UTILITY FUNCTION Table Keys
-- PURE LUA
-- PURE FUNCTIONAL
function GP:tableKeys (incomingTable, delimiter)
    local keyListString = ""
    if (not delimiter) then
        delimiter = ", "
    end
    for key, value in pairs(incomingTable) do 
        keyListString = key .. delimiter .. keyListString 
    end
    return GP:trim(keyListString, string.len(delimiter))
end

-- GP UTILTY FUNCTION fbx Name
-- PURE LUA
-- MAGIC WORDS
-- PURE FUNCTIONAL
function GP:fbxName (partName) 
    return partName .. "_Part"
end

-- GP UTILTY FUNCTION Prefab Path
-- PURE LUA
-- MAGIC WORDS
-- PURE FUNCTIONAL
function GP:prefabPath (modelFile, partName)
    local prefabPath = "/" .. modelFile .. "/" .. "Prefab" .. "/" .. GP:fbxName(partName) .. "/" 
    return prefabPath
end

-- GP UTILTY FUNCTION Prefab ID
-- PURE LUA
-- MAGIC WORDS
-- PURE FUNCTIONAL
function GP:prefabId (partName) 
    return "PREFAB_" .. GP:fbxName(partName)
end

-- GP UTILTY FUNCTION Part ID
-- PURE LUA
-- MAGIC WORDS
-- PURE FUNCTIONAL
function GP:partId (partName) 
    return "BUILDING_PART_" .. partName
end

-- GP UTILITY FUNCTION Trim
-- PURE LUA
-- PURE FUNCTIONAL
function GP:trim (incomingString, amount)
    if (not amount) then
        amount = 1
    end
    return string.sub(incomingString, 1, string.len(incomingString) - amount)
end
