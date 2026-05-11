extends PanelContainer
## Renders aggregated debug info for DebugHud.current_target.
##
## A "debug provider" is any child of the target that exposes both a
## `changed` signal and a `get_debug_lines() -> PackedStringArray` method.
## We use duck typing (no base class) so any feature can plug in without
## inheriting from a shared interface.

@onready var _label: Label = $Margin/Label

var _providers: Array[Node] = []

func _ready() -> void:
	DebugHud.toggled.connect(_on_debug_toggled)
	DebugHud.target_changed.connect(_on_target_changed)
	visible = DebugHud.active and not _providers.is_empty()
	_label.text = ""

func _on_debug_toggled(is_active: bool) -> void:
	if not is_active:
		_disconnect_providers()
		_label.text = ""
		visible = false

func _on_target_changed(target: Node3D) -> void:
	_disconnect_providers()
	if target == null:
		_label.text = ""
		visible = false
		return
	for child in target.get_children():
		if child.has_method(&"get_debug_lines") and child.has_signal(&"changed"):
			_providers.append(child)
			child.changed.connect(_refresh)
	_refresh()
	visible = not _providers.is_empty()

func _disconnect_providers() -> void:
	for p in _providers:
		if p.changed.is_connected(_refresh):
			p.changed.disconnect(_refresh)
	_providers.clear()

func _refresh() -> void:
	var target: Node3D = DebugHud.current_target
	if target == null:
		_label.text = ""
		return
	var lines := PackedStringArray()
	lines.append(target.name)
	for p in _providers:
		lines.append_array(p.get_debug_lines())
	_label.text = "\n".join(lines)
