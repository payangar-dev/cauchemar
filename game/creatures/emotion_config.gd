class_name EmotionConfig
extends Resource
## Per-emotion biological parameters for a species.
##
## `initial` is the starting value when a creature spawns. `rest_target` is
## the equilibrium the emotion drifts toward in the absence of stimuli.
## `decay_rate` is the convergence speed in units per second.

@export_range(0.0, 100.0) var initial: float = 0.0
@export_range(0.0, 100.0) var rest_target: float = 0.0
@export_range(0.0, 10.0) var decay_rate: float = 1.0
