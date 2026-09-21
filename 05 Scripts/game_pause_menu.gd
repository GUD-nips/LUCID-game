extends Control

@onready var timer = $pauseflashtimer
@onready var pausednotifiertext = $pausednotifier

# /////////////////////////////////////////////////////////////////////////////////////////////////

# Function to manage blinking pause notification text

func _on_pauseflashtimer_timeout() -> void:
	pausednotifiertext.visible = not pausednotifiertext.visible 
