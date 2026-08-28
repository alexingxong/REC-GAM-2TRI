extends CharacterBody2D
## Inimigo da fase

const SPEED: float = 40.0

var direction: int = 1

@onready var ray_right: RayCast2D = $RayRight
@onready var ray_left: RayCast2D = $RayLeft
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if direction > 0 and ray_right.is_colliding():
		direction = -1
	elif direction < 0 and ray_left.is_colliding():
		direction = 1

	sprite.flip_h = direction > 0
	velocity.x = direction * SPEED
	move_and_slide()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.reset()
		get_tree().reload_current_scene()
