extends Control

@onready var subonbutton = $MarginContainer/labelsandslidershbox/slidersvbox/subbuttonshbox/subtitleson
@onready var suboffbutton = $MarginContainer/labelsandslidershbox/slidersvbox/subbuttonshbox/subtitlesoff

# ////////////////////////////////////////////////////////////////////////////////////////////////

func _on_return_pressed() -> void:
	globalsignals.optionsreturn.emit()

func _on_subtitleson_button_down() -> void:
	suboffbutton.button_pressed = not suboffbutton.button_pressed
	globalsignals.subtitleson.emit()

func _on_subtitlesoff_button_down() -> void:
	subonbutton.button_pressed = not subonbutton.button_pressed
	globalsignals.subtitleson.emit()
