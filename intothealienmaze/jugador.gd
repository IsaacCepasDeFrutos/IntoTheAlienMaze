extends Sprite2D

# Velocidad de movimiento del jugador
var speed: float = 100.0

# Referencia al AnimationPlayer
@onready var anim_player = $PlayerAnimation

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

	# Activar animación solo cuando se mueve hacia la derecha
	if input_vector.x > 0:
		if anim_player.current_animation != "rip_walk_right":
			anim_player.play("rip_walk_right")
	else:
		# Parar la animación si no se está moviendo a la derecha
		anim_player.stop()
