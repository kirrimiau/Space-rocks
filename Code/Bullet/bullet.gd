extends ScreenWrapper
class_name Bullet

@onready var timer: Timer = $Timer

var ship: Ship
var speed = 320


func _ready() -> void:
	rotation_degrees = 90
	timer.timeout.connect(on_timed_out)

func _process(delta: float) -> void:
	super._process(delta)
	position.y -= speed * delta
	var direction = Vector2(sin(rotation), cos(rotation))
	position += direction * speed * delta
	
func destroy():
	queue_free()
	
func on_timed_out():
	queue_free() #despawn basically.
