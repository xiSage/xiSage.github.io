@tool
class_name CustomButton extends BaseButton

@export var content: Control


func _get_minimum_size() -> Vector2:
	if content:
		return content.get_combined_minimum_size()
	return Vector2.ZERO
