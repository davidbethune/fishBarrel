-- MODULE UTILITY.LUA
-- by Garran Plum
--
-- General Lua utility functions for all GP mods.
-- 
-- FUNCTION ASSIGNMENTS

-- IMPORT GP OBJECT
local myMod, GP = ... 

GP.mod:log("GP | Utility Functions " .. GP:version())


-- GP UTILITY FUNCTION Ternary
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
-- PURE FUNCTIONAL
function GP:tableLength (incomingTable)
    local count = 0
    for key, value in pairs(incomingTable) do 
        count = count + 1 
    end
    return count
end

-- GP UTILITY FUNCTION Array Keys
-- PURE FUNCTIONAL
function GP:getKeys (array)
    local keysObject = {}
    for index, key in pairs(array) do
        keysObject[key] = {}
    end 
    return keysObject
end

-- GP UTILITY FUNCTION Table Keys
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

-- GP UTILITY FUNCTION Trim
-- PURE LUA
-- PURE FUNCTIONAL
function GP:trim (incomingString, amount)
    if (not amount) then
        amount = 1
    end
    return string.sub(incomingString, 1, string.len(incomingString) - amount)
end