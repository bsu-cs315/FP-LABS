extends Node2D


onready var music_player := $IntroPlayer
var credits_labels : Array


func _ready():
	if get_tree().paused:
		get_tree().paused = false
	
	credits_labels = get_tree().get_nodes_in_group("credits")


func _process(_delta):
	for credit in credits_labels:
		credit.rect_position.y -= 0.5
