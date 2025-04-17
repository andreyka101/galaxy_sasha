extends Area2D


var sideways_movement = false
var position_save = null



var damage_bullet = 100



func _physics_process(delta: float) -> void:
	# проверка как должка двигаться пуля прямо или в бок
	if(sideways_movement):
		# линейное движение до какой точки
		self.position += self.position.direction_to(position_save) * 400 * delta
	else:
		# движение в низ
		self.position.y += 400 * delta
	
	
	
	

	# если пуля улетела слишком далеко за экран то уделяем её 
	if(self.position.y > 850):
		queue_free()



# наносим урон игроку при вхождении
func _on_body_entered(body: Node2D) -> void:
		if(body.name == "Galaxy_ship"):
		
			body.hp_player -= 30
			self.queue_free()
