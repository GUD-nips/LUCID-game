extends Control

@onready var mainmenu: PackedScene = preload("res://04 TSCNs/main_menu.tscn")
# @onready var openingcinematic = load("res://04 TSCNs/openingcinematic.tscn")
@onready var luciroom: PackedScene = preload("res://04 TSCNs/Luci's_Room.tscn")
@onready var optionsmenu: PackedScene = preload("res://04 TSCNs/game_options_menu.tscn")
@onready var loadgamemenu: PackedScene = preload("res://04 TSCNs/load_game_menu.tscn")
@onready var pausegamemenu: PackedScene = preload("res://04 TSCNs/game_pause_menu.tscn")
@onready var menucontainer = $menucontainer

var saveloadstate = null
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

# Useful general purpose functions

func clear_children_except(parent: Node, safenode: Node) -> void:
	# Kills all nodes in sceneloader except for the menu container
	for child in parent.get_children():
		if child != safenode:
			child.queue_free()

func clear_children(parent: Node):
	for child in parent.get_children():
		child.queue_free()

func reset_paused_state():
	if get_tree().paused:
		get_tree().paused = false

# Function run upon the ending of opening cinematic and exit to main menu to open the main menu and connect button signals.

func openmainmenu():
	mainmenuinstance = mainmenu.instantiate()
	menucontainer.add_child(mainmenuinstance)
	
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
		saveloadstate = globalenums.saveloadstate.LOADING_MODE
		_on_autosave_slot_used()
	else:
		return

func _on_load_menu_pressed():
	if mainmenuinstance != null:
		saveloadstate = globalenums.saveloadstate.LOADING_MODE
		mainmenuinstance.hide()
		loadgamemenuinstance = loadgamemenu.instantiate()
		menucontainer.add_child(loadgamemenuinstance)
	if pausegamemenuinstance != null:
		pausegamemenuinstance.hide()
		loadgamemenuinstance = loadgamemenu.instantiate()
		menucontainer.add_child(loadgamemenuinstance)
	if not globalsignals.loadgamemenureturn.is_connected(_on_game_load_menu_return_pressed):
		globalsignals.loadgamemenureturn.connect(_on_game_load_menu_return_pressed)
		
	if not globalsignals.autosaveloadslot.is_connected(_on_autosave_slot_used):
		globalsignals.autosaveloadslot.connect(_on_autosave_slot_used)
		
	if not globalsignals.saveloadslot1.is_connected(_on_pressed_slot_1):
		globalsignals.saveloadslot1.connect(_on_pressed_slot_1)
		
	if not globalsignals.saveloadslot2.is_connected(_on_pressed_slot_2):
		globalsignals.saveloadslot2.connect(_on_pressed_slot_2)
		
	if not globalsignals.saveloadslot3.is_connected(_on_pressed_slot_3):
		globalsignals.saveloadslot3.connect(_on_pressed_slot_3)
		
	if not globalsignals.saveloadslot4.is_connected(_on_pressed_slot_4):
		globalsignals.saveloadslot4.connect(_on_pressed_slot_4)
		
	if not globalsignals.saveloadslot5.is_connected(_on_pressed_slot_5):
		globalsignals.saveloadslot5.connect(_on_pressed_slot_5)
		
	if not globalsignals.saveloadslot6.is_connected(_on_pressed_slot_6):
		globalsignals.saveloadslot6.connect(_on_pressed_slot_6)
		
	if not globalsignals.saveloadslot7.is_connected(_on_pressed_slot_7):
		globalsignals.saveloadslot7.connect(_on_pressed_slot_7)
		
	if not globalsignals.saveloadslot9.is_connected(_on_pressed_slot_9):
		globalsignals.saveloadslot9.connect(_on_pressed_slot_9)
		
	if not globalsignals.saveloadslot9.is_connected(_on_pressed_slot_9):
		globalsignals.saveloadslot9.connect(_on_pressed_slot_9)
		
	if not globalsignals.saveloadslot10.is_connected(_on_pressed_slot_10):
		globalsignals.saveloadslot10.connect(_on_pressed_slot_10)
		
	if not globalsignals.saveloadslot10.is_connected(_on_pressed_slot_10):
		globalsignals.saveloadslot10.connect(_on_pressed_slot_10)

