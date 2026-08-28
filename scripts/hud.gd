extends CanvasLayer
## HUD que mostra a quantidade de gemas coletadas.
## Ouve o sinal "score_changed" do autoload GameManager.

@onready var score_label: Label = $MarginContainer/ScoreLabel


func _ready() -> void:
	GameManager.score_changed.connect(_on_score_changed)
	_update(GameManager.score)


func _on_score_changed(new_score: int) -> void:
	_update(new_score)


func _update(value: int) -> void:
	score_label.text = "Gemas: %d" % value
