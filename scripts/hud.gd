extends CanvasLayer

@onready var help_counter = $HelpCounter
@onready var speed_boost_label = $SpeedBoost
@onready var shadow_warning = $ShadowWarning

func _ready():
	SignalManager.help_count_updated.connect(_on_help_count_updated)
	SignalManager.speed_boost_started.connect(_on_speed_boost_started)
	SignalManager.speed_boost_ended.connect(_on_speed_boost_ended)
	SignalManager.shadow_near.connect(_on_shadow_near)
	SignalManager.shadow_far.connect(_on_shadow_far)
	_update_help_counter(GameManager.help_count)

func _update_help_counter(count: int):
	help_counter.text = "HELPED: " + str(count) + " / 4"

func _on_help_count_updated(count: int):
	_update_help_counter(count)

func _on_speed_boost_started():
	speed_boost_label.show()

func _on_speed_boost_ended():
	speed_boost_label.hide()

func _on_shadow_near():
	shadow_warning.show()

func _on_shadow_far():
	shadow_warning.hide()
