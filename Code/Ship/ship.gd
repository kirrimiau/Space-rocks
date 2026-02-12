extends ScreenWrapper
class_name Ship

@onready var flame: Polygon2D = $flame

const BULLET = preload("res://Bullet/Bullet.tscn")

var turn_speed: float = 180.0 # degrees / sec.
var speed: float = 300.0
var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	flame.hide()

func _process(delta: float) -> void:
	super._process(delta)
	
	if Input.is_action_pressed("turn_ccw"):
		rotation_degrees -= turn_speed * delta
	if Input.is_action_pressed("turn_cw"):
		rotation_degrees += turn_speed * delta

	if Input.is_action_pressed("thrust"):
		var direction = Vector2(sin(rotation), -cos(rotation))
		velocity += direction * speed * delta
		flame.show()
		print("thrust")
		
	if Input.is_action_just_released("thrust"):
			flame.hide()


# spawn bullet, pos, reparent
	if Input.is_action_just_pressed("fire"):
		var bullet: Bullet = BULLET.instantiate()
		bullet.position = self.position #self refers to the class ship
		bullet.rotation = self.rotation
		self.get_parent().add_child(bullet)
		print("bullet fired")

	position += velocity * delta

func destroy():
	queue_free()
