class_name EmotionalState
extends Node
## Runtime emotional state of a single creature.
##
## Holds six values (0-100), seeded from the SpeciesProfile's `initial` and
## decaying toward `rest_target` at `decay_rate` units per second. External
## callers push deltas via adjust(); decay is automatic.

signal emotion_changed(emotion: int, old_value: float, new_value: float)

@export var profile: SpeciesProfile

var _values: Dictionary[int, float] = {}
var _configs: Array[EmotionConfig] = []


func _ready() -> void:
	_cache_configs()
	for e in Emotion.ALL:
		_values[e] = _configs[e].initial if profile != null else 0.0


func _process(delta: float) -> void:
	if profile == null:
		return
	for e in Emotion.ALL:
		var cfg := _configs[e]
		_apply(e, move_toward(_values[e], cfg.rest_target, cfg.decay_rate * delta))


func get_emotion(emotion: int) -> float:
	return _values[emotion]


func adjust(emotion: int, amount: float) -> void:
	_apply(emotion, _values[emotion] + amount)


func _apply(emotion: int, value: float) -> void:
	var old: float = _values[emotion]
	value = clampf(value, 0.0, 100.0)
	if is_equal_approx(old, value):
		return
	_values[emotion] = value
	emotion_changed.emit(emotion, old, value)


# Emotion enum values are contiguous 0..N, so an Array indexed by the enum is
# a per-frame branch cheaper than a match. Resolved once at spawn — profile is
# not expected to be hot-swapped at runtime.
func _cache_configs() -> void:
	_configs.resize(Emotion.ALL.size())
	if profile == null:
		return
	_configs[Emotion.ANGER] = profile.anger
	_configs[Emotion.FEAR] = profile.fear
	_configs[Emotion.HUNGER] = profile.hunger
	_configs[Emotion.ENERGY] = profile.energy
	_configs[Emotion.TERRITORIAL] = profile.territorial
	_configs[Emotion.CURIOSITY] = profile.curiosity
