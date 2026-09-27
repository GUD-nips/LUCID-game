extends Control


func _on_returntoprevious_pressed() -> void:
	globalsignals.loadgamemenureturn.emit()
