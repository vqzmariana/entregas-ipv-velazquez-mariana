extends "res://entities/enemies/states/AbstractEnemyState.gd"


func enter():
	parent._play_animation("dead")
	parent.raycast.collision_mask = 0


func _on_animation_finished(anim_name):
	if anim_name == "dead":
		parent.remove_anim_player.play("remove")
