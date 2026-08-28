extends CanvasLayer
## Menu de pause. Abre e fecha com a tecla configurada na acao "pause" (Esc).


func _ready() -> void:
	visible = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_toggle_pause()


func _toggle_pause() -> void:
	var paused: bool = not get_tree().paused
	get_tree().paused = paused
	visible = paused


func _on_resume_pressed() -> void:
	_toggle_pause()


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
