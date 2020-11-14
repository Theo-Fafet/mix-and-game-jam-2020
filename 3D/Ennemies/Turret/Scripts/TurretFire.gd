extends Spatial

export(float) var fire_rate = 1
export(float) var bullet_speed = 1

var bulletPacked = preload("res://3D/Ennemies/Bullet/Nodes/Bullet.tscn")

func _ready() -> void:
	$Timer.wait_time = fire_rate

func _on_Timer_timeout() -> void:
	print("shoot")
	shoot()

func shoot() -> void:
	var bullet = bulletPacked.instance();
	bullet.velocity = bullet_speed * $TurretBase/TurretProbe.transform.basis.z
	bullet.translation = $TurretBase/TurretProbe.translation + $TurretBase/TurretProbe.transform.basis.z/2
	call_deferred("add_child", bullet)
