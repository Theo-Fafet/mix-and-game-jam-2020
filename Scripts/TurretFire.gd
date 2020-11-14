extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var bulletPacked = preload("res://3D/Turret/Nodes/Bullet.tscn")
export(int) var num_bullets = 1
export(float) var fire_rate = 1
export(float) var bullet_speed = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = fire_rate
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):	
#	pass

func _on_Timer_timeout():
	print(global_transform.basis.x)
	print("fire!")
	spawn_bullet()
	pass # Replace with function body.


func spawn_bullet():
	var bullet = bulletPacked.instance();
	bullet.direction = bullet_speed * global_transform.basis.x
	#bullet.tra(get_global_transform().origin)
	call_deferred("add_child",bullet)
