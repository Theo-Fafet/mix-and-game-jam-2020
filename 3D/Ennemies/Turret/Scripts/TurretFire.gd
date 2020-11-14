extends Spatial

export(NodePath) var timerPath : NodePath
export(float) var fire_rate = 1
export(float) var bullet_speed = 1

var bulletPacked = preload("res://3D/Ennemies/Bullet/Nodes/Bullet.tscn")

func _ready() -> void:
	(get_node(timerPath) as Timer).wait_time = fire_rate

func _on_Timer_timeout() -> void:
	shoot()

func shoot() -> void:
	var bullet = bulletPacked.instance();
	bullet.velocity = bullet_speed * transform.basis.z
	call_deferred("add_child", bullet)
