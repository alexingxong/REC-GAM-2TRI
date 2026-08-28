extends Area2D
## Placa de fim de fase: quando o player chega perto dela, deveria escrever
## uma mensagem de fase concluida na tela.


var gemas_na_fase: int = 4


@onready var texto: Label = $Aviso


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return

	texto.text = "Fase concluida! Ao todo eram " + str(gemas_na_fase) + " gemas."
