extends Spatial

var velocity = Vector3()
export (float) var speed : float = 0.5
export (float) var orientation : float = 1 
export (float) var timer : float = 1

func _on_ready():
	$Timer.wait_time = timer;
	pass

func get_input():
	velocity = Vector3()
	velocity.y += orientation
	velocity = velocity.normalized() * speed

	

func _physics_process(delta):
	get_input()
	translation += velocity * delta


func _on_Timer_timeout():
	orientation = -orientation
