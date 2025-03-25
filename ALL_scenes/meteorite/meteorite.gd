extends CharacterBody2D


@onready var galaxy_ship:CharacterBody2D = $"../Galaxy_ship"


func _process(delta: float) -> void:
	print(galaxy_ship.position.y)
	position += self.position.direction_to(galaxy_ship.position) * 300 * delta
	
