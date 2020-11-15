extends Spatial
class_name FinishHole

export(PackedScene) var next_level : PackedScene

var finished : bool = false
var jingle : AudioStream = preload("res://Audio/endlevel.ogg")
var original_stream : AudioStream

func _ready():
	original_stream = $"/root/MusicPlayer".stream

func _on_FinishArea_body_entered(area):
	$Timer.start(jingle.get_length()+0.1)


func _on_FinishArea_body_exited(area):
	$Timer.stop()

func _on_Timer_timeout():
	$"/root/MusicPlayer".stop()
	$"/root/MusicPlayer".stream = jingle
	$"/root/MusicPlayer".connect("finished", self, "_load_next_level")
	$"/root/MusicPlayer".play()

func _load_next_level():
	$"/root/MusicPlayer".disconnect("finished", self, "_load_next_level")
	$"/root/MusicPlayer".stream = original_stream
	$"/root/MusicPlayer".play()
	var error = get_tree().change_scene_to(next_level)
	if (error):
		printerr(error)
