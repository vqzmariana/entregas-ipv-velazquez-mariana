extends Node

onready var player = $Player
onready var turret_spawner = $TurretsSpawner
onready var absolute_scene = $BackgroundSceneLayer/Background

func _ready():
	randomize()
	player.initialize(self)
#	print('rect'+str(absolute_scene.get_rect().size))
