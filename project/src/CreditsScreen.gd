extends Node2D


onready var music_player := $IntroPlayer
var credits_labels : Array

var main_scene_path = "res://src/TitleScreen.tscn"


func _ready():
	if get_tree().paused:
		get_tree().paused = false
	
	credits_labels = get_tree().get_nodes_in_group("credits")


func _process(_delta):
	for credit in credits_labels:
		credit.rect_position.y -= 0.5
	
	


func _on_RawpixelLink_pressed():
	var _ignored = OS.shell_open("www.freepik.com/vectors/business")


func _on_ChiptuneName_pressed():
	var _ignored = OS.shell_open("https://freesound.org/people/zagi2/sounds/184413/")


func _on_Zagi2Link_pressed():
	var _ignored = OS.shell_open("https://freesound.org/people/zagi2/")


func _on_CCBYNCLink_pressed():
	var _ignored = OS.shell_open("https://creativecommons.org/licenses/by-nc/3.0/")


func _on_CreditsVisibility_screen_exited():
	var _ignored = get_tree().change_scene(main_scene_path)
