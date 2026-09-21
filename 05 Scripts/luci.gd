extends CharacterBody2D

# Preload cameras
@onready var largecamera: PackedScene = preload("res://04 TSCNs/luci_large_cam.tscn")
@onready var smallcamera: PackedScene = preload("res://04 TSCNs/luci_small_cam.tscn")
var cameratype = null
var selectedcamera = null

# Movement handling variables
@export var speed = 250
var target = position

# /////////////////////////////////////////////////////////////////////////////////////////////////

# Function to assign camera type based on cameratype signal result
func _ready() -> void:
	if cameratype == globalenums.cameratypes.LUCI_LARGE:
		selectedcamera = largecamera.instantiate()
		add_child(selectedcamera)
	elif cameratype == globalenums.cameratypes.LUCI_SMALL:
		selectedcamera = smallcamera.instantiate()
		add_child(selectedcamera)

# Movement handling
func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 10:
		move_and_slide()
