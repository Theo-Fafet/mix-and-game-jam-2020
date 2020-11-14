extends Spatial
class_name BallController

export(float) var strength = 1

onready var rb: RigidBody = $"BallRB"
onready var core: MeshInstance = $"BallRB/BallMesh/CoreMesh"

var _initial_position

func _ready():
	_initial_position = get_global_transform().origin

func get_torque() -> Vector3: 
	var right = Input.get_action_strength("ui_right")
	var left = Input.get_action_strength("ui_left")
	var up = Input.get_action_strength("ui_up")
	var down = Input.get_action_strength("ui_down")
	var x = right - left
	var y = up - down
	return Vector3(y * strength, 0, x * strength)


func _physics_process(delta) -> void:
	rb.add_torque(get_torque())


func _on_Area_body_entered(body):
	print("Reseting due to death")
	get_tree().reload_current_scene()
	pass # Replace with function body.