func _on_options_button_pressed():
	if mainmenuinstance != null:
		mainmenuinstance.hide()
	if pausegamemenuinstance != null:
		pausegamemenuinstance.hide()
	if not globalsignals.optionsreturn.is_connected(_on_options_return_pressed):
		globalsignals.optionsreturn.connect(_on_options_return_pressed)
	optionsmenuinstance = optionsmenu.instantiate()
	menucontainer.add_child(optionsmenuinstance)

func _on_exit_button_pressed():
	get_tree().quit()

# Functions to control the goings on in the game options menu

func _on_options_return_pressed():
	if mainmenuinstance != null:
		optionsmenuinstance.queue_free()
		for child in self.get_children():
			if "visible" in child:
				child.visible = true
		openmainmenu()
	elif pausegamemenuinstance != null:
		optionsmenuinstance.queue_free()
		pausegamemenuinstance.show()

# Functions to control the goings on in the game loader menu

func _on_game_load_menu_return_pressed():
	if globalsignals.loadgamemenureturn.is_connected(_on_game_load_menu_return_pressed):
		globalsignals.loadgamemenureturn.disconnect(_on_game_load_menu_return_pressed)
		
	if globalsignals.autosaveloadslot.is_connected(_on_autosave_slot_used):
		globalsignals.autosaveloadslot.disconnect(_on_autosave_slot_used)
		
	if globalsignals.saveloadslot1.is_connected(_on_pressed_slot_1):
		globalsignals.saveloadslot1.disconnect(_on_pressed_slot_1)
		
	if globalsignals.saveloadslot2.is_connected(_on_pressed_slot_2):
		globalsignals.saveloadslot2.disconnect(_on_pressed_slot_2)
		
	if globalsignals.saveloadslot3.is_connected(_on_pressed_slot_3):
		globalsignals.saveloadslot3.disconnect(_on_pressed_slot_3)
		
	if globalsignals.saveloadslot4.is_connected(_on_pressed_slot_4):
		globalsignals.saveloadslot4.disconnect(_on_pressed_slot_4)
		
	if globalsignals.saveloadslot5.is_connected(_on_pressed_slot_5):
		globalsignals.saveloadslot5.disconnect(_on_pressed_slot_5)
		
	if globalsignals.saveloadslot6.is_connected(_on_pressed_slot_6):
		globalsignals.saveloadslot6.disconnect(_on_pressed_slot_6)
		
	if globalsignals.saveloadslot7.is_connected(_on_pressed_slot_7):
		globalsignals.saveloadslot7.disconnect(_on_pressed_slot_7)
		
	if globalsignals.saveloadslot9.is_connected(_on_pressed_slot_9):
		globalsignals.saveloadslot9.disconnect(_on_pressed_slot_9)
		
	if globalsignals.saveloadslot9.is_connected(_on_pressed_slot_9):
		globalsignals.saveloadslot9.disconnect(_on_pressed_slot_9)
		
	if globalsignals.saveloadslot10.is_connected(_on_pressed_slot_10):
		globalsignals.saveloadslot10.disconnect(_on_pressed_slot_10)
		
	if globalsignals.saveloadslot10.is_connected(_on_pressed_slot_10):
		globalsignals.saveloadslot10.disconnect(_on_pressed_slot_10)
		
	if mainmenuinstance != null:
		loadgamemenuinstance.queue_free()
		mainmenuinstance.show()
	elif pausegamemenuinstance != null:
		loadgamemenuinstance.queue_free()
		pausegamemenuinstance.show()

# Functions to operate the save/load slots and interchange the images used for them

func _on_autosave_slot_used():
	if saveloadstate == globalenums.saveloadstate.SAVING_MODE:
		pass
	elif saveloadstate == globalenums.saveloadstate.LOADING_MODE:
		pass
func _on_pressed_slot_1():
	if saveloadstate == globalenums.saveloadstate.SAVING_MODE:
		pass
	elif saveloadstate == globalenums.saveloadstate.LOADING_MODE:
		pass
func _on_pressed_slot_2():
	if saveloadstate == globalenums.saveloadstate.SAVING_MODE:
		pass
	elif saveloadstate == globalenums.saveloadstate.LOADING_MODE:
		pass
