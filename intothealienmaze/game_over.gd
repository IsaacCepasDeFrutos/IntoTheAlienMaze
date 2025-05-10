extends Node2D

func _input(event: InputEvent) -> void:
	# Verifica si se pulsa la barra espaciadora
	if event.is_action_pressed("ui_accept"):  # "ui_accept" suele ser la barra espaciadora por defecto
		# Reinicia la escena inicial del juego
		get_tree().change_scene_to_file("res://mapa.tscn")
