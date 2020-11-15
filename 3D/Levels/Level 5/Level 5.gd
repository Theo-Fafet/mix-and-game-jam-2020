extends MeshInstance

var keys = 0


func _on_Trinket_collected():
	keys+=1
	if(keys == 2):
		get_node("Platform_2x2/Door").queue_free()
	pass # Replace with function body.
