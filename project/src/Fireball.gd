extends KinematicBody2D


signal fireball_hit(body)

const FLY_SPEED := 200
var _velocity := Vector2()
var direction := 1

onready var fireball_sprite = $AnimatedSprite


func _ready():
	pass


func _physics_process(delta):
	_velocity.x = FLY_SPEED * direction * delta
	
	translate(_velocity)


func set_fireball_direction(pass_dir):
	direction = pass_dir
	if pass_dir == -1:
		fireball_sprite.flip_h = true


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Fireball_body_entered(body):
	 emit_signal("fireball_hit", body)
