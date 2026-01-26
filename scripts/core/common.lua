-- __ManisBetterStatistics__/scripts/core/common.lua
local Common = {}

local Boss = require("__Manis_definitions__/shared/demolisher_names.lua")

Common.mobs = {
    biter = {"small-biter", "medium-biter", "big-biter", "behemoth-biter"},
    spitter = {"small-spitter", "medium-spitter", "big-spitter", "behemoth-spitter"},
    worm = {"small-worm-turret", "medium-worm-turret", "big-worm-turret", "behemoth-worm-turret"},
    spawner = {"biter-spawner", "spitter-spawner"}
}

if script.active_mods["space-age"] then
    Common.mobs.demolisher = {"small-demolisher", "medium-demolisher", "big-demolisher"}
    Common.mobs.wriggler = {"small-wriggler-pentapod","medium-wriggler-pentapod","big-wriggler-pentapod"}
    Common.mobs.strafer = {"small-strafer-pentapod","medium-strafer-pentapod","big-strafer-pentapod"}
    Common.mobs.stomper = {"small-stomper-pentapod","medium-stomper-pentapod","big-stomper-pentapod"}
    Common.mobs.spawner = {"biter-spawner", "spitter-spawner","gleba-spawner","gleba-spawner-corpse"}
end

if script.active_mods["ManisBossDemolisher"] then
    Common.mobs.manis_boss_demolisher_behemoth = {Boss.MANIS_BEHEMOTH, Boss.MANIS_BEHEMOTH_ALT}
    Common.mobs.manis_boss_demolisher_speedstar = {Boss.MANIS_SPEEDSTAR_SMALL, Boss.MANIS_SPEEDSTAR_MEDIUM, Boss.MANIS_SPEEDSTAR_BIG, Boss.MANIS_SPEEDSTAR_BEHEMOTH }
    Common.mobs.manis_boss_demolisher_speedstar_alt = {Boss.MANIS_SPEEDSTAR_SMALL_ALT, Boss.MANIS_SPEEDSTAR_MEDIUM_ALT, Boss.MANIS_SPEEDSTAR_BIG_ALT, Boss.MANIS_SPEEDSTAR_BEHEMOTH_ALT }
    Common.mobs.manis_boss_demolisher_gigantic = {Boss.MANIS_GIGANTIC_SMALL, Boss.MANIS_GIGANTIC_MEDIUM, Boss.MANIS_GIGANTIC_BIG, Boss.MANIS_GIGANTIC_BEHEMOTH }
    Common.mobs.manis_boss_demolisher_gigantic_alt = {Boss.MANIS_GIGANTIC_SMALL_ALT, Boss.MANIS_GIGANTIC_MEDIUM_ALT, Boss.MANIS_GIGANTIC_BIG_ALT, Boss.MANIS_GIGANTIC_BEHEMOTH_ALT }
    Common.mobs.manis_boss_demolisher_crazy_king = {Boss.MANIS_CRAZY_KING, Boss.MANIS_CRAZY_KING_ALT}
end

if script.active_mods["ArmouredBiters"] then
    Common.mobs.armoured_biter = {"small-armoured-biter", "medium-armoured-biter", "big-armoured-biter", "behemoth-armoured-biter"}
end

-- laviathan は有効化されていないっぽい？Bossは単体では機能しないっぽい。多分。
if script.active_mods["Cold_biters"] then
    Common.mobs.cold_biter = {"small-cold-biter", "medium-cold-biter", "big-cold-biter", "behemoth-cold-biter"}
    Common.mobs.cold_spitter = {"small-cold-spitter", "medium-cold-spitter", "big-cold-spitter", "behemoth-cold-spitter"}
    Common.mobs.cold_worm = {"small-cold-worm-turret", "medium-cold-worm-turret", "big-cold-worm-turret", "behemoth-cold-worm-turret"}
end

-- laviathan は有効化されていないっぽい？Bossは単体では機能しないっぽい。多分。
if script.active_mods["Explosive_biters"] then
    Common.mobs.explosive_biter = {"small-explosive-biter", "medium-explosive-biter", "big-explosive-biter", "behemoth-explosive-biter"}
    Common.mobs.explosive_spitter = {"small-explosive-spitter", "medium-explosive-spitter", "big-explosive-spitter", "behemoth-explosive-spitter"}
    Common.mobs.explosive_worm = {"small-explosive-worm-turret", "medium-explosive-worm-turret", "big-explosive-worm-turret", "behemoth-explosive-worm-turret"}
end

-- laviathan は有効化されていないっぽい？Bossは単体では機能しないっぽい。多分。
if script.active_mods["Toxic_biters"] then
    Common.mobs.toxic_biter = {"small-toxic-biter", "medium-toxic-biter", "big-toxic-biter", "behemoth-toxic-biter"}
    Common.mobs.toxic_spitter = {"small-toxic-spitter", "medium-toxic-spitter", "big-toxic-spitter", "behemoth-toxic-spitter"}
    Common.mobs.toxic_worm = {"small-toxic-worm-turret", "medium-toxic-worm-turret", "big-toxic-worm-turret", "behemoth-toxic-worm-turret"}
end

Common.quality_types = {"normal", "uncommon", "rare", "epic", "legendary"}

Common.achievements = {
    {score = 100, id = "novice_factory_manager"},
    {score = 500, id = "beginner_factory_manager"},
    {score = 1000, id = "novice_combat_factory_manager"}, -- icon
    {score = 5000, id = "beginner_combat_factory_manager"},
    {score = 10000, id = "rookie_combat_factory_manager"},-- icon
    {score = 50000, id = "nauvis_invader"}, 
    {score = 100000, id = "intermediate_combat_factory_manager"}, -- icon
    {score = 500000, id = "advanced_combat_factory_manager"},
    {score = 1000000, id = "combat_automation_demon"}, -- icon
    {score = 5000000, id = "true_nauvis_invader"}
}

return Common
