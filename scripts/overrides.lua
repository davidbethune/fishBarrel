-- OVERRIDES.LUA
-- by Garran Plum
--
-- Overrides for built-in buildings.

-- IMPORT GP OBJECT
local myMod, GP = ... 

GP:log("Building Overrides",GP:version())

-- OVERRIDE Blue Market Tent
myMod:register({
    DataType = "BUILDING_PART_COST_LIST",
    Id = "FISH_BARREL_BUILDING_PART_COST_LIST",
    BuildingPartCostList = {
        {
            BuildingPart = "BUILDING_PART_MARKET_BLUE_TENT",
            BuildingPartCost = {
                BuildRightTaxes = {
                    {
                        Resource = "GOLD_COINS",
                        Quantity = 0
                    }
                },
                RessourcesNeeded = {
                    {
                        Resource = "WOOD",
                        Quantity = 0
                    }
                }
            }
        }
    }
})

-- OVERRIDE Building Part Costs
myMod:override({
    Id = "DEFAULT_BALANCING",
    BuildingCostOverrideList = {
        Action = "APPEND","FISH_BARREL_BUILDING_PART_COST_LIST"
    }
})
