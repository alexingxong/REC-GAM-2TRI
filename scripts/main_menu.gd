extends Control
## Menu inicial do jogo.


func _on_start_pressed() -> void:
	GameManager.reset()
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
