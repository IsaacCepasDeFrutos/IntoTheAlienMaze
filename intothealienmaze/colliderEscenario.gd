extends Area2D

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):  # Verifica si el objeto es el jugador
		body.velocity = Vector2.ZERO  # Detiene el movimiento del jugador (necesitas que el jugador tenga `velocity`)

		# Opcional: empuja al jugador ligeramente hacia atrás para evitar que atraviese el área
		var push_direction = (body.global_position - global_position).normalized()
		body.global_position += push_direction * 10
