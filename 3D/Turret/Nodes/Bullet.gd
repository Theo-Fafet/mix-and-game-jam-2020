extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var rb: RigidBody = $"BulletRB"
onready var direction: Vector3 = Vector3(0,0,-1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rb.set_linear_velocity(direction)


func _on_BulletRB_body_entered(body):
	print("Reseting due to death by bullet")
	get_tree().reload_current_scene()

