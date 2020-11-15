extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var clockwise2 = 1


# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Turret2	.rotate(Vector3(0,1,0),delta * clockwise2 * PI/3)
	$Platform_2x2/Turret5.rotate(Vector3(0,1,0),delta * clockwise2 * PI/4)
	$Platform_2x2/Turret4.rotate(Vector3(0,1,0),delta * clockwise2 * PI/4)
	pass


func _on_Timer2_timeout():
	clockwise2*=-1
	pass # Replace with function body.
