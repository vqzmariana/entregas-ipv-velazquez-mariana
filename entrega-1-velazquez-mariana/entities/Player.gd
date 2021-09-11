extends Sprite

export (float) var speed:float = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
#	var direction: int = 0
	
	var direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
#	if (Input.is_action_pressed("move_left")):
#		direction = -1
#	elif Input.is_action_pressed("move_right"):
#		direction = 1
	
	position.x += direction * speed * delta # en cada frame posible, movete
	#position.x += 5*delta # 5 unidades por segundos

