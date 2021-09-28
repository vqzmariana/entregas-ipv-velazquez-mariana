extends Node2D

export (PackedScene) var turret_scene

func _ready():
	call_deferred("initialize")

func initialize():
	var visible_rect:Rect2 = get_viewport().get_visible_rect()
	var scene = get_parent().absolute_scene
	for i in 5:
		var turret_instance = turret_scene.instance()
		var pos_x: float = rand_range(visible_rect.position.x, scene.get_rect().size.x)
		
		var turret_pos:Vector2 = Vector2(pos_x, rand_range(visible_rect.position.y + 30, global_position.y - 50))
		
		turret_instance.initialize(self, turret_pos, self)
