-- MODULE BUILDING.LUA
-- by Garran Plum
--
-- Functions that register monuments and buildings.
-- 
-- FUNCTION ASSIGNMENTS

-- IMPORT GP OBJECT
local myMod, GP = ...

GP:log("Monument & Building Registration", GP:version())

-- GP FUNCTION Register Category Buildings
-- Register all the building parts in a single category in a model file.
-- FUNCTIONAL, GAME EFFECT CALL
function GP:registerCategoryBuildingParts(modelFileName, category, categoryParts)
    for partName, partConfig in pairs(categoryParts) do
        if (partConfig.BuildingRegistered) then
            GP:log("Using Existing Part:", string.upper(GP:partId(partName)))
        else
            GP:registerBuildingPart(category, partName, partConfig)
        end
    end
end

-- FUNCTION Register Building Part Types
-- Register all the buildling part types in a category.
-- FUNCTIONAL, GAME EFFECT
function GP:registerBuildingPartTypes(categoryArray)
    for index, category in ipairs(categoryArray) do
        GP:log("Registering Building Part Type", category)
        GP.mod:registerEnumValue("BUILDING_PART_TYPE", category)
    end
end

-- FUNCTION Register Building Part
-- Register a single building part within a category.
-- FUNCTIONAL, GAME EFFECT
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
        Description = partName .. GP:magicWords().part.descSuffix,
        Category = category,
        IsMovableWhenBuilt = true,
        ConstructorData = {
            DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
            CoreObjectPrefab = prefabId
        },
        BuildingZone = {
            ZoneEntryList = {
                {
                    Polygon = polygon.createCircle(1, {0, 0}, 6),
                    Type = {
                        DEFAULT = true,
                        NAVIGABLE = false,
                        GRASS_CLEAR = true,
                    }
                }
            }
        }
    })
end