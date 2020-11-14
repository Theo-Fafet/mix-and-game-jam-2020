extends Spatial
class_name Rotor

enum Axis {X, Y, Z}

export(Axis) var axis = Axis.Y
export(float) var angular_velocity : float = 1


func _physics_process(delta):
	if (axis == Axis.X): rotate_x(angular_velocity * delta)
	elif (axis == Axis.Y): rotate_y(angular_velocity * delta)
	elif (axis == Axis.Z): rotate_z(angular_velocity * delta)
