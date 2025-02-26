local Common = require("scripts.core.common")

local function initialize_kill_stats()
    if not storage.kill_stats then
        storage.kill_stats = {}
    end

    for mob_type, enemies in pairs(Common.mobs) do
        for _, enemy_name in pairs(enemies) do
            storage.kill_stats[enemy_name] = storage.kill_stats[enemy_name] or {}
            for _, quality in pairs(Common.quality_types) do
                storage.kill_stats[enemy_name][quality] = storage.kill_stats[enemy_name][quality] or 0
            end
        end
    end

    if not storage.kill_stats_total_score then storage.kill_stats_total_score = 0 end
    if not storage.mani_local_achievements then storage.mani_local_achievements = {} end
end

script.on_init(initialize_kill_stats)
script.on_configuration_changed(initialize_kill_stats)