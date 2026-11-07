extends ProgressBar

func _ready() -> void:
	EventBus.player_hp_changed.connect(
		func(payload : EventBus.PlayerHPChangedPayload):
			self.value = payload.hp
			self.max_value = payload.max_hp
	)
