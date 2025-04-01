extends Node2D


#@onready var lab_text = $Label
@onready var lab_text = get_node("Label")


func _on_button_pressed() -> void:
	#print("efef")
	lab_text.position.x =500
	lab_text.position.y=400
	lab_text.text = "83837873ry38r"
