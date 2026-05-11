class_name EmotionDebugProvider
extends Node
## Surfaces an EmotionalState to the global debug HUD.
##
## Implements the duck-typed debug provider interface expected by DebugPanel:
## a `changed` signal and a `get_debug_lines() -> PackedStringArray` method.
##
## EmotionalState.emotion_changed fires very often during decay (potentially
## every frame). We coalesce those into one `changed` emission per
## MIN_INTERVAL so the panel only rebuilds at a sensible cadence.
##
## `state` is wired by the owning Animal in its _ready() — not by an @export,
## because Godot does not resolve `NodePath` literals into typed Node refs
## from TSCN. The setter handles signal (re)connection so the state can be
## swapped at runtime.

signal changed

const MIN_INTERVAL_MSEC: int = 100

var state: EmotionalState:
	set(value):
		if state == value:
			return
		if state != null and state.emotion_changed.is_connected(_on_emotion_changed):
			state.emotion_changed.disconnect(_on_emotion_changed)
		state = value
		if state != null:
			state.emotion_changed.connect(_on_emotion_changed)

var _dirty: bool = false
var _last_emit_msec: int = 0


func _process(_delta: float) -> void:
	if not _dirty:
		return
	var now := Time.get_ticks_msec()
	if now - _last_emit_msec < MIN_INTERVAL_MSEC:
		return
	_dirty = false
	_last_emit_msec = now
	changed.emit()


func get_debug_lines() -> PackedStringArray:
	var lines := PackedStringArray()
	lines.append("[Emotions]")
	if state == null:
		lines.append("  (no state)")
		return lines
	for e in Emotion.ALL:
		lines.append("  %s: %.1f" % [Emotion.NAMES[e], state.get_emotion(e)])
	return lines


func _on_emotion_changed(_emotion: int, _old: float, _new: float) -> void:
	_dirty = true
