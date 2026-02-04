# Factorio Mod Development Guide

This is a **Factorio 2.0 mod** for the Space Age expansion. It adds a specialized rocket silo for space science research.

## Project Structure

- **data-updates.lua**: Entry point that requires all prototype definitions
- **prototypes/**: Lua-based prototype definitions (items, recipes, technologies, entities)
- **locale/en/locale.cfg**: Localization strings using Factorio's INI-like format
- **info.json**: Mod metadata (name, version, dependencies)

## Key Architecture Patterns

### Prototype System
All game content is defined via Lua prototypes loaded in [data-updates.lua](../data-updates.lua):
```lua
require("prototypes.item")
require("prototypes.recipe")
require("prototypes.entity.entities")
require("prototypes.technology")
```

### Data Extension Pattern
Use `data:extend({})` to register prototypes. Example from [prototypes/item.lua](../prototypes/item.lua):
```lua
data:extend({
  {
    type = "item",
    name = "connavar-space-science-rocket-silo",
    icon = "__base__/graphics/icons/rocket-silo.png",
    -- ... properties
  }
})
```

### Post-Load Modifications
Modify existing game data using `data.raw["type"]["name"]` syntax. See [prototypes/technology.lua](../prototypes/technology.lua):
```lua
data.raw["technology"]["space-science-pack"].prerequisites = {"connavar-space-science-rocket-silo"}
```

## Naming Convention

All custom entities use the `connavar-` prefix:
- `connavar-space-science-rocket-silo`
- `connavar-space-science-rocket-part`
- `connavar-space-science-satellite`

## Asset References

Graphics/sounds use Factorio's path format: `__base__/graphics/...` or `__mod-name__/...`

## Key Game Mechanics

## Development Notes

- Recipe categories must match entity `crafting_categories` (e.g., `"rocket-building"`)
- Items that go into rockets need `send_to_orbit_mode = "automated"`
- Rocket parts should have `hidden = true` and `auto_recycle = false`
- Use `util.sprite_load()` and `util.by_pixel()` helpers from base mod for sprite definitions
