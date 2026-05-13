extends CanvasLayer
## Global, in-game debug overlay. Autoload.
##
## Toggle with the `debug_toggle` input action (F3 by default). When active,
## a ray is cast every physics frame from the active camera's screen center;
## the first Node3D in the `debug_inspectable` group that it hits becomes
## `current_target`. Other features render their own info by listening to
## `target_changed`.
##
## Works with whichever Camera3D is currently active (player FPS, debug
## freecam, sandbox fixed cam) — DebugHud has no opinion on camera ownership.
##
## Stripped from release builds: the whole autoload self-frees when
## `OS.is_debug_build()` is false, so a packaged build never exposes
## per-entity state to the player (see CLAUDE.md rule #7 — knowledge is
## always incomplete).

signal toggled(active: bool)
signal target_changed(target: Node3D)

const TOGGLE_ACTION := &"debug_toggle"
const INSPECTABLE_GROUP := &"debug_inspectable"

@export_range(1.0, 50.0) var max_pick_distance: float = 12.0

var active: bool = false:
	set(value):
		if value == active:
			return
		active = value
		_marker.visible = active
		if not active:
			_set_target(null)
		toggled.emit(active)

var current_target: Node3D = null

@onready var _marker: CanvasItem = $Marker


func _ready() -> void:
	if not OS.is_debug_build():
		queue_free()
		return
	_marker.visible = active


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(TOGGLE_ACTION):
		active = not active


func _physics_process(_delta: float) -> void:
	if not active:
		return
	_set_target(_raycast_pick())


func _set_target(target: Node3D) -> void:
	if target == current_target:
		return
	current_target = target
	target_changed.emit(target)


func _raycast_pick() -> Node3D:
	var viewport := get_viewport()
	if viewport == null:
		return null
	var camera := viewport.get_camera_3d()
	if camera == null:
		return null
	var world := camera.get_world_3d()
	if world == null:
		return null
	var center := viewport.get_visible_rect().size * 0.5
	var origin := camera.project_ray_origin(center)
	var direction := camera.project_ray_normal(center)
	var query := PhysicsRayQueryParameters3D.create(origin, origin + direction * max_pick_distance)
	var hit := world.direct_space_state.intersect_ray(query)
	if hit.is_empty():
		return null
	var collider := hit.collider as Node3D
	if collider == null or not collider.is_in_group(INSPECTABLE_GROUP):
		return null
	return collider
