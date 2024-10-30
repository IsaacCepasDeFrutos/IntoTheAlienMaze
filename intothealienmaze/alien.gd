extends Sprite2D

# Variable para la velocidad del enemigo
var speed: float = 50.0

# Referencia al nodo del jugador
var player: Node2D

func _ready() -> void:
	# Encuentra al jugador en la escena (ajusta el nombre si es diferente)
	player = get_node("/root/Path/To/Player")  # Cambia el path al de tu jugador
	# Si no encuentras al jugador, asegúrate de verificar el path

func _process(delta: float) -> void:
	if player:
		# Calcula la dirección hacia el jugador
		var direction = (player.global_position - global_position).normalized()
		
		# Mueve al enemigo en la dirección del jugador
		position += direction * speed * delta
