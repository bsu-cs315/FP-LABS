extends Node2D


var credits_scene_path := "res://src/CreditsScreen.tscn"

func _process(_delta):
	if Input.is_action_just_pressed("congrats_continue"):
		var _ignored = get_tree().change_scene(credits_scene_path)
