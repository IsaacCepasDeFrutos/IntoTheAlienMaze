extends Sprite2D

# Velocidad de movimiento del enemigo
var speed: float = 79.0

# Referencia al nodo del jugador
var player: Node2D

# Referencia al AnimationPlayer
@onready var anim_player = $AlienAnimation
@onready var area = $Area2D  # Referencia al nodo Area2D para detectar colisiones

# Variable para almacenar la última dirección horizontal
var last_horizontal_direction: int = 1

func _ready() -> void:
	# Encuentra al jugador en la escena
	player = get_node("/root/Node2D/Jugador")  # Cambia el path al de tu jugador
	anim_player.play("walk_right")  # Asume que la animación de caminar se llama "walk_right"

func _process(delta: float) -> void:
	if player:
		# Calcula la dirección hacia el jugador
		var direction = (player.global_position - global_position).normalized()
		
		# Mueve al enemigo hacia el jugador
		position += direction * speed * delta

		# Determina si el enemigo se mueve horizontalmente para ajustar la dirección de la animación
		if direction.x != 0:
			last_horizontal_direction = sign(direction.x)
			flip_h = last_horizontal_direction == -1

		# Reproduce la animación solo si cambia de dirección
		if anim_player.current_animation != "walk_right":
			anim_player.play("walk_right")

# Función que se activa cuando `body_entered` detecta una colisión con el jugador
func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		print(body.name)
		get_tree().change_scene_to_file("res://GameOver.tscn")
		
