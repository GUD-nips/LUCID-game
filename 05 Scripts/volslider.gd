extends HSlider

@export var bus_name: String
var bus_index: int

func _ready() -> void:
	# Find the audio bus index by name (e.g., "Master", "Music", "SFX")
	bus_index = AudioServer.get_bus_index(bus_name)
	
	# Set the initial slider position to match the current bus volume
	var current_db = AudioServer.get_bus_volume_db(bus_index)
	value = db_to_linear(current_db)
	
	# Connect the signal when the slider moves
	value_changed.connect(_on_value_changed)

func _on_value_changed(slider_value: float) -> void:
	# Convert linear slider (0.0 to 1.0) to decibels (-80 dB to 0+ dB)
	if slider_value <= 0.0:
		AudioServer.set_bus_volume_db(bus_index, -80.0) # Effectively mute
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(slider_value))
