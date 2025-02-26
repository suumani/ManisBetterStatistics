-- styles.lua
data:extend({
    {
        type = "style",
        name = "line_frame",
        parent = "frame_style",  -- 既存のフレームスタイルを継承
        minimal_height = 2,      -- 罫線の高さ
        maximal_height = 2,      -- 罫線の最大高さも同じにする
        horizontally_stretchable = "on"  -- 横に伸縮可能
    }
})
