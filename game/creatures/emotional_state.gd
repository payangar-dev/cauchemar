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


func _ready() -> void:
	for e in Emotion.ALL:
		_values[e] = _config(e).initial if profile != null else 0.0


func _process(delta: float) -> void:
	if profile == null:
		return
	for e in Emotion.ALL:
		var cfg := _config(e)
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


func _config(emotion: int) -> EmotionConfig:
	var result: EmotionConfig
	match emotion:
		Emotion.ANGER:
			result = profile.anger
		Emotion.FEAR:
			result = profile.fear
		Emotion.HUNGER:
			result = profile.hunger
		Emotion.ENERGY:
			result = profile.energy
		Emotion.TERRITORIAL:
			result = profile.territorial
		Emotion.CURIOSITY:
			result = profile.curiosity
		_:
			assert(false, "unknown emotion: %d" % emotion)
	return result
