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

    -- Get the next part from the list.
    local partKey = GP:next(partList)

    -- If there's a part to process...
    if (partKey) then

        -- Get the first part.
        local partKey = next(partList)

        -- Register the part's attach node type with Foundation.
        GP:log("Registering", partKey, "to type", nodeType)
        GP.mod:registerPrefabComponent(GP:prefabId(partKey), {
            DataType = "COMP_BUILDING_PART",
            BuildingPartType = ATTACH_NODE_TYPE[nodeType]
        })

        -- Remove the part from the list.
        partList[partKey] = nil

        -- Call this function recursively to process the rest of the list.
        GP:registerAttachNodeType(nodeType, partList)
    end
end

