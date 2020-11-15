extends Spatial
class_name BallController

export(float) var strength:float = 1
var brokenPacked: PackedScene = preload("res://3D/Ball/Nodes/BrokenBall.tscn")

onready var rb: RigidBody = $"BallRB" as RigidBody

signal on_break;

func _init():
	randomize()

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

func shatter() -> void:
	emit_signal("on_break")
	var broken = brokenPacked.instance()
	get_parent().add_child(broken)
	broken.transform = rb.transform
	($Camera as FollowCamera).target = null
	for p in broken.get_children():
		p=p as RigidBody
		p.linear_velocity = Vector3(randf()*2-1, 1, randf()*2-1)*2
		p.collision_layer = rb.collision_layer
		p.collision_mask = rb.collision_mask
	
	set_physics_process(false)
	rb.queue_free()
	
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "restart")
	timer.start()
	
func restart() -> void:
	var error = get_tree().reload_current_scene()
	if (error):
		printerr(error)


func _on_BallRB_body_entered(body : PhysicsBody):
	if (body.collision_layer & 4 != 0):
		shatter()
