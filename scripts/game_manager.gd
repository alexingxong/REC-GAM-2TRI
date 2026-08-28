extends Node
## Autoload (Singleton) que guarda a pontuacao do jogo.
## Emite um sinal sempre que a pontuacao muda, para o HUD se atualizar.

signal score_changed(new_score: int)

var score: int = 0


func add_point(amount: int = 1) -> void:
	score += amount
	score_changed.emit(score)


func reset() -> void:
	score = 0
	score_changed.emit(score)
