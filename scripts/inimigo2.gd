extends CharacterBody2D
## Inimigo da fase

const SPEED: float = 100.0
var JUMP_VELOCITY: float = -420.0

var direction: int = 1

@onready var ray_right: RayCast2D = $RayRight
@onready var ray_left: RayCast2D = $RayLeft
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_right_jump: RayCast2D = $RayJumpRight
@onready var ray_left_jump: RayCast2D = $RayJumpLeft
@onready var ray_right_jump_hole: RayCast2D = $RayJumpRightHole
@onready var ray_left_jump_hole: RayCast2D = $RayJumpLeftHole


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if direction > 0 and ray_right.is_colliding():
		direction = -1
	elif direction < 0 and ray_left.is_colliding():
		direction = 1
		
	if ray_right_jump.is_colliding() and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if ray_left_jump.is_colliding() and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if not ray_right_jump_hole.is_colliding() and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if not ray_left_jump_hole.is_colliding() and is_on_floor():
		velocity.y = JUMP_VELOCITY

	sprite.flip_h = direction > 0
	velocity.x = direction * SPEED
	move_and_slide()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.reset()
		get_tree().reload_current_scene()
