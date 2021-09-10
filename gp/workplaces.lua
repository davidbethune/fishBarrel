-- MODULE WORKPLACES.LUA
-- by Garran Plum
--
-- Collects fish from crate and offers them for transport pickup.
--
-- IMPORT GP OBJECT
local myMod, GP = ...

GP:log("Workplaces", GP.version)

function GP:registerAllWorkplaces(workplaceList)
    for workplaceName, workplaceConfig in pairs(workplaceList) do
        GP:registerWorkplace(workplaceName, workplaceConfig)
    end
end

function GP:registerWorkplace(workplaceName, workplaceConfig)

    local resourceProducedList = {}
    for oneResource, qty in pairs(workplaceConfig.Produces) do
        local resourceProducedItem = {
            Resource = oneResource,
            Quantity = qty
        }
        table.insert(resourceProducedList, resourceProducedItem)
    end

    local resourceRequiredList = {}
    for oneResource, qty in pairs(workplaceConfig.Requires) do
        local resourceRequiredItem = {
            Resource = oneResource,
            Quantity = qty
        }
        table.insert(resourceRequiredList, resourceRequiredItem)
    end

    myMod:register({
        DataType = "BUILDING_FUNCTION_WORKPLACE",
        Id = workplaceName,
        Name = workplaceName .. "_WORKPLACE",
        WorkerCapacity = workplaceConfig.Positions,
        RelatedJob = {Job = workplaceConfig.Job, Behavior = "BEHAVIOR_WORK"},
        InputInventoryCapacity = resourceProducedList,
        ResourceListNeeded = resourceRequiredList,
    })
end

-- FISH_GENERATOR
-- Generates fish in a crate for collection by a fishProducer.

-- CLASS Building Resource Generator
local BUILDING_RESOURCE_GENERATOR = {
    TypeName = "BUILDING_RESOURCE_GENERATOR",
    ParentType = "BUILDING_FUNCTION",
    Properties = {
        {
            Name = "ResourceGenerator",
            Type = "BUILDING_FUNCTION_RESOURCE_GENERATOR",
            Default = "BUILDING_FUNCTION_WELL"
        }, {Name = "MaxQuantity", Type = "integer", Default = 50},
        {Name = "GrowRate", Type = "float", Default = 1.0}
    }
}

-- EVENT Activate Building w/ This Generator 
function BUILDING_RESOURCE_GENERATOR:activateBuilding(gameObject)
    resourceGenerator = gameObject:getOrCreateComponent(
                            "COMP_RESOURCE_GENERATOR")
    resourceGenerator:setResourceGeneratorData(self.ResourceGenerator)
    resourceGenerator:setMaxQuantity(self.MaxQuantity)
    resourceGenerator.GrowRate = self.GrowRate
    return true
end

-- REGISTER Class
myMod:registerClass(BUILDING_RESOURCE_GENERATOR)

-- BUILDING FUNCTION RESOURCE GENERATOR (Parent) Properties
myMod:register({
    DataType = "BUILDING_FUNCTION_RESOURCE_GENERATOR",
    Id = "FISH_GENERATOR_BASE",
    ResourceGenerated = "FISH",
    IsForConsumer = false,
    IsInfinite = false
})

-- BUILDING RESOURCE GENERATOR (New) Properties
myMod:register({
    DataType = "BUILDING_RESOURCE_GENERATOR",
    Id = "FISH_GENERATOR",
    Name = "FISH_GENERATOR_NAME",
    ResourceGenerator = "FISH_GENERATOR_BASE",
    MaxQuantity = 5,
    GrowRate = 0.5
})

