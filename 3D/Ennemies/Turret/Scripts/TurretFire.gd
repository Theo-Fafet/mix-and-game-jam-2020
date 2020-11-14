extends Spatial

class_name Turret

export(float) var fire_rate = 1
export(float) var bullet_speed = 1

var bulletPacked = preload("res://3D/Ennemies/Bullet/Nodes/Bullet.tscn")

func _ready() -> void:
	$Timer.wait_time = fire_rate

func _on_Timer_timeout() -> void:

	shoot()

func shoot() -> void:
	var bullet = bulletPacked.instance();
	bullet.velocity = bullet_speed * $TurretBase/TurretProbe.transform.basis.z
	bullet.translation = $TurretBase/TurretProbe.translation + $TurretBase/TurretProbe.transform.basis.z/2
	call_deferred("add_child", bullet)
	
func rotate(axis:Vector3,angle: float) -> void:
	$TurretBase/TurretProbe.transform.basis = $TurretBase/TurretProbe.transform.basis.rotated(axis, angle)

func look_at(target:Vector3, up:Vector3)-> void:
	$TurretBase/TurretProbe.look_at_from_position($TurretBase/TurretProbe.global_transform.origin,target,up)
	pass
	