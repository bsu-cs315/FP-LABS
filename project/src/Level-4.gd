extends Node2D


onready var instructions_popup := $InstructionsPopup
onready var pause_popup := $PausePopup

onready var player := $Player
onready var player_cam := $Player/PlayerCam
onready var player_sprite := $Player/AnimatedSprite
onready var queue_free_timer := $Player/QueueFreeTimer

var enemy_count := 0
onready var enemy_count_label := $InfoHUDLayer/EnemyCountLabel

var soul_count := 0
onready var soul_count_label := $InfoHUDLayer/SoulCountLabel
onready var soul_group := $SoulGroup

onready var parallax_background := $ParallaxBackground
onready var level_cam := $LevelCam
onready var game_over_lose_hud := $GameOverLoseHUD
onready var game_over_win_hud := $GameOverWinHUD

onready var death_sound_player := $DeathSoundPlayer
onready var win_sound_player := $WinSoundPlayer

onready var timer_hud := $InfoHUDLayer/TimeHUD
onready var time_label := $InfoHUDLayer/TimeHUD/TimeLabel
onready var seconds_timer := $InfoHUDLayer/TimeHUD/SecondsTimer
onready var minutes_timer := $InfoHUDLayer/TimeHUD/MinutesTimer
var seconds := 0
var minutes := 0

onready var secrets_tilemap := $Secrets

var main_scene_path := "res://src/TitleScreen.tscn"
var credits_scene_path := "res://src/CreditsScreen.tscn"


func _ready():
	player.enable_level_4()
	instructions_popup.popup()
	
	for enemy in get_tree().get_nodes_in_group("enemies"):
		enemy_count += 1


func _process(_delta):
	if seconds <= 9:
		time_label.text = str(minutes) + ":0" + str(seconds)
	else:
		time_label.text = str(minutes) + ":" + str(seconds)
	if seconds == 60:
		seconds = 0
	
	enemy_count_label.text = "Enemies left: " + str(enemy_count)
	soul_count_label.text = "Souls collected: " + str(soul_count)
	
	if enemy_count <= 0:
		win_player()
	
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


func kill_enemy(body):
	body.queue_free()
	enemy_count -= 1
	


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


func _on_Player_player_hit(body):
	if body.is_in_group("enemies"):
		kill_player()


func _on_Player_player_area_hit(area):
	if area.is_in_group("collectibles"):
		area.queue_free()
		soul_count += 1


func _on_Player_enemy_hit(body):
	kill_enemy(body)


func _on_SecretsArea2D_body_entered(body):
	if body == player:
		secrets_tilemap.visible = false
		player_cam.limit_bottom = 1050
		player_cam.drag_margin_top = 0.5
		player_cam.drag_margin_v_enabled = true


func _on_SecretsArea2D_body_exited(body):
	if body == player:
		secrets_tilemap.visible = true
		player_cam.limit_bottom = 1
		player_cam.drag_margin_v_enabled = false


func _on_RetryButton_pressed():
	var _ignored = get_tree().reload_current_scene()


func _on_MainMenuButton_pressed():
	var _ignored = get_tree().change_scene(main_scene_path)


func _on_SecondsTimer_timeout():
	seconds += 1


func _on_MinutesTimer_timeout():
	minutes += 1


func _on_QueueFreeTimer_timeout():
	player.queue_free()


func _on_Unpause_pressed():
	pause_popup.hide()
	get_tree().paused = false


func _on_CreditsButton_pressed():
	var _ignored = get_tree().change_scene(credits_scene_path)
