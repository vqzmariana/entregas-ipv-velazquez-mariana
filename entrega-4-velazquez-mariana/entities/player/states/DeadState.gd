extends "res://entities/AbstractState.gd"

func enter():
	parent._remove()


func update(delta:float):
	parent._apply_movement()
