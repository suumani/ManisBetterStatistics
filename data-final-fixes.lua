data.raw["gui-style"].default["line_frame"] = {
    type = "frame_style",
    parent = "frame",  -- 既存のフレームスタイルを継承
    minimal_height = 2,  -- 罫線の高さ
    maximal_height = 2,  -- 罫線の最大高さも同じにする
    horizontally_stretchable = "on"  -- 横に伸縮可能
}

data.raw["gui-style"].default["custom_label_style"] = {
    type = "label_style",
    parent = "label",  -- 既存のラベルスタイルを継承
    font = "default-large-bold",  -- 大きなフォントを使用
    font_color = {r = 1, g = 1, b = 1},
    top_padding = 0,
    bottom_padding = 0,
    left_padding = 0,
    right_padding = 0
}

data.raw["gui-style"].default["custom_sprite_style"] = {
    type = "image_style",
    parent = "image",  -- 既存のイメージスタイルを継承
    width = 32,  -- スプライトの幅をピクセル単位で設定
    height = 32,  -- スプライトの高さをピクセル単位で設定
    stretch_image_to_widget_size = true  -- スプライトの画像がウィジェットのサイズに合わせて伸縮されるかどうか
}
