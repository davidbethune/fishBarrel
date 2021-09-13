-- MODULE WORKPLACES.LUA
-- by Garran Plum
--
-- Collects fish from crate and offers them for transport pickup.
--
-- IMPORT GP OBJECT
local myMod, GP = ...

GP:log("Workplaces", GP:version())

function GP:registerAllWorkplaces()

    -- Sugar for GP:config()
    local config = GP:config()

    -- Sugar for config.workplaces
    local workplaceList = config.workplaces

    for workplaceName, workplaceConfig in pairs(workplaceList) do

        if (workplaceConfig.Job) then
        GP:registerWorkplace(workplaceName, workplaceConfig)
        else
        GP:registerGenerator(workplaceConfig)
        end

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
        Name = workplaceName,
        WorkerCapacity = workplaceConfig.Positions,
        RelatedJob = {Job = workplaceConfig.Job, Behavior = "BEHAVIOR_WORK"},
        InputInventoryCapacity = resourceProducedList,
        ResourceListNeeded = resourceRequiredList,
    })
end



