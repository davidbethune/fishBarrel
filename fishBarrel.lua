-- BARREL O'FISH
-- by Garran Plum
--
-- Provides a barrel which quickly produces fish.
-- Creates a Fishmonger job to fill the barrel. 
-- Transporters take produced fish to the Granary.
--
--

-- MOD Fish Barrel
local fishBarrel = ...

-- ENUMS 
fishBarrel:registerEnumValue ("BUILDING_PART_TYPE", "BARREL")
fishBarrel:registerEnumValue ("BUILDING_PART_TYPE", "CRATE")
fishBarrel:registerEnumValue ("BUILDING_PART_TYPE", "FLOWERS")

-- BUILDING Fish Barrel (Monument Type)
fishBarrel:register({
	DataType = "BUILDING", 
	Id = "BUILDING_FISH_BARREL",
	Name = "BUILDING_FISH_BARREL_NAME",
	Description = "BUILDING_FISH_BARREL_DESC",
	BuildingType = "FOOD_PRODUCTION",
    AssetCoreBuildingPart = "BUILDING_PART_MONUMENT_POLE",
    BuildingPartSetList = {
        {
            Name = "BUILDING_FISH_BARREL_PARTS",
            BuildingPartList = {
                "BUILDING_PART_FISH",
                "BUILDING_PART_CRATE",
                "BUILDING_PART_CRATE_STACK",
                "BUILDING_PART_MARKET_FOOD_SIGN",
                "BUILDING_PART_MARKET_BLUE_TENT",
                "BUILDING_PART_FLOWERS_YELLOW",
                "BUILDING_PART_FLOWERS_BLUE"
            }
        }
    },
    RequiredPartList = {
            {
                Category = "BARREL",
                Min = 1
            }
    }
})

-- BUILDING PART Fish
fishBarrel:register({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FISH",
	Name = "BUILDING_PART_FISH_NAME",
    Category = "BARREL",
    IsMovableWhenBuilt = true,
    AssetBuildingFunction = "BUILDING_FUNCTION_FISH_PRODUCER",  
	ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab =  "PREFAB_BARREL_FISH_PART"
	},
    BuildingZone = { 
        ZoneEntryList = {
            { 
                Polygon = polygon.createCircle(2.0),
                Type = { DEFAULT = true, GRASS_CLEAR = true } 
			},
		},
	},
})


-- RESOURCE CONTAINER FISH
fishBarrel:registerPrefabComponent( "PREFAB_BARREL_FISH_PART", {
    DataType = "COMP_RESOURCE_CONTAINER",
    ResourceData = "FISH",
    IsReplenishable = true,
    ReplenishDurationInDays = 7,
    ReplenishQuantity = 10,
    ResourceValue = 10.0, -- how many fish collected with each pickup
    AvailableQuantity = 50, -- maximum barrel stock
    Radius = 0.85, -- how far away worker stands
    IsDestroyWhenEmpty = false
})

-- BUILDING FUNCTION Fish Producer
fishBarrel:register({
    DataType = "BUILDING_FUNCTION_WORKPLACE",
    Id = "BUILDING_FUNCTION_FISH_PRODUCER",
    Name = "BUILDING_FISH_BARREL_DESC",
    WorkerCapacity = 1,
    RelatedJob = { 
        Job = "FISHMONGER", 
        Behavior = "WORK_BEHAVIOR"
	},
	ResourceProduced = {
		{ Resource = "FISH", Quantity = 1 },
	}
})

-- BUILDING PART Crate
fishBarrel:register({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_CRATE",
	Name = "CATEGORY_CRATE_SING",
    Category = "CRATE",
    IsMovableWhenBuilt = true,
    ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab =  "PREFAB_CRATE1_PART"
	}
})

-- BUILDING PART Crate Stack
fishBarrel:register({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_CRATE_STACK",
	Name = "CATEGORY_CRATE_PL",
    Category = "CRATE",
    IsMovableWhenBuilt = true,
    ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab =  "PREFAB_CRATE4_PART"
	}
    
})


-- BUILDING PART Flowers Yellow
fishBarrel:register({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FLOWERS_YELLOW",
	Name = "CATEGORY_FLOWERS_YELLOW_SING",
    Category = "FLOWERS",
    IsMovableWhenBuilt = true,
    ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab =  "PREFAB_FLOWER_YELLOW_PART"
	}
    
})

-- BUILDING PART Flowers Blue
fishBarrel:register({
	DataType = "BUILDING_PART",
	Id = "BUILDING_PART_FLOWERS_BLUE",
	Name = "CATEGORY_FLOWERS_BLUE_SING",
    Category = "FLOWERS",
    IsMovableWhenBuilt = true,
    ConstructorData = {
		DataType = "BUILDING_CONSTRUCTOR_DEFAULT",
		CoreObjectPrefab =  "PREFAB_FLOWER_BLUE_PART"
	}
    
})

-- OVERRIDE Blue Tent
fishBarrel:register({
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
fishBarrel:override({
    Id = "DEFAULT_BALANCING",
    BuildingCostOverrideList = {
        Action = "APPEND","FISH_BARREL_BUILDING_PART_COST_LIST"
    }
})

-- JOB Fishmonger
fishBarrel:register({
	DataType = "JOB",
	Id = "FISHMONGER",
	JobName = "JOB_FISHMONGER_NAME",
	JobDescription = "JOB_FISHMONGER_DESC",
	IsLockedByDefault = false,
    ProductionDelay = 7,
	AssetJobProgression = "DEFAULT_JOB_PROGRESSION",
	CharacterSetup = {
        DataType = "CHARACTER_SETUP",
        WalkAnimation = "WALKING",
		IdleAnimation = "MARKET_TENDER"
		
	}
})

-- JOB Fishmonger: Allowed for Newcomers
fishBarrel:override({
    Id = "NEWCOMER",
    CompatibleJobList = {
        Action = "APPEND",
        "FISHMONGER"
    }
})

-- JOB Fishmonger: Allowed for Serfs
fishBarrel:override({
    Id = "SERF",
    CompatibleJobList = {
        Action = "APPEND",
        "FISHMONGER"
    }
})


