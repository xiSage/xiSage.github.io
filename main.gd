extends TextureRect

@export var background_material: ShaderMaterial

var _changing_background: bool = false


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		change_background()
	


func change_background() -> void:
	if _changing_background:
		return
	
	_changing_background = true
	var current_color: Color = background_material.get_shader_parameter("current_color")
	var target_color := current_color
	while absf(current_color.ok_hsl_h - target_color.ok_hsl_h) < 0.2:
		target_color = Color.from_ok_hsl(randf_range(0.0, 1.0), 1.0, 0.75)
	background_material.set_shader_parameter("target_color", target_color)
	create_tween().tween_method(
		func(progress: float):
			background_material.set_shader_parameter("animation_progress", progress),
		0.0,
		1.0,
		1.0
	).finished.connect(func():
		background_material.set_shader_parameter("current_color", target_color)
		_changing_background = false
	)
