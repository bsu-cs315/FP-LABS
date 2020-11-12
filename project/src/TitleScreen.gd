extends Node2D


onready var music_player := $IntroPlayer
onready var background := $ParallaxBackground
onready var background_layer := $ParallaxBackground/ParallaxLayer
onready var instructions_popup := $InstructionsPopup

var level_scene_path := "res://src/Level-1.tscn"
var credits_scene_path := "res://src/CreditsScreen.tscn"


func _ready():
	if get_tree().paused:
		get_tree().paused = false


func _process(_delta):
	background_layer.position += background.scroll_offset
	if background_layer.position <= Vector2(-1026, -600):
		background_layer.position = Vector2.ZERO


func _on_StartButton_pressed():
	var _ignored = get_tree().change_scene(level_scene_path)


func _on_InstructionsButton_pressed():
	instructions_popup.popup()


func _on_CreditsButton_pressed():
	var _ignored = get_tree().change_scene(credits_scene_path)
