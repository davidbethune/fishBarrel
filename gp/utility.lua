-- MODULE UTILITY.LUA
-- by Garran Plum
--
-- General Lua utility functions for all GP mods.
-- 
-- FUNCTION ASSIGNMENTS

-- IMPORT GP OBJECT
local myMod, GP = ... 

GP.mod:log("GP | Utility Functions " .. GP:version())

-- GP UTILITY FUNCTION Copy Table
-- Deep copies a table by value and returns the new copy.
-- PURE FUNCTIONAL, RECURSIVE
function GP:copyTable (incomingTable) 
    local newTable = {}
    for key, value in pairs(incomingTable) do
        if type(value) == "table" then
            value = GP:copyTable(value)
        end
        newTable[key] = value
    end
    return newTable
end


-- GP UTILITY FUNCTION Ternary
-- Returns ifTrue if test is true. Returns ifFalse if test is false.
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
-- Splits delimitedString into an array (resultTable) on delimiter. Default `,`.
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
-- Returns the length of a table or array (incomingTable).
-- PURE FUNCTIONAL
function GP:tableLength (incomingTable)
    local count = 0
    for key, value in pairs(incomingTable) do 
        count = count + 1 
    end
    return count
end

-- GP UTILITY FUNCTION Array Keys
-- Returns a table with one key for each value in array. Key values are empty.
-- Turns array into table.
-- PURE FUNCTIONAL
function GP:getKeys (array)
    local keysObject = {}
    for index, key in pairs(array) do
        keysObject[key] = {}
    end 
    return keysObject
end

-- GP UTILITY FUNCTION Table Keys
-- Returns a delimited string of all keys in a table. Default delimiter is `,`.
-- PURE LUA, PURE FUNCTIONAL
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
-- Trims amount number of characters from end of incomingString. Default is 1.
-- PURE LUA, PURE FUNCTIONAL
function GP:trim (incomingString, amount)
    if (not amount) then
        amount = 1
    end
    return string.sub(incomingString, 1, string.len(incomingString) - amount)
end