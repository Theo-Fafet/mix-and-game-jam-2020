extends AudioStreamPlayer
class_name GlassBreak

var samples : Array = [
	preload("res://Audio/GLASBrk_Bulb bursting 1 (ID 2039)_BSB.ogg"),
	preload("res://Audio/GLASBrk_Bulb bursting 2 (ID 2040)_BSB.ogg"),
	preload("res://Audio/GLASBrk_Bulb bursting 3 (ID 2041)_BSB.ogg"),
	preload("res://Audio/GLASBrk_Bulb bursting 4 (ID 2042)_BSB.ogg"),
	preload("res://Audio/GLASBrk_Bulb bursting 5 (ID 2043)_BSB.ogg"),
]

func _ready():
	autoplay = false
	
func _on_Ball_on_break():
	stream = samples[randi() % samples.size()]
	play()
