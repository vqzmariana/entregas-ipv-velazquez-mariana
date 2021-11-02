extends "res://entities/enemies/states/AbstractEnemyState.gd"

onready var fire_timer:Timer = $FireTimer


func notify_body_exited(body):
	.notify_body_exited(body)
	if parent.target == null:
		emit_signal("finished", "idle")


func enter():
	parent.velocity.x = 0
	parent.call_deferred("fire")
	fire_timer.start()
	parent._play_animation("shoot")


func exit():
	fire_timer.stop()


func update(delta):
	var can_see_target:bool = parent._can_see_target()
	if fire_timer.is_stopped() && can_see_target:
		parent.fire()
		fire_timer.start()
	elif !fire_timer.is_stopped() && !can_see_target:
		fire_timer.stop()
	
	if can_see_target:
		parent.body_sprite.flip_h = parent.global_position.direction_to(parent.target.global_position).x < 0


func _on_animation_finished(anim_name):
	if anim_name == "shoot":
		parent._play_animation("idle")


func _on_FireTimer_timeout():
	if parent._can_see_target():
		parent.fire()
		fire_timer.start()
		parent._play_animation("shoot")
