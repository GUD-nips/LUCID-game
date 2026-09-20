extends Control
@onready var mainmenu = load("res://04 TSCNs/Lucid_Menu.tscn")
@onready var openingcinematic = load("res://04 TSCNs/openingcinematic.tscn")


func _ready() -> void:
	openingcinematic.instantiate()
	openingcinematic.play()
pass

func endcinematic():
	mainmenu.instantiate()
	globalsignals.newgame.connect(_on_new_game_button_pressed)
	globalsignals.continuegame.connect(_on_continue_pressed)
	globalsignals.loadmenu.connect(_on_load_menu_pressed)
	globalsignals.options.connect(_on_options_button_pressed)
	globalsignals.exit.connect(_on_exit_button_pressed)
pass
func _on_new_game_button_pressed():
	pass
func _on_continue_pressed():
	pass
func _on_load_menu_pressed():
	pass
func _on_options_button_pressed():
	pass
func _on_exit_button_pressed():
	get_tree().quit()

func first_game_scene():
	globalsignals.first_level_start.emit()
	
