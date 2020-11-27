extends Node2D


onready var instructions_popup := $InstructionsPopup
onready var pause_popup := $PausePopup

onready var player := $Player
onready var player_cam := $Player/PlayerCam
onready var player_sprite := $Player/AnimatedSprite
onready var queue_free_timer := $Player/QueueFreeTimer

var soul_count := 0
onready var soul_count_label := $InfoHUDLayer/SoulCountLabel
onready var soul_group := $SoulGroup

onready var parallax_background := $ParallaxBackground
onready var level_cam := $LevelCam
onready var game_over_lose_hud := $GameOverLoseHUD
onready var game_over_win_hud := $GameOverWinHUD
onready var traps_area := $TrapsArea

onready var death_sound_player := $DeathSoundPlayer
onready var win_sound_player := $WinSoundPlayer

onready var timer_hud := $InfoHUDLayer/TimeHUD
onready var time_label := $InfoHUDLayer/TimeHUD/TimeLabel
onready var seconds_timer := $InfoHUDLayer/TimeHUD/SecondsTimer
onready var minutes_timer := $InfoHUDLayer/TimeHUD/MinutesTimer
var seconds := 0
var minutes := 0

var main_scene_path := "res://src/TitleScreen.tscn"
var level2_scene_path := "res://src/Level-2.tscn"


func _ready():
	instructions_popup.popup()


func _process(_delta):
#	if player:
#		timer_hud.rect_position.x = player_cam.get_camera_position().x - 43
	if seconds <= 9:
		time_label.text = str(minutes) + ":0" + str(seconds)
	else:
		time_label.text = str(minutes) + ":" + str(seconds)
	if seconds == 60:
		seconds = 0
	
	soul_count_label.text = "Souls collected: " + str(soul_count)
	
	
	if Input.is_action_just_pressed("pause_game"):
		get_tree().paused = true
		var screen_center = player_cam.get_camera_screen_center()
		pause_popup.set_position(Vector2(screen_center.x-218.5, screen_center.y - 96.5))
		pause_popup.show()


func kill_player():
	var death_screen_center = player_cam.get_camera_screen_center()
	player.run_speed = 0
	game_over(death_screen_center, "lose")
	player_sprite.visible = false
	player.explode_cogwheels()
	death_sound_player.play()
	seconds_timer.stop()
	minutes_timer.stop()
	queue_free_timer.start()


func win_player():
	var win_screen_center = player_cam.get_camera_screen_center()
	player.run_speed = 0
	game_over(win_screen_center, "win")
	win_sound_player.play()
	seconds_timer.stop()
	minutes_timer.stop()


func game_over(screen_center, end_status):
	var game_over_pos = Vector2(screen_center.x - 176.5, screen_center.y - 51)
	level_cam.position = screen_center
	level_cam.make_current()
	
	if end_status == "lose":
		game_over_lose_hud.set_position(game_over_pos)
	else:
		game_over_win_hud.set_position(game_over_pos)


func _on_Player_player_area_hit(area):
	if area.is_in_group("collectibles"):
		soul_group.remove_child(area)
		soul_count += 1


func _on_TrapsArea_body_shape_entered(body_id, _body, _body_shape, _area_shape):
	if body_id == player.get_instance_id():
		kill_player()


func _on_WinArea_body_shape_entered(body_id, _body, _body_shape, _area_shape):
	if body_id == player.get_instance_id():
		win_player()


func _on_NextLevelButton_pressed():
	var _ignored = get_tree().change_scene(level2_scene_path)


func _on_RetryButton_pressed():
	var _ignored = get_tree().reload_current_scene()


func _on_MainMenuButton_pressed():
	var _ignored = get_tree().change_scene(main_scene_path)


func _on_SecondsTimer_timeout():
	seconds += 1


func _on_MinutesTimer_timeout():
	minutes += 1


func _on_QueueFreeTimer_timeout():
	remove_child(player)


func _on_Unpause_pressed():
	pause_popup.hide()
	get_tree().paused = false
