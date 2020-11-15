extends Spatial
class_name FinishHole

export(float) var wait_time: float = 1
export(PackedScene) var next_level : PackedScene

func _on_FinishArea_body_entered(area):
	$Timer.start(wait_time)


func _on_FinishArea_body_exited(area):
	$Timer.stop()

func _on_Timer_timeout():
	print("success")
	var error = get_tree().change_scene_to(next_level)
	if (error):
		printerr(error)
