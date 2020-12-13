extends Node2D


var main_scene_path = "res://src/TitleScreen.tscn"

func _process(delta):
	if Input.is_action_just_pressed("congrats_continue"):
		var _ignored = get_tree().change_scene(main_scene_path)
