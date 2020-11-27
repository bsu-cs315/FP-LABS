extends Node2D


onready var music_player := $IntroPlayer
onready var background := $ParallaxBackground
onready var background_layer := $ParallaxBackground/ParallaxLayer
onready var instructions_popup := $InstructionsPopup
onready var level_select_popup := $LevelSelectPopup


var level1_scene_path := "res://src/Level-1.tscn"
var level2_scene_path := "res://src/Level-2.tscn"
var level3_scene_path := "res://src/Level-3.tscn"
var level4_scene_path := "res://src/Level-4.tscn"
var credits_scene_path := "res://src/CreditsScreen.tscn"


func _ready():
	if get_tree().paused:
		get_tree().paused = false


func _process(_delta):
	background_layer.position += background.scroll_offset
	if background_layer.position <= Vector2(-1026, -600):
		background_layer.position = Vector2.ZERO


func change_to_level(selected_level):
	if selected_level == 1:
		var _ignored = get_tree().change_scene(level1_scene_path)
	elif selected_level == 2:
		var _ignored = get_tree().change_scene(level2_scene_path)
	elif selected_level == 3:
		var _ignored = get_tree().change_scene(level3_scene_path)
	elif selected_level == 4:
		var _ignored = get_tree().change_scene(level4_scene_path)
	else:
		var _ignored = get_tree().reload_current_scene()


func _on_StartButton_pressed():
	var _ignored = get_tree().change_scene(level1_scene_path)


func _on_InstructionsButton_pressed():
	instructions_popup.popup()


func _on_LevelSelectButton_pressed():
	level_select_popup.popup()


func _on_CreditsButton_pressed():
	var _ignored = get_tree().change_scene(credits_scene_path)


func _on_Level1Button_pressed():
	change_to_level(1)


func _on_Level2Button_pressed():
	change_to_level(2)


func _on_Level3Button_pressed():
	change_to_level(3)


func _on_Level4Button_pressed():
	change_to_level(4)
