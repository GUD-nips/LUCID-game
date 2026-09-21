extends Control

var selectedcamera = null

# Preload characters
@onready var lucipackedscene: PackedScene = preload("res://04 TSCNs/luci.tscn")
@onready var svenpackedscene: PackedScene = preload("res://04 TSCNs/Sven.tscn")

var luci = null
var sven = null
var scenetype = null

# Preload objects and identifiers
@onready var lucilargespawn = $lucilargespawn
@onready var lucismallspawn = $lucismallspawn
@onready var svenspawn = $svenspawn

# /////////////////////////////////////////////////////////////////////////////////////////////////

func _ready() -> void:
	if scenetype == globalenums.cameratypes.LUCI_LARGE:
		add_pc_luci()
		add_pc_sven()
		luci.global_position = lucilargespawn.global_position
		sven.global_position = svenspawn.global_position
		luci.cameratype = globalenums.cameratypes.LUCI_LARGE
	elif scenetype == globalenums.cameratypes.LUCI_SMALL:
		add_pc_luci()
		luci.global_position = lucismallspawn.global_position
		luci.cameratype = globalenums.cameratypes.LUCI_SMALL

# Functions to handle creation of characters within scene
func add_pc_luci():
	globalsignals.luci_pc_deploy.emit()
	luci = lucipackedscene.instantiate()
	add_child(luci)

func add_pc_sven():
	globalsignals.sven_pc_deploy.emit()
	sven = svenpackedscene.instantiate()
	add_child(sven)
