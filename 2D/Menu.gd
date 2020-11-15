extends CanvasItem
class_name Play

var first_level = preload("res://3D/Levels/Level 1/Level1.tscn")

func _on_Play_pressed():
	get_tree().change_scene_to(first_level)

func _on_Quit_pressed():
	get_tree().quit()
