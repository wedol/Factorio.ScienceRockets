local allowed_cargo_by_silo =
{
	["connavar-space-science-rocket-silo"] = "connavar-space-science-satellite",
	["connavar-promethium-rocket-silo"] = "connavar-promethium-catcher"
}

local tracked_silo_names =
{
	["connavar-space-science-rocket-silo"] = true,
	["connavar-promethium-rocket-silo"] = true
}

local function ensure_global_silos()
	if not global then
		global = {}
	end

	global.connavar_silos = global.connavar_silos or {}
end

local inventory_names =
{
	"rocket_silo_cargo",
	"rocket_silo_rocket",
	"rocket_silo",
	"rocket",
	"cargo_unit"
}

local function find_cargo_stack(entity)
	if not (entity and entity.valid) then
		return nil
	end

	for _, inventory_name in ipairs(inventory_names) do
		local inventory_id = defines.inventory[inventory_name]
		if inventory_id then
			local inv = entity.get_inventory(inventory_id)
			if inv and inv.valid and not inv.is_empty() then
				for i = 1, #inv do
					local stack = inv[i]
					if stack.valid_for_read then
						return stack
					end
				end
			end
		end
	end

	return nil
end

local function get_cargo_entities(silo, rocket)
	local entities = {}

	if silo and silo.valid then
		table.insert(entities, silo)
		if silo.rocket and silo.rocket.valid then
			table.insert(entities, silo.rocket)
			if silo.rocket.attached_cargo_pod and silo.rocket.attached_cargo_pod.valid then
				table.insert(entities, silo.rocket.attached_cargo_pod)
			end
		end
	end

	if rocket and rocket.valid then
		table.insert(entities, rocket)
		if rocket.attached_cargo_pod and rocket.attached_cargo_pod.valid then
			table.insert(entities, rocket.attached_cargo_pod)
		end
	end

	return entities
end

local function spill_stack(surface, position, stack, force)
	local spill = {name = stack.name, count = stack.count}
	if stack.quality then
		spill.quality = stack.quality
	end

	surface.spill_item_stack
	{
		position = position,
		stack = spill,
		enable_looted = true,
		force = force,
		allow_belts = false
	}
end

local function remove_wrong_cargo(entities, required_cargo, surface, position, force)
	local removed = false

	for _, entity in ipairs(entities) do
		if entity and entity.valid then
			for _, inventory_name in ipairs(inventory_names) do
				local inventory_id = defines.inventory[inventory_name]
				if inventory_id then
					local inv = entity.get_inventory(inventory_id)
					if inv and inv.valid and not inv.is_empty() then
						for i = 1, #inv do
							local stack = inv[i]
							if stack.valid_for_read and stack.name ~= required_cargo then
								spill_stack(surface, position, stack, force)
								stack.clear()
								removed = true
							end
						end
					end
				end
			end
		end
	end

	return removed
end

local function register_silo(entity)
	if not (entity and entity.valid) then
		return
	end
	if not tracked_silo_names[entity.name] then
		return
	end
	if not entity.unit_number then
		return
	end

	ensure_global_silos()
	global.connavar_silos[entity.unit_number] = entity
end

local function unregister_silo(entity)
	if not (entity and entity.valid and entity.unit_number) then
		return
	end

	if not (global and global.connavar_silos) then
		return
	end

	global.connavar_silos[entity.unit_number] = nil
end

local function refresh_silo_registry()
	ensure_global_silos()
	global.connavar_silos = {}

	for _, surface in pairs(game.surfaces) do
		for name in pairs(tracked_silo_names) do
			local silos = surface.find_entities_filtered({name = name})
			for _, silo in ipairs(silos) do
				register_silo(silo)
			end
		end
	end
end

local function validate_silo_cargo(silo, rocket)
	local required_cargo = allowed_cargo_by_silo[silo.name]
	if not required_cargo then
		return
	end

	local entities = get_cargo_entities(silo, rocket)
	local stack = nil

	for _, entity in ipairs(entities) do
		stack = find_cargo_stack(entity)
		if stack and stack.valid_for_read then
			break
		end
	end

	if not (stack and stack.valid_for_read) then
		return
	end

	if stack.name ~= required_cargo then
		if remove_wrong_cargo(entities, required_cargo, silo.surface, silo.position, silo.force) then
			local message = "Wrong cargo for this rocket silo at " .. silo.gps_tag .. "."
			if silo.force and silo.force.valid then
				silo.force.print(message)
			else
				game.print(message)
			end
		end
	end
end

script.on_init(function()
	ensure_global_silos()
	refresh_silo_registry()
end)

script.on_configuration_changed(function()
	ensure_global_silos()
	refresh_silo_registry()
end)

script.on_event(defines.events.on_built_entity, function(event)
	register_silo(event.entity)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	register_silo(event.entity)
end)

script.on_event(defines.events.script_raised_built, function(event)
	register_silo(event.entity)
end)

script.on_event(defines.events.on_entity_cloned, function(event)
	register_silo(event.destination)
end)

script.on_event(defines.events.on_pre_player_mined_item, function(event)
	unregister_silo(event.entity)
end)

script.on_event(defines.events.on_robot_pre_mined, function(event)
	unregister_silo(event.entity)
end)

script.on_event(defines.events.on_entity_died, function(event)
	unregister_silo(event.entity)
end)

script.on_event(defines.events.script_raised_destroy, function(event)
	unregister_silo(event.entity)
end)

script.on_event(defines.events.on_rocket_launch_ordered, function(event)
	local silo = event.rocket_silo
	if not (silo and silo.valid) then
		return
	end

	validate_silo_cargo(silo, event.rocket)
end)

script.on_event(defines.events.on_tick, function(event)
	if (event.tick % 30) ~= 0 then
		return
	end

	if not (global and global.connavar_silos) then
		return
	end

	for unit_number, silo in pairs(global.connavar_silos) do
		if not (silo and silo.valid) then
			global.connavar_silos[unit_number] = nil
		else
			validate_silo_cargo(silo, nil)
		end
	end
end)
