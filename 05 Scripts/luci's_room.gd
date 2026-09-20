extends Control

@onready var largecamera = load("res://04 TSCNs/luci_large_cam.tscn")
@onready var smallcamera = load("res://04 TSCNs/luci_small_cam.tscn")

var cameratype = null

func _ready() -> void:
	globalsignals.first_level_start.connect(first_level_luci_room)

func camerapicker():
	if cameratype == globalvariables.cameratypes.LUCI_LARGE:
		largecamera.instantiate()
	elif cameratype == globalvariables.cameratypes.LUCI_SMALL:
		smallcamera.instantiate()

func first_level_luci_room():
	cameratype = globalvariables.cameratypes.LUCI_LARGE
