extends KinematicBody2D


const GRAVITY = 900.0
const RUN_SPEED = 100

var _e_velocity := Vector2()
var _direction := 1

onready var enemy_sprite = $AnimatedSprite
onready var enemy_raycast = $RayCast2D


func _physics_process(delta):
	if get_node(".").name == "MovingEnemy":
		if _direction == 1:
			enemy_sprite.flip_h = false
		else:
			enemy_sprite.flip_h = true
		enemy_sprite.play("run")
		
		_e_velocity.y += GRAVITY * delta
		_e_velocity.x = RUN_SPEED * _direction
		_e_velocity = move_and_slide(_e_velocity, Vector2.UP)
		
		if is_on_wall():
			_direction *= -1
			enemy_raycast.position.x *= -1
		if not enemy_raycast.is_colliding():
			_direction *= -1
			enemy_raycast.position.x *= -1
