-- MODULE BUILDING.LUA
-- by Garran Plum
--
-- Functions that register monuments and building parts.
-- 
-- FUNCTION ASSIGNMENTS
-- IMPORT GP OBJECT
local myMod, GP = ...

GP:log("Building Registration", GP.version)

-- GP FUNCTION Register Model Files
-- GP & GAME EFFECT CALL
function GP:registerModelFiles(modelFiles)
    GP:logKeys("Registering Model Files", modelFiles)
    for modelFile, categoryKeyArray in pairs(modelFiles) do

        local modelFileName = "models" .. "/" .. modelFile .. ".fbx"

        local categoryKeyList = GP:getKeys(categoryKeyArray)

        -- Register building part types for each category in the file.           
        GP:registerBuildingPartTypes(categoryKeyArray)

        -- Register prefabs for each category in the file.
        for categoryKey in pairs(categoryKeyList) do

            -- Get a list of parts for the category.
            local categoryPartsList = GP.config.categories[categoryKey]
            GP:logKeys("Retrieved prefab parts list for " .. categoryKey,
                       categoryPartsList)

            -- Register all prefabs in the category.
            GP:registerCategoryPrefabs(modelFileName, categoryKey,
                                       categoryPartsList)
        end

        -- Register one asset processor for the entire file.
        GP:log("Registering Asset Processor for",
               [["]] .. modelFileName .. [["]])
        GP.mod:registerAssetProcessor(modelFileName,
                                      {DataType = "BUILDING_ASSET_PROCESSOR"})

        -- Register all attach node types in entire mod.
        GP:registerAttachNodeTypes(GP.config.nodeTypes)

        -- Register all path nodes, path types, and building parts for each category.
        for categoryKey in pairs(categoryKeyList) do

            -- Get a list of parts for the category.
            local categoryPartsList = GP.config.categories[categoryKey]
            GP:logKeys("Retrieved path parts list for " .. categoryKey,
                       categoryPartsList)

            -- Register all path nodes and types to all parts in the category.
            GP:registerPartPaths(modelFileName, categoryKey)

            -- Register all building parts in the category.
            GP:registerCategoryBuildingParts(modelFileName, categoryKey,
                                             categoryPartsList)
        end
    end
end

-- GP FUNCTION Register Category Prefabs
-- GP EFFECT CALL, GAME EFFECT CALL
function GP:registerCategoryPrefabs(modelFileName, category, categoryPartsList)
    GP:logKeys("Registering Prefabs", categoryPartsList)
    for partName in pairs(categoryPartsList) do
        local partConfig = GP.config.categories[category][partName]
        if (partConfig.AssetRegistered) then
            GP:log("Using Existing Prefab:", string.upper(GP:prefabId(partName)))
        else
            GP:registerPrefab(modelFileName, partName)
        end
    end
end

-- GP FUNCTION Register Category Buildings
-- GP EFFECT CALL, GAME EFFECT CALL
function GP:registerCategoryBuildingParts(modelFileName, category, categoryParts)
    for partName, partConfig in pairs(categoryParts) do
        if (partConfig.BuildingRegistered) then
            GP:log("Using Existing Part:", string.upper(GP:partId(partName)))
        else
            GP:registerBuildingPart(category, partName, partConfig)
        end
    end
end

-- GP FUNCTION Register Part Paths
-- REQUIRES GP Object
-- GP EFFECT CALL, GAME EFFECT CALL
function GP:registerPartPaths(modelFileName, categoryKey)

    -- Get the parts in the category
    local categoryPart = GP.config.categories[categoryKey]

    -- For each part in the category...
    for partName, partConfig in pairs(categoryPart) do

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

-- GP FUNCTION Register Prefab
-- FUNCTIONAL INPUTS
-- GAME EFFECT
function GP:registerPrefab(modelFileName, partName)
    GP:log("Registering Prefab", GP:prefabPath(modelFileName, partName), "to",
           GP:prefabId(partName))
    GP.mod:registerAssetId(GP:prefabPath(modelFileName, partName),
                           GP:prefabId(partName))
end

-- GP FUNCTION Register Attach Node Types
-- READS GP.config.categories
-- GAME EFFECT
function GP:registerAttachNodeTypes(nodeTypeList)
    GP:logKeys("Registering Attach Node Types", nodeTypeList)
    for nodeType, partsListKeyList in pairs(nodeTypeList) do
        local partsListKeys = GP:getKeys(partsListKeyList)
        for partsList, value in pairs(partsListKeys) do
            local partsList = GP.config.categories[partsList]
            GP:registerAttachNodeType(nodeType, partsList)
        end
    end
end

