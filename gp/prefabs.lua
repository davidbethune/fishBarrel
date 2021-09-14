-- MODULE PREFABS.LUA
-- by Garran Plum
--
-- Functions that register prefabs.
-- 
-- FUNCTION ASSIGNMENTS

-- IMPORT GP OBJECT
local myMod, GP = ...

-- GP FUNCTION Register Category Prefabs
-- Register all the prefabs in a single category in a model file.
-- FUNCTIONAL, GAME EFFECT CALL
function GP:registerCategoryPrefabs(modelFileName, category, config)

    -- Sugar for config.categories[category]
    local categoryPartsList = config.categories[category]

    GP:logKeys("Registering Prefabs", categoryPartsList)
    for partName in pairs(categoryPartsList) do
        local partConfig = categoryPartsList[partName]
        if (partConfig.AssetRegistered) then
            GP:log("Using Existing Prefab:", string.upper(GP:prefabId(partName)))
        else
            GP:registerPrefab(modelFileName, partName)
        end
    end
end

-- GP FUNCTION Register Prefab
-- Register a single prefab in a model file.
-- FUNCTIONAL, GAME EFFECT
function GP:registerPrefab(modelFileName, partName)
    GP:log("Registering Prefab", GP:prefabPath(modelFileName, partName), "to",
           GP:prefabId(partName))
    GP.mod:registerAssetId(GP:prefabPath(modelFileName, partName),
                           GP:prefabId(partName))
end