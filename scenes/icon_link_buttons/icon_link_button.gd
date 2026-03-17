@tool
class_name CustomButton extends BaseButton

@export var content: Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _get_minimum_size() -> Vector2:
	if content:
		return content.get_combined_minimum_size()
	return Vector2.ZERO


func _focus() -> void:
	animation_player.play("hover")


func _unfocus() -> void:
	animation_player.play_backwards("hover")
	

