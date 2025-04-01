extends Node2D




func _ready() -> void:

	var meteorite_scene = load("res://ALL_scenes/meteorite/meteorite.tscn")
	for i in range(10):
		# создаём метеориты в случайных координатах по x
		var meteorite:Area2D = meteorite_scene.instantiate()
		meteorite.position = Vector2(randi_range(-200,1580),50)
		add_child(meteorite)
	



func _input(event):
	if(event.is_action_pressed("esc_key")):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
