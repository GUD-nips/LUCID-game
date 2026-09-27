extends Control
@onready var mainmenu: PackedScene = preload("res://04 TSCNs/main_menu.tscn")
# @onready var openingcinematic = load("res://04 TSCNs/openingcinematic.tscn")
@onready var luciroom: PackedScene = preload("res://04 TSCNs/Luci's_Room.tscn")
@onready var optionsmenu: PackedScene = preload("res://04 TSCNs/game_options_menu.tscn")
@onready var loadgamemenu: PackedScene = preload("res://04 TSCNs/load_game_menu.tscn")
@onready var pausegamemenu: PackedScene = preload("res://04 TSCNs/game_pause_menu.tscn")

var mainmenuinstance = null
var optionsmenuinstance = null
var loadgamemenuinstance = null
var pausegamemenuinstance = null
var currentlevelinstance = null

# /////////////////////////////////////////////////////////////////////////////////////////////////

# Code to manage opening cinematic
func _ready() -> void:
	# openingcinematic.instantiate()
	# openingcinematic.play()
	
	openmainmenu()

# Physics process, includes code to operate the pause menu during gameplay

# Function run upon the ending of opening cinematic and exit to main menu to open the main menu and connect button signals.
func openmainmenu():
	mainmenuinstance = mainmenu.instantiate()
	add_child(mainmenuinstance)
	
	if not globalsignals.newgame.is_connected(_on_new_game_button_pressed):
		globalsignals.newgame.connect(_on_new_game_button_pressed)
		
	if not globalsignals.continuegame.is_connected(_on_continue_pressed):
		globalsignals.continuegame.connect(_on_continue_pressed)
		
	if not globalsignals.loadgame.is_connected(_on_load_menu_pressed):
		globalsignals.loadgame.connect(_on_load_menu_pressed)
		
	if not globalsignals.options.is_connected(_on_options_button_pressed):
		globalsignals.options.connect(_on_options_button_pressed)
		
	if not globalsignals.exit.is_connected(_on_exit_button_pressed):
		globalsignals.exit.connect(_on_exit_button_pressed)

# Functions to control the goings on in the main menu

func _on_new_game_button_pressed():
	if mainmenuinstance != null:
		mainmenuinstance.queue_free()
		
	first_game_scene()

func _on_continue_pressed():
	if mainmenuinstance != null:
		mainmenuinstance.queue_free()

func _on_load_menu_pressed():
	if mainmenuinstance != null:
		mainmenuinstance.hide()
		loadgamemenuinstance = loadgamemenu.instantiate()
		add_child(loadgamemenuinstance)
	if not globalsignals.loadgamemenureturn.is_connected(_on_game_load_menu_return_pressed):
		globalsignals.loadgamemenureturn.connect(_on_game_load_menu_return_pressed)

func _on_options_button_pressed():
	if mainmenuinstance != null:
		mainmenuinstance.hide()
		optionsmenuinstance = optionsmenu.instantiate()
		add_child(optionsmenuinstance)
	if not globalsignals.optionsreturn.is_connected(_on_options_return_pressed):
		globalsignals.optionsreturn.connect(_on_options_return_pressed)

func _on_exit_button_pressed():
	get_tree().quit()

# Functions to control the goings on in the game options menu

func _on_options_return_pressed():
	if mainmenuinstance != null:
		optionsmenuinstance.queue_free()
		for child in self.get_children():
			if "visible" in child:
				child.visible = true

# Functions to control the goings on in the game loader menu

func _on_game_load_menu_return_pressed():
	if mainmenuinstance != null:
		loadgamemenuinstance.queue_free()
		for child in self.get_children():
			if "visible" in child:
				child.visible = true

# Functions to control the game pause menu, and the goings on in the game pause menu

func _input(event):
	if event.is_action_pressed("Pause"):
		print("pause has been pressed")
		toggle_pause_menu()

func toggle_pause_menu():
		if get_tree().paused != true and is_instance_valid(mainmenuinstance) != true:
			pausegamemenuinstance = pausegamemenu.instantiate()
			add_child(pausegamemenuinstance)
			get_tree().paused = !get_tree().paused
		elif get_tree().paused == true and is_instance_valid(pausegamemenuinstance):
			pausegamemenuinstance.queue_free()
			get_tree().paused = !get_tree().paused




# Functions to handle the loading and unloading of gamescreens

func first_game_scene():
	globalsignals.first_level_start.emit()
	currentlevelinstance = luciroom.instantiate()
	currentlevelinstance.scenetype = globalenums.cameratypes.LUCI_LARGE
	add_child(currentlevelinstance)

func second_game_scene():
	globalsignals.second_level_start.emit()
	currentlevelinstance = luciroom.instantiate()
	currentlevelinstance.scenetype = globalenums.cameratypes.LUCI_SMALL
	add_child(currentlevelinstance)
