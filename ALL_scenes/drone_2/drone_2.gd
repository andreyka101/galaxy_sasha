extends Area2D


@onready var galaxy_ship:CharacterBody2D = $"../Galaxy_ship"
@onready var timer:Timer = $Timer
@onready var marker_RIGHT:Marker2D = $Marker2D_RIGHT
@onready var marker_LEFT:Marker2D = $Marker2D_LEFT
@onready var level = $".."

var distance_from_player_X = null
var direction = null
var death = false
var shooting = false


func _ready() -> void:
	# меняет время срабатывания таймера
	#timer.wait_time = randf_range(1 , 3)

	# запускаем и меняет время срабатывания таймера
	timer.start(randf_range(1 , 2))


func _process(delta: float) -> void:
	if(not shooting):
		if(galaxy_ship.position and (position.x <= galaxy_ship.position.x - 15 or position.x >= galaxy_ship.position.x + 15)):
			#distance_from_player_X = galaxy_ship.position.x - self.position.x
			#self.position.x += distance_from_player_X * 3 * delta
			#print(distance_from_player_X)
			
			#direction = galaxy_ship.position.x - self.position.x
			if(galaxy_ship.position.x - self.position.x > 0):
				self.position.x +=  300 * delta
			else:
				self.position.x -=  300 * delta
			
		self.position.y += 20 * delta 


func _on_timer_timeout() -> void:
		if(not death):
			timer.wait_time = randf_range(1 , 2)
			shooting = true
			#await get_tree().create_timer(0.3).timeout
			
			var bullet_scene = load("res://ALL_scenes/enemy_bullet/enemy_bullet.tscn")
			
			var bullet_RIGHT:Area2D = bullet_scene.instantiate()
			bullet_RIGHT.speed_bullet = bullet_RIGHT.speed_bullet * 1.5
			bullet_RIGHT.global_position = marker_RIGHT.global_position
			level.add_child(bullet_RIGHT)
			
			var bullet_LEFT:Area2D = bullet_scene.instantiate()
			bullet_LEFT.speed_bullet = bullet_LEFT.speed_bullet * 1.5
			bullet_LEFT.global_position = marker_LEFT.global_position
			level.add_child(bullet_LEFT)
			
			# таймер будет срабатывать в случайное время
			#await get_tree().create_timer(0.1).timeout
			shooting = false
