extends Area2D


func _on_meta_body_entered(body):
	# Verificar si el cuerpo que entró es el jugador
	if body.is_in_group("Player"):  # Asegúrate de que el jugador esté en el grupo "Player"
		# Cambia a la escena YouWin cuando el jugador atraviesa la meta
		get_tree().change_scene("res://YouWin.tscn")
