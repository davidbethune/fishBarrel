-- MODULE PATHS.LUA
-- by Garran Plum
--
-- Functions that register paths.
-- 
-- FUNCTION ASSIGNMENTS

-- IMPORT GP OBJECT
local myMod, GP = ...

-- GP FUNCTION Register Part Paths
-- Register path nodes and types for all parts in a single category in a model file.
-- FUNCTIONAL, GAME EFFECT CALL
function GP:registerPartPaths(modelFileName, categoryKey, config)

    -- Sugar for config.categories[categoryKey]
    local categoryPartList = config.categories[categoryKey]

    -- For each part in the category...
    for partName, partConfig in pairs(categoryPartList) do

        -- If the part has path nodes, register them.
        if (partConfig.PathNodes) then
            GP:log("Registering path nodes for", partName)
            GP:registerPathNodes(modelFileName, partName, partConfig.PathNodes)
        end

        -- If the part has path types, register them.
        if (partConfig.PathTypes) then
            GP:log("Registering path types for", partName)
            GP:logKeys(partName, partConfig.PathTypes)
            GP:registerPathTypes(modelFileName, partName, partConfig.PathTypes)
        end
    end
end

-- FUNCTION Register Path Nodes
-- Register all the path nodes in single part in a model file.
-- PURE FUNCTIONAL
function GP:registerPathNodes(modelFileName, partName, pathNodes)
    for index, pathKey in ipairs(pathNodes) do
        local pathName = GP:magicWords().path.namePrefix .. GP:fbxName(partName) .. "_" .. pathKey
        local pathId = string.upper(pathName)
        local pathPath = GP:prefabPath(modelFileName, partName) .. pathName
        GP:log("Registering path path", pathPath, "to", pathId)
        myMod:registerAssetId(pathPath, pathId)
    end

end

-- FUNCTION Register Path Types
-- Register a single path type on a single part in a model file.
-- FUNCTIONAL, GAME EFFECT
function GP:registerPathTypes(modelFileName, partName, pathTypes)
    GP:logKeys("Registering Path Types for " .. partName, pathTypes)

    local pathNodeList = {}

    for typeName, nodeName in pairs(pathTypes) do
        local pathName = GP:magicWords().path.namePrefix .. GP:fbxName(partName) .. "_" ..
                             nodeName
        local pathId = string.upper(pathName)
        GP:log("Adding type", typeName .. ":", pathId, "to", partName)
        local onePathNode = {
            PathType = BUILDING_PATH_TYPE[typeName],
            WayPointList = {pathId}
        }
        table.insert(pathNodeList, onePathNode)
    end

    GP:log("Registering path node list for", GP:prefabPath(modelFileName, partName))
    myMod:registerPrefabComponent(GP:prefabPath(modelFileName, partName), {
        DataType = "COMP_BUILDING_PART",
        PathList = pathNodeList
    })
end