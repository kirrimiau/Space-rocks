
extends Area2D
class_name Rock

#var main: Main
var velocity: Vector2 = Vector2.ZERO  # px / sec.
@export var speed: float = 150

func _ready() -> void:
	
	area_entered.connect(on_area_entered)
	
	velocity = Vector2(randf_range(-speed, speed), randf_range(-speed, speed))

	# TEST: just testing
	#velocity = Vector2(-100, 0)
#func _process(delta: float) -> void:
	#position += velocity * delta
	
func _process(delta: float) -> void:
	#super.process(delta)
	position += velocity * delta
	
	
	if position.x > get_viewport().size.x:
		position.x = 0
	elif position.x < 0:
		position.x = get_viewport().size.x
		
	if position.y > get_viewport().size.y:
		position.y = 0
	elif position.y < 0:
		position.y = get_viewport().size.x
		
func split():
	# TODO: split rocks into 2 smaller rocks
	pass

# TODO: untested
func destroy():
	queue_free()
	
func on_area_entered(other_area: Area2D): 
	print(other_area)
	if other_area is Bullet:
		other_area.destroy()
		destroy()
		
	if other_area is Ship:
		other_area.destroy()
		destroy()
