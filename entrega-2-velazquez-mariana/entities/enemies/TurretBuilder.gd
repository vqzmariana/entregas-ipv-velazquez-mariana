extends Node2D

export (PackedScene) var turret_scene: PackedScene
export (float) var amount: float

var turret_container:Node
var player: Sprite
var min_distance: float = 25
var screen_size

func set_values(aplayer:Sprite, container:Node):
	self.turret_container = container
	self.player = aplayer
	self.screen_size = get_viewport_rect().size # size de pantalla
	
	for _i in range(self.amount):
		self.createTurret()
	

func createTurret():
	randomize()
	var pos_x = rand_range(min_distance, self.screen_size.x)
	randomize()
	var pos_y = rand_range(min_distance, player.position.y-(min_distance*5) )

	var newPos:Vector2 = Vector2(pos_x, pos_y)
	var newTurret:Turret = turret_scene.instance()
	newTurret.position = newPos
	
	# primero se agrega, luego se inicializa
	turret_container.add_child(newTurret)
	newTurret.set_values(self.player, self.turret_container)