-- FUNCTION Register Attach Node Type
-- FUNCTIONAL INPUTS
-- GAME EFFECT CALL
function GP:registerAttachNodeType(nodeType, partList)
    GP:logKeys("Registering " .. nodeType .. " Parts", partList)
    for partName in pairs(partList) do
        GP:registerAttachNodePart(partName, nodeType)
    end
end

-- FUNCTION Register Attach Node Part
-- FUNCTIONAL INPUTS
-- GAME EFFECT
function GP:registerAttachNodePart(partName, nodeType)
    local prefabId = GP:prefabId(partName)
    GP:log("Registering", prefabId, "to node type", nodeType)
    GP.mod:registerPrefabComponent(prefabId, {
        DataType = "COMP_BUILDING_PART",
        BuildingPartType = ATTACH_NODE_TYPE[nodeType]
    })
end

-- FUNCTION Register Building Part Types
-- FUNCTIONAL INPUTS
-- GAME EFFECT
function GP:registerBuildingPartTypes(categoryArray)
    for index, category in pairs(categoryArray) do
        GP:log("Registering Building Part Type", category)
        GP.mod:registerEnumValue("BUILDING_PART_TYPE", category)
    end
end

-- FUNCTION Register Building Part
-- FUNCTIONAL INPUTS
-- GAME EFFECT
function GP:registerBuildingPart(category, partName, partConfig)
    local partId = GP:partId(partName)
    local prefabId = GP:prefabId(partName)
    if (partConfig.AssetRegistered) then prefabId = string.upper(prefabId) end
    local buildingFunction = partConfig.Function
    GP:log("Registering Building Part", prefabId, "to", partId)
    GP.mod:register({
        DataType = "BUILDING_PART",
        Id = partId,
        AssetBuildingFunction = buildingFunction,
        Name = partName,
        Description = partName .. "_DESC",
        Category = category,
        IsMovableWhenBuilt = true,
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = prefabId
        }
    })
end

-- FUNCTION Register Path Nodes
-- PURE FUNCTIONAL
function GP:registerPathNodes(modelFileName, partName, pathNodes)
    for index, pathKey in pairs(pathNodes) do
        local pathName = "Path" .. "_" .. GP:fbxName(partName) .. "_" .. pathKey
        local pathId = string.upper(pathName)
        local pathPath = GP:prefabPath(modelFileName, partName) .. pathName
        GP:log("Registering path path", pathPath, "to", pathId)
        myMod:registerAssetId(pathPath, pathId)
    end

end

-- FUNCTION Register Path Types
function GP:registerPathTypes(modelFileName, partName, pathTypes)
    GP:logKeys("Registering Path Types for " .. partName, pathTypes)

    local pathNodeList = {}

    for typeName, nodeName in pairs(pathTypes) do
        local pathName = "Path" .. "_" .. GP:fbxName(partName) .. "_" ..
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

-- FUNCTION Register Monument
-- FUNCTIONAL INPUTS
-- GAME EFFECT
function GP:registerMonument(buildingName, config)
    GP:log("Registering Monument:", buildingName)

    -- Build Parts Lists
    local buildingPartsList = {}
    local requiredPartsList = {}

    -- For each category in the monument...
    for categoryKey, categoryConfig in pairs(
                                           config.monuments[buildingName]
                                               .Categories) do

        GP:log("Monument Category", categoryKey)

        local categoryPartsList = {
            Name = "CATEGORY_" .. categoryKey,
            BuildingPartList = {}
        }

        -- For each part in the category...
        for partKey, partConfig in pairs(config.categories[categoryKey]) do

            -- Add the part to the category parts list
            table.insert(categoryPartsList.BuildingPartList,
                         "BUILDING_PART_" .. partKey)
        end

        -- Add the category parts list to the monument
        table.insert(buildingPartsList, categoryPartsList)

        -- Add category part requirements, if any
        if (categoryConfig.Min) then
            table.insert(requiredPartsList,
                         {Category = categoryKey, Min = categoryConfig.Min})
        end

    end

    myMod:register({
        DataType = "BUILDING",
        Id = "BUILDING_" .. buildingName,
        Name = buildingName,
        Description = buildingName .. "_DESC",
        BuildingType = config.monuments[buildingName].Type,
        -- AssetBuildingFunction = config.monuments[buildingName].Function,
        AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
        BuildingPartSetList = buildingPartsList,
        RequiredPartList = requiredPartsList
    })
end

-- FUNCTION Register Monument List
-- FUNCTIONAL INPUTS
-- GAME EFFECT CALL
function GP:registerMonumentList(config)
    GP:logKeys("Registering Monuments", config.monuments)
    for buildingName, buildingConfig in pairs(config.monuments) do
        GP:logKeys("Monument Config " .. buildingName, buildingConfig)
        GP:registerMonument(buildingName, config)
    end
end
