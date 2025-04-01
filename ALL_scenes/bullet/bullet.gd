extends CharacterBody2D


var damage_bullet = 100


func _physics_process(delta: float) -> void:
	# постоянная скорость пули
	self.position.y -= 300 * delta
	#print(11)
	#print(self.position)
	if(self.position.y < -100):
		queue_free()
	
	
