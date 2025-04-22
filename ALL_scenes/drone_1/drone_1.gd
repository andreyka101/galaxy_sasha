extends Area2D

@onready var sprite_head:AnimatedSprite2D =  $AnimatedSprite2D_head
@onready var galaxy_ship:CharacterBody2D = $"../Galaxy_ship"
var speed_rotation = 0
var speed = randf_range(60 , 160)
var hp_drone_1 = 50


func _ready() -> void:
	# задаём направление для вращения головы дрона
	if(randi_range(0 ,1) == 1):
		speed_rotation = 5
	else:
		speed_rotation = -5
		
	
	

func _process(delta: float) -> void:

	# вращаем голову
	sprite_head.rotation_degrees += speed_rotation


	# градус головы не увеличивается больше 360
	if(sprite_head.rotation_degrees >= 360):
		sprite_head.rotation_degrees -= 360
	if(sprite_head.rotation_degrees <= -360):
		sprite_head.rotation_degrees += 360
	#print(sprite_head.rotation_degrees)
	
	
	# дрон всегда смотрит в сторону корабля игрока
	look_at(galaxy_ship.position)


	# дрон летит в сторону корабля игрока
	position += self.position.direction_to(galaxy_ship.position) * speed * delta
	
	


func _on_body_entered(body: Node2D) -> void:

	# если касаемся корабля игрока то наносим ему урон и взрываемся
	if(body.name == "Galaxy_ship"):
		body.hp_player -= 300
		sprite_head.play("explosion")
		await sprite_head.animation_finished
		self.queue_free()
		
		
	for i_group in body.get_groups():
		#print(i_group)
		# если в группе есть пуля то наносим урон дрону и удаляем пулю
		if(i_group == "group_bullet"):
			hp_drone_1 -= body.damage_bullet
			body.queue_free()
			if(hp_drone_1 > 0):
				sprite_head.self_modulate = "#ff4551"
				await get_tree().create_timer(0.2).timeout
				sprite_head.self_modulate = "#fff"
			
			
			# смерть дрона
			if(hp_drone_1 <= 0):
				sprite_head.play("explosion")
				await sprite_head.animation_finished
				speed_rotation = 0
				speed = 0
				self.queue_free()


# func _on_boom_area_entered(area: Area2D) -> void:
# 	for i_group in body.get_groups():
# 		#print(i_group)
# 		if(i_group == "group_bullet"):
# 			i_group
