extends Spatial
class_name BallController

export(float) var strength = 1

onready var rb: RigidBody = $"BallRB" as RigidBody

func get_torque() -> Vector3: 
	var right = Input.get_action_strength("ui_right")
	var left = Input.get_action_strength("ui_left")
	var up = Input.get_action_strength("ui_up")
	var down = Input.get_action_strength("ui_down")
	var x = right - left
	var y = up - down
	return Vector3(y * strength, 0, x * strength)


func _physics_process(_delta : float) -> void:
	rb.add_torque(get_torque())

func restart() -> void:
	var error = get_tree().reload_current_scene()
	if (error):
		printerr(error)


func _on_BallRB_body_entered(body : PhysicsBody):
	if (body.collision_layer & 4 != 0):
		restart()
