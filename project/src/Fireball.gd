extends KinematicBody2D


const FLY_SPEED := 150
var _velocity := Vector2()


func _ready():
	pass


func _physics_process(delta):
	_velocity.x = FLY_SPEED	* delta
	translate(_velocity)
