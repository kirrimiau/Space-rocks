extends ScreenWrapper
class_name Bullet


var speed = 120

func _ready() -> void:
	rotation_degrees = 90

func _process(delta: float) -> void:
	super._process(delta)
	position.y -= speed * delta
	var direction = Vector2(sin(rotation), -cos(rotation))
	position += direction * speed * delta
