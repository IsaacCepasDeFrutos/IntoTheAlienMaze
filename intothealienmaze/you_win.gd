extends Node2D
#@onready var audio_player = $YouWin/AudioPlayer
func _input(event: InputEvent) -> void:
	# Verifica si se pulsa la barra espaciadora
	if event.is_action_pressed("ui_accept"):  # "ui_accept" suele ser la barra espaciadora por defecto
		# Reinicia la escena inicial del juego
			get_tree().change_scene_to_file("res://mapa.tscn")


#func _ready() -> void:
		# Reproduce el sonido cuando se carga la escena
		#audio_player.play()
