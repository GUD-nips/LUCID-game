extends Control

@onready var subonbutton = $SoundSettingsMenu/SoundMenuSplitVBOX/SubtitlesSettingsVBOX/SubtitlesSettingsHBOX/SubtitlesSettingsVBOX/SubtitlesButtonsHBOX/SubOnButton
@onready var suboffbutton = $SoundSettingsMenu/SoundMenuSplitVBOX/SubtitlesSettingsVBOX/SubtitlesSettingsHBOX/SubtitlesSettingsVBOX/SubtitlesButtonsHBOX/SubOffButton

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
