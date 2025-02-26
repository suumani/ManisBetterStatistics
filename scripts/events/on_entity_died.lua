local function on_entity_died(event)
    local entity = event.entity
    if not entity or not entity.valid or entity.force.name == "player" then return end

    local quality = entity.quality.name or "normal"

    if storage.kill_stats[entity.name] and storage.kill_stats[entity.name][quality] then
        storage.kill_stats[entity.name][quality] = storage.kill_stats[entity.name][quality] + 1
        storage.kill_stats_total_score = storage.kill_stats_total_score + entity.max_health
    end
end

script.on_event(defines.events.on_entity_died, on_entity_died)