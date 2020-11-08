extends Popup


onready var pause_popup = $"."

func _process(_delta):
	if Input.is_action_just_pressed("unpause_game"):
		pause_popup.hide()
		get_tree().paused = false
