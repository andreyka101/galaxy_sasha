extends Area2D


var death = true
@onready var level = $".."
@onready var timer:Timer = $Timer



func _ready() -> void:
	# таймер будет срабатывать в случайное время
	# timer.wait_time = randf_range(1 , 3)
	timer.start(randf_range(1 , 3))
	# timer.autostart = true



# создаем пулю раз в какое-то время
func _on_timer_timeout() -> void:
	#print("on_timer_timeout")
	if(death):
		var bullet_scene = load("res://ALL_scenes/enemy_bullet/enemy_bullet.tscn")
		var bullet:Area2D = bullet_scene.instantiate()
		bullet.global_position = self.global_position
		level.add_child(bullet)
		# таймер будет срабатывать в случайное время
		timer.wait_time = randf_range(1 , 3)


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
