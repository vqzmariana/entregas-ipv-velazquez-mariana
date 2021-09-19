extends Sprite

onready var cannon:Sprite = $Cannon
var projectile_container:Node
var speed = 200 #Pixeles

func _physics_process(delta):
	# Manera optimizada
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	# vector.to_local() & vector.to_global()
	# transforms coord
	var mouse_pos: Vector2 = get_global_mouse_position()
	var origin_pos:Vector2 = global_position
	var direction:Vector2 = mouse_pos - (mouse_pos - origin_pos).normalized() 
	
	cannon.look_at(direction)
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
	
	position.x += direction_optimized * speed * delta

func set_projectile_container(containet:Node):
	cannon.projectile_container = containet
	projectile_container = containet
