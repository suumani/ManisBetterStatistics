local Common = require("scripts.core.common")

local function split(str, ts)
    if ts == nil then return {} end
  
    local t = {} ; 
    i=1
    for s in string.gmatch(str, "([^"..ts.."]+)") do
      t[i] = s
      i = i + 1
    end
    return t
end

-- GUIの更新
local function update_kill_stats_gui(player)
    -- ui無し
    if not player.gui.screen.kill_stats_window then return end
    
    -- main table取得
    local main_window = player.gui.screen.kill_stats_window
    local score_value = main_window.score_table.score_table_right.score_table_right_flow.score_value
    score_value.caption = "Score: " .. math.floor(storage.kill_stats_total_score)

    for _, main_table in pairs(main_window.kill_stats_scroll.children) do
        for _, enemy_table in pairs(main_table.children) do
            for _, elem in pairs(enemy_table.children) do
                if elem.name and elem.name:find("_kills") then
                    local parts = split(elem.name, "_")
                    local entity_name = parts[1]
                    local quality_type = parts[2]
                    local kill_count = storage.kill_stats[entity_name] and storage.kill_stats[entity_name][quality_type] or 0
                    elem.caption = tostring(kill_count)
                end
            end
        end
    end
end

-- GUIの作成
local function create_kill_stats_gui(player)
    if player.gui.screen.kill_stats_window then
        player.gui.screen.kill_stats_window.destroy()
    end

    local frame = player.gui.screen.add {
        type = "frame",
        name = "kill_stats_window",
        caption = "Kill Statistics",  -- タイトルバーにテキストを追加
        direction = "vertical"
    }
    frame.style.width = 800
    frame.auto_center = true

    -- スコア表示用のtableを追加
    local score_table = frame.add {
        type = "table",
        name = "score_table",
        column_count = 2,
        style = "bordered_table"  -- カスタムスタイルかデフォルトスタイルを適用
    }
    score_table.draw_horizontal_lines = true
    score_table.draw_vertical_lines = false

    -- 左寄せのテキスト
    score_table.add {
        type = "label",
        name = "score_label_left",
        caption = "Achievements: "
    }

    -- 右寄せのテキスト
    local score_table_right = score_table.add {
        type = "label",
        name = "score_table_right",
    }
    score_table_right.style.horizontal_align = "right"  -- テキストを右寄せにするスタイルを適用
    score_table_right.style.width = 600
    score_table_right.style.height = 40

    local score_table_right_flow = score_table_right.add{
        type ="flow",
        name = "score_table_right_flow"
    }
    score_table_right_flow.style.horizontal_align = "right"  -- テキストを右寄せにするスタイルを適用
    score_table_right_flow.style.width = 580
    score_table_right_flow.style.height = 40

    -- 画像の追加
    if storage.kill_stats_total_score > Common.achievements[9].score then
        score_table_right_flow.add {
            type = "sprite",
            sprite = "tech02_icon",
            style = "custom_sprite_style",
            tooltip = "Crown Icon"
        }
    elseif storage.kill_stats_total_score > Common.achievements[7].score then
        score_table_right_flow.add {
            type = "sprite",
            sprite = "tech02_blank_icon",
            style = "custom_sprite_style",
            tooltip = "Crown Icon"
        }
    end
    if storage.kill_stats_total_score > Common.achievements[5].score then
        score_table_right_flow.add {
            type = "sprite",
            sprite = "tech02_icon",
            style = "custom_sprite_style",
            tooltip = "Crown Icon"
        }
    elseif storage.kill_stats_total_score > Common.achievements[3].score then
        score_table_right_flow.add {
            type = "sprite",
            sprite = "tech02_blank_icon",
            style = "custom_sprite_style",
            tooltip = "Crown Icon"
        }
    end

    for i = 1, 10, 1 do
        if storage.kill_stats_total_score < Common.achievements[i].score then
            score_table_right_flow.add {
                type = "label",
                caption = {'text-label.' .. Common.achievements[i].id},
                style = "custom_label_style"
            }
            break
        end
    end

    score_table_right_flow.add {
        type = "label",
        caption = "Score: " .. math.floor(storage.kill_stats_total_score),
        name = "score_value",
        style = "custom_label_style"
    }

    local scroll = frame.add { type = "scroll-pane", name = "kill_stats_scroll" }
    scroll.style.maximal_height = 600

    for mob_type, enemies in pairs(Common.mobs) do
        local line = scroll.add { type = "frame", style = "line_frame"}
        line.style.height = 2
        line.style.horizontally_stretchable = true
        
        local main_table = scroll.add {
            type = "table",
            name = "kill_stats_main_table_" .. mob_type,
            column_count = 9,
            draw_horizontal_lines = true
        }
        main_table.style.column_alignments[1] = "center"

        local title_label = main_table.add {
            type = "label", caption = {'entity-name.' .. mob_type}
        }
        title_label.style.font = "default-bold"
        title_label.style.width = 100

        for _, enemy in pairs(enemies) do
            local enemy_sprite = main_table.add { type = "sprite", sprite = "entity/" .. enemy }
            enemy_sprite.style.width = 64
            enemy_sprite.style.height = 64

            local sub_table = main_table.add { type = "table", name = enemy, column_count = 2, draw_horizontal_lines = true }

            for _, quality in pairs(Common.quality_types) do
                sub_table.add { type = "label", caption = {'rarity-name.'..quality} }
                local kill_count = storage.kill_stats[enemy] and storage.kill_stats[enemy][quality] or 0
                local kill_label = sub_table.add { type = "label", caption = tostring(kill_count), name = enemy .. "_" .. quality .. "_kills" }
            end
        end
    end

    frame.add { type = "button", name = "kill_stats_close", caption = "Close" }
end

script.on_event("toggle_kill_stats", function(event)
    local player = game.get_player(event.player_index)
    if player.gui.screen.kill_stats_window then
        player.gui.screen.kill_stats_window.destroy()
    else
        create_kill_stats_gui(player)
    end
end)

-- 1秒ごとにUIを更新
script.on_nth_tick(60, function()
    for _, player in pairs(game.players) do
        update_kill_stats_gui(player)
    end
end)

script.on_event(defines.events.on_gui_click, function(event)
    if event.element.name == "kill_stats_close" then
        local player = game.get_player(event.player_index)
        if player.gui.screen.kill_stats_window then
            player.gui.screen.kill_stats_window.destroy()
        end
    end
end)
