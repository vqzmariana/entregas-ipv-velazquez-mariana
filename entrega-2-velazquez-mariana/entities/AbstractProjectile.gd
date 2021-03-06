extends Sprite
class_name Projectile

signal delete_requested(projectile)

var direction:Vector2
export var speed:float

func _ready():
	set_physics_process(false)
	$ExitNotifier.connect("screen_exited", self, "_on_projectile_screen_exited")

func _physics_process(delta):
	position += self.direction*speed*delta

func set_starting_values(starting_pos:Vector2, dir:Vector2):
	global_position = starting_pos
	self.direction = dir
	$Timer.start()
	set_physics_process(true)


func _on_Timer_timeout():
	pass
	#emit_signal("delete_requested", self)


func _on_projectile_screen_exited():
	emit_signal("delete_requested", self)

