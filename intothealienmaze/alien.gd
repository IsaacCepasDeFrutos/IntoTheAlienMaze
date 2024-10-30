extends Sprite2D

# Variable para la velocidad del enemigo
var speed: float = 50.0

# Referencia al nodo del jugador
var player: Node2D

# Referencia al AnimationPlayer
@onready var anim_player = $AlienAnimation

func _ready() -> void:
	# Encuentra al jugador en la escena (ajusta el nombre si es diferente)
	player = get_node("/root/Path/To/Player")  # Cambia el path al de tu jugador
	# Si no encuentras al jugador, asegúrate de verificar el path
	
	# Configura la animación inicial en idle
	anim_player.play("walk_right")

func _process(delta: float) -> void:
	if player:
		# Calcula la dirección hacia el jugador
		var direction = (player.global_position - global_position).normalized()
		
		# Si el enemigo está en movimiento, reproduce la animación de "walk", de lo contrario "idle"
		if direction.length() > 0:
			anim_player.play("walk")
		else:
			anim_player.play("idle")
		
		# Mueve al enemigo en la dirección del jugador
		position += direction * speed * delta
