local tint_promethium = {1, 0.75, 0.75, 1}

local promethium_silo = table.deepcopy(data.raw["rocket-silo"]["connavar-space-science-rocket-silo"])
local promethium_rocket = table.deepcopy(data.raw["rocket-silo-rocket"]["connavar-space-science-rocket-silo-rocket"])

data.raw["cargo-pod"]["cargo-pod"].inventory_size = 250

promethium_silo.name = "connavar-promethium-rocket-silo"
promethium_silo.icon = "__base__/graphics/icons/rocket-silo.png"
promethium_silo.minable = {mining_time = 1, result = "connavar-promethium-rocket-silo"}
promethium_silo.fast_replaceable_group = "connavar-promethium-rocket-silo"
promethium_silo.fixed_recipe = "connavar-promethium-rocket-part"
promethium_silo.rocket_entity = "connavar-promethium-rocket-silo-rocket"
promethium_silo.rocket_parts_required = 100


if promethium_silo.shadow_sprite then
  promethium_silo.shadow_sprite.tint = tint_promethium
end
if promethium_silo.hole_sprite then
  promethium_silo.hole_sprite.tint = tint_promethium
end
if promethium_silo.hole_light_sprite then
  promethium_silo.hole_light_sprite.tint = tint_promethium
end
if promethium_silo.rocket_shadow_overlay_sprite then
  promethium_silo.rocket_shadow_overlay_sprite.tint = tint_promethium
end
if promethium_silo.rocket_glow_overlay_sprite then
  promethium_silo.rocket_glow_overlay_sprite.tint = tint_promethium
end
if promethium_silo.door_back_sprite then
  promethium_silo.door_back_sprite.tint = tint_promethium
end
if promethium_silo.door_front_sprite then
  promethium_silo.door_front_sprite.tint = tint_promethium
end
if promethium_silo.base_day_sprite then
  promethium_silo.base_day_sprite.tint = tint_promethium
end
if promethium_silo.base_front_sprite then
  promethium_silo.base_front_sprite.tint = tint_promethium
end

promethium_rocket.name = "connavar-promethium-rocket-silo-rocket"

promethium_silo.rocket_entity = promethium_rocket.name

data:extend({
  promethium_silo,
  promethium_rocket
})
