extends Sprite
class_name Turret

export (PackedScene) var projectile_scene: PackedScene
onready var fire_pos:Position2D = $FirePosition
var projectile_container: Node
var player 

func set_values(player:Sprite, projectile_container:Node):
	self.player = player
	self.projectile_container = projectile_container
	$Timer.start()


func _on_Timer_timeout():
	fire()

func fire():
	var projectile: Projectile = projectile_scene.instance()
	projectile_container.add_child(projectile)
	projectile.set_starting_values(fire_pos.global_position, (player.global_position - fire_pos.global_position).normalized())
	projectile.connect("delete_requested", self, "_on_projectile_delete_requested")

func _on_projectile_delete_requested(projectile:Projectile):
#	print("bye from turret")
	projectile_container.remove_child(projectile)
	projectile.queue_free()
