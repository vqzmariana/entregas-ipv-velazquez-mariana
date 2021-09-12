extends Area2D

signal hit # signal personalizada

export var speed = 400 # speed player moves
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	hide()

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play() # $ equals to: get_node("AnimatedSprite")
	else:
		$AnimatedSprite.stop()
	
	position += velocity*delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	# clamp prevent to player leaves screen restricting position.value to a range
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0


func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	# se deshabilita la signal para emitirla solo una vez
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

#func game_over():
#	$ScoreTimer.stop()
#	$MobTimer.stop()

