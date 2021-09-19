extends Sprite

onready var fire_pos:Position2D = $FirePosition

export (PackedScene) var projectile_scene: PackedScene
var projectile_container:Node

func fire():
	var projectile_inst: Projectile = projectile_scene.instance()
	projectile_container.add_child(projectile_inst)
	projectile_inst.set_starting_values(fire_pos.global_position, (fire_pos.global_position - global_position).normalized() )
	projectile_inst.connect("delete_requested", self, "_on_projectile_delete_requested")

func _on_projectile_delete_requested(projectile: Projectile):
#	print("bye from cannon")
	projectile_container.remove_child(projectile)
#	call_deferred("remove_child", projectile)
	projectile.queue_free()
