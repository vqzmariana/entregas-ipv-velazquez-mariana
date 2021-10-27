extends "res://entities/AbstractState.gd"

func enter():
	parent.hide_hat()
	parent._play_animation("dead")
	yield(get_tree().create_timer(2), "timeout")
	parent._remove()


func update(delta):
	parent._handle_deacceleration()
	parent._apply_movement()
