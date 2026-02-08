local item_sounds = require("__base__.prototypes.item_sounds")

data.raw["item"]["promethium-asteroid-chunk"].stack_size = 100

data:extend(
{
  {
    type = "item",
    name = "connavar-space-science-rocket-silo",
    icon = "__base__/graphics/icons/rocket-silo.png",
    subgroup = "space-related",
    order = "a[connavar-space-science-rocket-silo]",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "connavar-space-science-rocket-silo",
    weight = 10 * tons,
    stack_size = 1
  },
  {
    type = "item",
    name = "connavar-promethium-rocket-silo",
    icon = "__base__/graphics/icons/rocket-silo.png",
    subgroup = "space-related",
    order = "a[connavar-promethium-rocket-silo]",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "connavar-promethium-rocket-silo",
    weight = 10 * tons,
    stack_size = 1
  },
  {
    type = "item",
    name = "connavar-space-science-rocket-part",
    icon = "__base__/graphics/icons/rocket-part.png",
    hidden = true,
    auto_recycle = false,
    subgroup = "intermediate-product",
    order = "d[rocket-parts]-d[rocket-part]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 5,
    weight = (1000/50)*kg
  },
  {
    type = "item",
    name = "connavar-space-science-satellite",
    icon = "__base__/graphics/icons/satellite.png",
    subgroup = "intermediate-product",
    order = "d[rocket-parts]-e[connavar-space-science-satellite]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 1,
    weight = 1 * tons,
    rocket_launch_products = {{type = "item", name = "space-science-pack", amount = 1000}},
    send_to_orbit_mode = "automated"
  },
  {
    type = "item",
    name = "connavar-promethium-catcher",
    icon = "__connavar-space-and-promethium-science__/assets/images/promethium-catcher.png",
    subgroup = "intermediate-product",
    order = "d[rocket-parts]-f[connavar-promethium-catcher]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 1,
    weight = 1 * tons,
    rocket_launch_products = {{type = "item", name = "promethium-asteroid-chunk", amount = 25000}},
    send_to_orbit_mode = "automated"
  },
  {
    type = "item",
    name = "connavar-promethium-rocket-part",
    icon = "__base__/graphics/icons/rocket-part.png",
    hidden = true,
    auto_recycle = false,
    subgroup = "intermediate-product",
    order = "d[rocket-parts]-d[rocket-part]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 5,
    weight = (1000/50)*kg
  }
}
)