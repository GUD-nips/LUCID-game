extends MarginContainer

# Universal signal emission for main menu buttons regardless of instance
func _on_new_game_button_pressed() -> void:
	globalsignals.newgame.emit()
func _on_continue_pressed() -> void:
	globalsignals.continuegame.emit()
func _on_load_menu_pressed() -> void:
	globalsignals.loadmenu.emit()
func _on_options_button_pressed() -> void:
	globalsignals.options.emit()
func _on_exit_button_pressed() -> void:
	globalsignals.exit.emit()
