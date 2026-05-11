class_name Emotion
extends RefCounted
## The six emotional variables that drive animal AI.
##
## Namespace-like class. Use `Emotion.ANGER` etc. as indices, iterate via
## `Emotion.ALL`, and display via `Emotion.NAMES`. The values themselves live
## in EmotionalState. See docs/07_faune/07a_especes_animales.md §Architecture IA.

enum { ANGER, FEAR, HUNGER, ENERGY, TERRITORIAL, CURIOSITY }

const ALL: Array[int] = [ANGER, FEAR, HUNGER, ENERGY, TERRITORIAL, CURIOSITY]

const NAMES: Dictionary[int, String] = {
	ANGER: "Anger",
	FEAR: "Fear",
	HUNGER: "Hunger",
	ENERGY: "Energy",
	TERRITORIAL: "Territorial",
	CURIOSITY: "Curiosity",
}
