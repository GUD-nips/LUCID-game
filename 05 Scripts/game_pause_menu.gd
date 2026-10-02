extends Control

@onready var timer = $pauseflashtimer
@onready var pausednotifiertext = $pausednotifier

# /////////////////////////////////////////////////////////////////////////////////////////////////

# Function to manage blinking pause notification text

func _on_pauseflashtimer_timeout() -> void:
	pausednotifiertext.visible = not pausednotifiertext.visible 


func _on_pauseresume_pressed() -> void:
	globalsignals.pauseresume.emit()


func _on_pauseoptions_pressed() -> void:
	globalsignals.pauseoptions.emit()


func _on_pausesavegame_pressed() -> void:
	globalsignals.pausesavegame.emit()


func _on_pauseloadgame_pressed() -> void:
	globalsignals.pauseloadgame.emit()


func _on_pausesaveandquit_pressed() -> void:
	globalsignals.pausesaveandquit.emit()
