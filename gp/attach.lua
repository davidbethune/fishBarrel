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
                GP:registerAttachNodeType(nodeType, partsList)
            end
        end
    end
    
    -- FUNCTION Register Attach Node Type
    -- Register all the parts of a single attach node type.
    -- FUNCTIONAL, GAME EFFECT CALL
    function GP:registerAttachNodeType(nodeType, partList)
        GP:logKeys("Registering " .. nodeType .. " Parts", partList)
        for partName in pairs(partList) do
            GP:registerAttachNodePart(partName, nodeType)
        end
    end
    
    -- FUNCTION Register Attach Node Part
    -- Register a single part to an attach node type.
    -- FUNCTIONAL, GAME EFFECT
    function GP:registerAttachNodePart(partName, nodeType)
        local prefabId = GP:prefabId(partName)
        GP:log("Registering", prefabId, "to node type", nodeType)
        GP.mod:registerPrefabComponent(prefabId, {
            DataType = "COMP_BUILDING_PART",
            BuildingPartType = ATTACH_NODE_TYPE[nodeType]
        })
    end