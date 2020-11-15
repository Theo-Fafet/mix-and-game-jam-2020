extends MeshInstance

signal collected;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	print("yoohoo!!")
	emit_signal("collected")
	queue_free()
	pass # Replace with function body.
