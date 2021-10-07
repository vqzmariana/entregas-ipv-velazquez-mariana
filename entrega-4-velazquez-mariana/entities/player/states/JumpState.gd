extends "res://entities/AbstractState.gd"

func enter():
	parent.velocity.y = -parent.jump_speed
	parent.snap_vector = Vector2.ZERO

#func handle_input(event:InputEvent):
#	# quiero que se mueva mientras este en el aire.
#	if event.is_action_pressed("move_left") || event.is_action_pressed("move_right"):
#		emit_signal("finished", "walk")

func update(delta:float):
	parent._handle_cannon_actions()
	parent._handle_move_input()
	if parent.move_direction == 0:
		parent._handle_deacceleration()
	
	parent._apply_movement()
	
	if parent.is_on_floor():
		if parent.move_direction != 0:
			emit_signal("finished", "walk")
		else:
			emit_signal("finished", "idle")
