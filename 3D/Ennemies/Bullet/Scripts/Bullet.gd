extends Spatial
class_name Bullet

onready var rb : RigidBody = $"BulletRB"

var velocity : Vector3
export (float) var timeout = 20

func _on_ready():
	$Timer.wait_time=timeout

func _physics_process(delta : float) -> void:
	rb.translation += velocity * delta

func _on_BulletRB_body_entered(_body : PhysicsBody):
	queue_free()


func _on_Timer_timeout():
	queue_free()
