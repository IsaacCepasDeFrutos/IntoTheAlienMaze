extends CharacterBody2D

# Velocidad de movimiento del jugador
var speed: float = 100.0

# Referencia al AnimationPlayer
@onready var anim_player = $Jugador/PlayerAnimation  # Asegúrate de que esto es correcto
@onready var sprite =$Jugador
# Variable para almacenar la última dirección horizontal (1 para derecha, -1 para izquierda)
var last_horizontal_direction: int = 1

func _ready() -> void:
	# Iniciar animación
	anim_player.play("rip_walk_right")  # Puedes iniciar la animación de movimiento si lo deseas

func _process(_delta: float) -> void:
	# Resetear la velocidad
	var input_vector = Vector2.ZERO
	
	# Obtener entrada del jugador
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1

	# Normalizar la dirección para mantener la velocidad uniforme en diagonal
	input_vector = input_vector.normalized() * speed

	# Establecer la velocidad del CharacterBody2D
	velocity = input_vector

	# Mover al jugador usando move_and_slide
	move_and_slide()

	# Determinar la dirección horizontal y ajustar la animación y el giro del sprite
	if input_vector.x != 0:
		last_horizontal_direction = sign(input_vector.x)
		anim_player.play("rip_walk_right")  # Asegúrate de que la animación se llame así
		$Jugador.flip_h = last_horizontal_direction == -1  # Voltear el sprite según la dirección
	elif input_vector.y != 0:
		anim_player.play("rip_walk_right")  # Cambia esto si tienes animaciones diferentes para arriba/abajo
	else:
		anim_player.stop()  # Detener la animación si no hay movimiento
