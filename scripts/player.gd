extends CharacterBody2D
## Player do jogo de plataforma.

var SPEED: float = 210.0
var JUMP_VELOCITY: float = -420.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var pode_pular: bool = animated_sprite.sprite_frames.has_animation("jump")
	if Input.is_action_just_pressed("jump") and is_on_floor() and pode_pular:
		velocity.y = JUMP_VELOCITY

	var direction: float = Input.get_axis("move_left", "move_right")
	if direction != 0.0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0.0, SPEED)

	_update_animation(direction, pode_pular)
	move_and_slide()


func brilhar() -> void:
	$Particulas.restart()


func _update_animation(direction: float, pode_pular: bool) -> void:
	if direction != 0.0:
		animated_sprite.flip_h = direction < 0.0

	if not is_on_floor() and pode_pular:
		animated_sprite.play("jump")
	elif direction != 0.0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
