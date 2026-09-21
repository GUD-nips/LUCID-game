extends Control

@onready var subonbutton = $MarginContainer/HBoxContainer/VBoxContainer3/HBoxContainer/subtitleson
@onready var suboffbutton = $MarginContainer/HBoxContainer/VBoxContainer3/HBoxContainer/subtitlesoff

# ////////////////////////////////////////////////////////////////////////////////////////////////

func _on_vol_slider_master_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_vol_slider_music_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_vol_slider_sfx_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_vol_slider_speech_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_sub_off_button_toggled(toggled_on: bool):
	pass


func _on_sub_on_button_toggled(toggled_on: bool):
	pass


func _on_return_pressed() -> void:
	globalsignals.optionsreturn.emit()

func _on_subtitleson_button_down() -> void:
	suboffbutton.button_pressed = not suboffbutton.button_pressed
	globalsignals.subtitleson.emit()

func _on_subtitlesoff_button_down() -> void:
	subonbutton.button_pressed = not subonbutton.button_pressed
	globalsignals.subtitleson.emit()
