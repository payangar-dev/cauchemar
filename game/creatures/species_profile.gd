class_name SpeciesProfile
extends Resource
## Biological profile shared by all individuals of a species.
##
## Aggregates one EmotionConfig per emotion. One .tres per species.
## Stimulus reactions will be added in a later issue.

@export var species_name: StringName = &"unnamed"

@export_group("Emotions")
@export var anger: EmotionConfig
@export var fear: EmotionConfig
@export var hunger: EmotionConfig
@export var energy: EmotionConfig
@export var territorial: EmotionConfig
@export var curiosity: EmotionConfig
