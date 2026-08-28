extends Area2D
## Coletável da fase

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.add_point()
		body.brilhar()
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	pass
