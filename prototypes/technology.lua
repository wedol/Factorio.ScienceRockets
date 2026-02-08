data:extend(
{
  {
    type = "technology",
    name = "connavar-space-science-rocket-silo",
    icon = "__base__/graphics/technology/rocket-silo.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "connavar-space-science-rocket-silo"
      },
      {
        type = "unlock-recipe",
        recipe = "connavar-space-science-rocket-part"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-landing-pad"
      },
      {
        type = "unlock-recipe",
        recipe = "connavar-space-science-satellite"
      }
    },
    prerequisites =
    {
      "rocket-silo",
    },
    unit =
    {
      count = 100,

      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "connavar-promethium-rocket-silo",
    icon = "__base__/graphics/technology/rocket-silo.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "connavar-promethium-rocket-silo"
      },
      {
        type = "unlock-recipe",
        recipe = "connavar-promethium-catcher"
      }
    },
    prerequisites =
    {
      "promethium-science-pack"
    },
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"cryogenic-science-pack", 1}
      },
      time = 60
    }
  },
  --{
    --type = "technology",
   -- name = "space-science-pack",
    --icon = "__base__/graphics/technology/space-science-pack.png",
    --icon_size = 256,
    --essential = true,
    --effects = {},
    --research_trigger =
    --{
      --type = "send-item-to-orbit",
      --item = "vanilla-satellite"
    --},
    --prerequisites = {"rocket-silo"}
  --},
}
)

data.raw["technology"]["space-science-pack"].prerequisites = 
{ 
  "connavar-space-science-rocket-silo" 
}
data.raw["technology"]["space-science-pack"].research_trigger =
{
  type = "send-item-to-orbit",
  item = "connavar-space-science-satellite"
}
