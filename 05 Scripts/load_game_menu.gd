extends Control


func _on_returntoprevious_pressed() -> void:
	globalsignals.loadgamemenureturn.emit()


func _on_autosaveslot_pressed() -> void:
	globalsignals.saveloadslot1.emit()


func _on_saveslot_2_pressed() -> void:
	globalsignals.saveloadslot2.emit()


func _on_saveslot_3_pressed() -> void:
	globalsignals.saveloadslot3.emit()


func _on_saveslot_4_pressed() -> void:
	globalsignals.saveloadslot4.emit()


func _on_saveslot_5_pressed() -> void:
	globalsignals.saveloadslot5.emit()


func _on_saveslot_6_pressed() -> void:
	globalsignals.saveloadslot6.emit()


func _on_saveslot_7_pressed() -> void:
	globalsignals.saveloadslot7.emit()


func _on_saveslot_8_pressed() -> void:
	globalsignals.saveloadslot8.emit()


func _on_saveslot_9_pressed() -> void:
	globalsignals.saveloadslot9.emit()


func _on_saveslot_10_pressed() -> void:
	globalsignals.saveloadslot10.emit()


func _on_saveslot_11_pressed() -> void:
	globalsignals.saveloadslot11.emit()


func _on_saveslot_12_pressed() -> void:
	globalsignals.saveloadslot12.emit()
