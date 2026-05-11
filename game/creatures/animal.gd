class_name Animal
extends StaticBody3D
## Base class for instinct-driven fauna.
##
## Inherits StaticBody3D so the creature can be picked by the debug raycast
## and, later, by player interactions. Owns and wires its components
## (EmotionalState, EmotionDebugProvider) — sub-components do not look each
## other up. See docs/07_faune/07a_especes_animales.md.

@onready var emotions: EmotionalState = $EmotionalState
@onready var _debug_provider: EmotionDebugProvider = $EmotionDebugProvider

func _ready() -> void:
	add_to_group(&"debug_inspectable")
	_debug_provider.state = emotions
