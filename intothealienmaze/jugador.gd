extends Sprite2D

# Velocidad de movimiento del jugador
var speed: float = 100.0

# Referencia al AnimationPlayer
@onready var anim_player = $PlayerAnimation

# Variable para almacenar la última dirección horizontal (1 para derecha, -1 para izquierda)
var last_horizontal_direction: int = 1

func _process(delta: float) -> void:
	# Obtener la entrada del jugador
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1

	# Normalizar la dirección para mantener la velocidad uniforme en diagonal
	input_vector = input_vector.normalized()

	# Mover al jugador
	position += input_vector * speed * delta

	# Determinar la dirección horizontal y ajustar la animación y el giro del sprite
	if input_vector.x != 0:
		last_horizontal_direction = sign(input_vector.x)
		anim_player.play("rip_walk_right")
		
		# Si la dirección es hacia la izquierda, voltear el sprite
		flip_h = last_horizontal_direction == -1
	elif input_vector.y != 0:
		# Si se mueve verticalmente, reproducir la animación de caminar, pero sin cambiar el giro
		anim_player.play("rip_walk_right")
	else:
		# Si no hay movimiento, detener la animación
		anim_player.stop()
