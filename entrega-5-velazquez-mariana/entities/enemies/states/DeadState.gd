extends "res://entities/enemies/states/AbstractEnemyState.gd"

onready var remove_timer = $RemoveTimer

func enter():
	remove_timer.start(2)
	parent.play_animation("dead")	


func _on_RemoveTimer_timeout():
	parent.call_deferred("_remove")
