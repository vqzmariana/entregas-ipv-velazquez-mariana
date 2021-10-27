extends Area2D

export (PackedScene) var win_scene:PackedScene

func _on_Trophy_body_entered(body):
	print("You win!")
	var win_instance = win_scene.instance()
	yield(get_tree().create_timer(0.5), "timeout")
	get_parent().add_child(win_instance)
	GameState.notify_level_won()
