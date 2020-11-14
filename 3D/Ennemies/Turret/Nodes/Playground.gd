extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_turret($Turret)
	rotate_turret($Turret2)
	rotate_turret($Turret3)
	pass

func rotate_turret(t : Turret):
	t.rotate(Vector3(1,0,0),PI/45)
	pass
