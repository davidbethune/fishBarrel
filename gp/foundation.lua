-- MODULE FOUNDATION.LUA
-- by Garran Plum
--
-- Foundation-specific utility functions for all GP mods.
-- 
-- FUNCTION ASSIGNMENTS

-- IMPORT GP OBJECT
local myMod, GP = ... 

-- GP FOUNDATION FUNCTION Load
-- UKNOWN EFFECTS (FILE LOAD & EXECUTE)
function GP:load(file)
    GP:log("Loading:",[["]] .. file .. [["]])
    GP.mod:dofile(file, GP)
end

-- GP FOUNDATION FUNCTION Log
-- GAME EFFECTS
function GP:log (...)
    local messages = {...}
    local logMessage = ""
    for index, message in pairs(messages) do
        logMessage = logMessage .. " " .. message
    end
    GP.mod:log("GP |" .. logMessage)
end

-- GP FOUNDATION FUNCTION Log Keys
-- GAME EFFECT CALL
function GP:logKeys (label, incomingTable)
    if (not incomingTable) then
        incomingTable, label = label, "keys"
    end
    GP:log(label .. ":",GP:tableKeys(incomingTable))
end