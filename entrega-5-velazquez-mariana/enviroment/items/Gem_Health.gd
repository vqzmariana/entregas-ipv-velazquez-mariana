extends Area2D

func _on_Gem_Health_body_entered(body):
	if body is Player:
		body.notify_hit(PlayerData.max_health)
	self.queue_free()
