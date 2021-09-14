-- MODULE ATTACH.LUA
-- by Garran Plum
--
-- Functions that register attachment points.
-- 
-- FUNCTION ASSIGNMENTS
-- IMPORT GP OBJECT
local myMod, GP = ...

-- GP FUNCTION Register Attach Node Types
-- Register all the attach node types in config.nodeTypes
-- FUNCTIONAL, GAME EFFECT CALL
function GP:registerAttachNodeTypes(config)

    GP:logKeys("Attach Node Types Config", config)

    -- Sugar for config.nodeTypes
    local nodeTypeList = config.nodeTypes

    -- For each node type...
    for nodeType, categoryKeyList in pairs(nodeTypeList) do

        -- For each category on that node type list...
        for index, categoryKey in ipairs(categoryKeyList) do

            -- Get the list of parts in that category.
            local partsList = config.categories[categoryKey]

            -- Register the parts list to that node type.
            GP:logKeys("Registering " .. nodeType .. " Parts", partsList)
            GP:registerAttachNodeType(nodeType, GP:copyTable(partsList))
        end
    end
end

-- RECURSIVE FUNCTION Register Attach Node Type
-- Register a list of parts to an attach node type.
-- FUNCTIONAL, GAME EFFECT CALL
function GP:registerAttachNodeType(nodeType, partList)

    if (partList and next(partList)) then
    local partKey = next(partList)
        GP:log("Registering", partKey, "to type", nodeType)
        GP.mod:registerPrefabComponent(GP:prefabId(partKey), {
            DataType = "COMP_BUILDING_PART",
            BuildingPartType = ATTACH_NODE_TYPE[nodeType]
        })
        partList[partKey] = nil
        GP:registerAttachNodeType(nodeType, partList)
    end

end

