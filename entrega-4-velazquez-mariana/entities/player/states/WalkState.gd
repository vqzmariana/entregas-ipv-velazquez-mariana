extends "res://entities/AbstractState.gd"


func update(delta):
	parent._handle_cannon_actions()
	parent._handle_move_input()
	parent._apply_movement()
	if parent.move_direction == 0:
		emit_signal("finished", "idle")

func handle_input(event:InputEvent):
#	if(event.is_action_pressed("move_right") || event.is_action_pressed("move_left")):
#		emit_signal("finished", "walk")
#		parent._apply_movement()
	if event.is_action_pressed("jump") && parent.is_on_floor():
		emit_signal("finished", "jump")
