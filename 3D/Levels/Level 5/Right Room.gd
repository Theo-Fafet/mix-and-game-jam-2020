extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Platform_2x4/Turret.rotate(Vector3(1,0,0),-PI/2)
	$Platform_2x3/Turret.rotate(Vector3(1,0,0),-PI/2)
	$Platform_2x5/Turret.rotate(Vector3(1,0,0),-PI/2)
	$Platform_2x6/Turret.rotate(Vector3(1,0,0),-PI/2)
	$Platform_2x7/Turret.rotate(Vector3(1,0,0),-PI/2)
	$Platform_2x8/Turret.rotate(Vector3(1,0,0),-PI/2)
	$Platform_2x9/Turret.rotate(Vector3(1,0,0),-PI/2)
	$Platform_2x10/Turret.rotate(Vector3(1,0,0),-PI/2)
	$Platform_2x11/Turret.rotate(Vector3(1,0,0),-PI/2)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Turret2	.rotate(Vector3(0,1,0),delta * 2*PI/5)
	$Turret3	.rotate(Vector3(0,1,0),delta * 2*PI/5)
	
	if(get_parent().get_node("Ball").rb):
		$Turret.look_at(get_parent().get_node("Ball").rb.global_transform.origin,Vector3(0,1,0))
	pass
