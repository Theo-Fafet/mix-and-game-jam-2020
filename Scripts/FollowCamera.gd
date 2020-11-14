extends Camera
class_name FollowCamera

export(NodePath) var targetPath: NodePath
export(bool) var use_initial_offset: bool = true
export(Vector3) var offset: Vector3 = Vector3(0, 0, 0)
export(float) var smoothing: float = 1

var target : Spatial

func _enter_tree() -> void:
	target = get_node(targetPath)
	if (target != null && use_initial_offset):
		offset = translation - target.translation

func _process(delta) -> void:
	if (target != null):
		translation = lerp(translation, target.translation + offset, smoothing * delta)
