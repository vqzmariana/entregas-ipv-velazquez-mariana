extends Sprite

onready var cannon:Sprite = $Cannon
onready var screen_size = get_viewport_rect().size
var projectile_container:Node
var speed = 200 #Pixeles

export (float) var Aceleracion:float = 20.0
export (float) var Speed_limit:float = 600.0
export (float) var Friction_weight:float = 0.1
var velocity:Vector2 = Vector2.ZERO

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
	
	if(direction_optimized != 0):
		# clamp limita el valor dentro de un rango dado: speed_limit ## suma velocidad -> sensacion de aceleracion
		velocity.x = clamp((velocity.x + (direction_optimized*Aceleracion)), -Speed_limit, Speed_limit )
	else:
		# si no se mueve, frena segun peso
		velocity.x = lerp(velocity.x, 0, Friction_weight) if abs(velocity.x) > 1 else 0
	
	velocity.x += direction_optimized * speed * delta
	var next_pos = position + velocity*delta
	next_pos.x = clamp(next_pos.x, 0, screen_size.x)
	next_pos.y = clamp(next_pos.y, 0, screen_size.y)
	position = next_pos

func set_projectile_container(containet:Node):
	cannon.projectile_container = containet
	projectile_container = containet