func _on_pressed_slot_3():
	if saveloadstate == globalenums.saveloadstate.SAVING_MODE:
		pass
	elif saveloadstate == globalenums.saveloadstate.LOADING_MODE:
		pass
func _on_pressed_slot_4():
	if saveloadstate == globalenums.saveloadstate.SAVING_MODE:
		pass
	elif saveloadstate == globalenums.saveloadstate.LOADING_MODE:
		pass
func _on_pressed_slot_5():
	if saveloadstate == globalenums.saveloadstate.SAVING_MODE:
		pass
	elif saveloadstate == globalenums.saveloadstate.LOADING_MODE:
		pass
func _on_pressed_slot_6():
	if saveloadstate == globalenums.saveloadstate.SAVING_MODE:
		pass
	elif saveloadstate == globalenums.saveloadstate.LOADING_MODE:
		pass
func _on_pressed_slot_7():
	if saveloadstate == globalenums.saveloadstate.SAVING_MODE:
		pass
	elif saveloadstate == globalenums.saveloadstate.LOADING_MODE:
		pass
func _on_pressed_slot_8():
	if saveloadstate == globalenums.saveloadstate.SAVING_MODE:
		pass
	elif saveloadstate == globalenums.saveloadstate.LOADING_MODE:
		pass
func _on_pressed_slot_9():
	if saveloadstate == globalenums.saveloadstate.SAVING_MODE:
		pass
	elif saveloadstate == globalenums.saveloadstate.LOADING_MODE:
		pass
func _on_pressed_slot_10():
	if saveloadstate == globalenums.saveloadstate.SAVING_MODE:
		pass
	elif saveloadstate == globalenums.saveloadstate.LOADING_MODE:
		pass
func _on_pressed_slot_11():
	if saveloadstate == globalenums.saveloadstate.SAVING_MODE:
		pass
	elif saveloadstate == globalenums.saveloadstate.LOADING_MODE:
		pass


# Functions to control the game pause menu, and the goings on in the game pause menu

func _input(event):
	if event.is_action_pressed("Pause"):
		print("pause has been pressed")
		toggle_pause_menu()

func toggle_pause_menu():
	if is_instance_valid(optionsmenuinstance):
		_on_options_return_pressed()
		return
	if is_instance_valid(mainmenuinstance) and is_instance_valid(loadgamemenuinstance):
		_on_game_load_menu_return_pressed()
		return
	if is_instance_valid(loadgamemenuinstance):
		_on_game_load_menu_return_pressed()
		return
	if is_instance_valid(mainmenuinstance) and not is_instance_valid(loadgamemenuinstance):
		return
	
	if get_tree().paused != true:
		pausegamemenuinstance = pausegamemenu.instantiate()
		menucontainer.add_child(pausegamemenuinstance)
		get_tree().paused = !get_tree().paused
		# Button signal connection for pause menu
		globalsignals.pauseresume.connect(_pause_resume_button)
		globalsignals.pauseoptions.connect(_pause_options_button)
		globalsignals.pausesavegame.connect(_pause_savegame_button)
		globalsignals.pauseloadgame.connect(_pause_loadgame_button)
		globalsignals.pausesaveandquit.connect(_pause_saveandquit_button)
	elif get_tree().paused == true and is_instance_valid(pausegamemenuinstance):
		pausegamemenuinstance.queue_free()
		get_tree().paused = !get_tree().paused
		globalsignals.pauseresume.disconnect(_pause_resume_button)
		globalsignals.pauseoptions.disconnect(_pause_options_button)
		globalsignals.pausesavegame.disconnect(_pause_savegame_button)
		globalsignals.pauseloadgame.disconnect(_pause_loadgame_button)
		globalsignals.pausesaveandquit.disconnect(_pause_saveandquit_button)

# Pause menu buttons

func _pause_resume_button():
	toggle_pause_menu()

func _pause_options_button():
	_on_options_button_pressed()

func _pause_savegame_button():
	_on_load_menu_pressed()
	saveloadstate = globalenums.saveloadstate.SAVING_MODE

func _pause_loadgame_button():
	_on_load_menu_pressed()
	saveloadstate = globalenums.saveloadstate.LOADING_MODE

func _pause_saveandquit_button():
	clear_children_except(self, menucontainer)
	clear_children(menucontainer)
	reset_paused_state()
	openmainmenu()

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
