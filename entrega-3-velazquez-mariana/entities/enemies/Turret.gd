extends Sprite

onready var fire_position = $FirePosition
onready var fire_timer = $FireTimer

export (PackedScene) var projectile_scene

var target: Node2D
var projectile_container

func _ready():
	fire_timer.connect("timeout", self, "fire_at_player")

func initialize(container, turret_pos, a_projectile_container):
	container.add_child(self)
	global_position = turret_pos
	self.projectile_container = a_projectile_container

func fire_at_player():
	var proj_instance = projectile_scene.instance()
	proj_instance.initialize(target.projectile_container, fire_position.global_position, fire_position.global_position.direction_to(target.global_position))


# deteccion de jugador
func _on_DetectionArea_body_entered(body):
	if target == null and body is Player:
		target = body
		fire_timer.start()

func _on_DetectionArea_body_exited(body):
	if( body == target):
		target = null
		fire_timer.stop()


# deteccion disparos
func _on_TurretArea_area_entered(area):
	if 'PlayerProjectile' in area.name:
		deleteTurret()

func deleteTurret():
	get_parent().remove_child(self)
	queue_free()
