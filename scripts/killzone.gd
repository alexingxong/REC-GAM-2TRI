extends Area2D
## Zona de morte. Se o player cair aqui, o jogo reinicia a fase.

@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	Engine.time_scale = 0.5
	body.set_physics_process(false)
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	GameManager.reset()
	get_tree().reload_current_scene()
