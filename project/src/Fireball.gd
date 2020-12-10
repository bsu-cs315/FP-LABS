extends KinematicBody2D


const FLY_SPEED := 200
var _velocity := Vector2()

onready var fireball_sprite := $AnimatedSprite


func _ready():
	pass


func _physics_process(delta):
	_velocity.x = FLY_SPEED	* delta
	
	translate(_velocity)
	fireball_sprite.play("fireball")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
