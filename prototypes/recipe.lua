-- function create_recipe_parameter(number)
--   data:extend(
--   {
--     {
--       type = "recipe",
--       name = "parameter-" .. number,
--       icon = "__base__/graphics/icons/parameter/parameter-" .. number .. ".png",
--       localised_name = {"parameter-x", tostring(number)},
--       subgroup = "parameters",
--       category = "parameters",
--       order = "a",
--       parameter = true,
--       allow_productivity = true
--     },
--   })
-- end

-- for n = 0, 9 do
--   create_recipe_parameter(n)
-- end

data:extend
({
  {
    type = "recipe",
    name = "connavar-space-science-rocket-silo",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 1000},
      {type = "item", name = "concrete", amount = 1000},
      {type = "item", name = "pipe", amount = 100},
      {type = "item", name = "processing-unit", amount = 200},
      {type = "item", name = "electric-engine-unit", amount = 200}
    },
    energy_required = 30,
    results = {{type="item", name="connavar-space-science-rocket-silo", amount=1}},
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "connavar-space-science-rocket-part",
    energy_required = 3,
    enabled = false,
    hide_from_player_crafting = true,
    auto_recycle = false,
    category = "rocket-building",
    ingredients =
    {
      {type = "item", name = "processing-unit", amount = 10},
      {type = "item", name = "low-density-structure", amount = 10},
      {type = "item", name = "rocket-fuel", amount = 10}
    },
    results = {{type="item", name="rocket-part", amount=1}},
    allow_productivity = true
  },  
  {
    type = "recipe",
    name = "connavar-space-science-satellite",
    energy_required = 5,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {type = "item", name = "low-density-structure", amount = 100},
      {type = "item", name = "solar-panel", amount = 100},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "radar", amount = 5},
      {type = "item", name = "processing-unit", amount = 100},
      {type = "item", name = "rocket-fuel", amount = 50}
    },
    results = {{type="item", name="connavar-space-science-satellite", amount=1}},
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "connavar-promethium-rocket-silo",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 1200},
      {type = "item", name = "concrete", amount = 1200},
      {type = "item", name = "pipe", amount = 200},
      {type = "item", name = "processing-unit", amount = 250},
      {type = "item", name = "electric-engine-unit", amount = 250}
    },
    energy_required = 40,
    results = {{type="item", name="connavar-promethium-rocket-silo", amount=1}},
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "connavar-promethium-catcher",
    energy_required = 5,
    enabled = false,
    icon = "__connavar-space-and-promethium-science__/assets/images/promethium-catcher.png",
    category = "crafting-with-fluid",
    ingredients =
    {
      {type = "item", name = "quantum-processor", amount = 100},
      {type = "item", name = "tungsten-plate", amount = 100},
      {type = "item", name = "superconductor", amount = 100},
      {type = "item", name = "rocket-fuel", amount = 50},
      {type = "item", name = "electric-engine-unit", amount = 50},      
      {type = "item", name = "carbon-fiber", amount = 50},
      {type = "item", name = "lithium-plate", amount = 50},      
      {type = "item", name = "fusion-power-cell", amount = 50},
      {type = "fluid", name = "fluoroketone-cold", amount = 500}
    },
    results = {{type="item", name="connavar-promethium-catcher", amount=1}},
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "connavar-promethium-rocket-part",
    energy_required = 3,
    enabled = false,
    hide_from_player_crafting = true,
    auto_recycle = false,
    category = "rocket-building",
    ingredients =
    {
      {type = "item", name = "processing-unit", amount = 50},
      {type = "item", name = "low-density-structure", amount = 50},
      {type = "item", name = "rocket-fuel", amount = 50}
    },
    results = {{type="item", name="rocket-part", amount=1}},
    allow_productivity = true
  }
})