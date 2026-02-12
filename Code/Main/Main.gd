extends ScreenWrapper
class_name Main

@onready var ship: Ship = $Ship

func _process(_delta: float) -> void:
	# wrap
	if position.x > get_viewport().size.x:
		position.x = 0
	elif position.x < 0:
		position.x = get_viewport().size.x
		
	elif position.y > get_viewport().size.y:
		position.y = 0
	elif position.y < 0:
		position.y = get_viewport().size.y
