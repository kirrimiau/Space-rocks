extends Area2D
class_name ScreenWrapper

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if position.x > get_viewport().size.x:
		position.x = 0
	elif position.x < 0:
		position.x = get_viewport().size.x
		
	if position.y > get_viewport().size.y:
		position.y = 0
	elif position.y < 0:
		position.y = get_viewport().size.x
