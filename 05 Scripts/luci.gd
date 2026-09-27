extends CharacterBody2D

# Preload cameras
@onready var lucicameranode: PackedScene = preload("res://04 TSCNs/luci_large_cam.tscn")
var cameratype = null
var lucicamera = null

# Movement handling variables
@export var speed = 250
var target = position

# /////////////////////////////////////////////////////////////////////////////////////////////////

# Function to assign camera type based on cameratype signal result
func _ready() -> void:
	pass

# Movement handling
func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 10:
		move_and_slide()

func camerasetter():
	if is_instance_valid(lucicamera):
		lucicamera.queue_free()
		
	if cameratype == globalenums.cameratypes.LUCI_LARGE:
		lucicamera = lucicameranode.instantiate()
		lucicamera.zoom = Vector2(0.3,0.3)
		add_child(lucicamera)
	elif cameratype == globalenums.cameratypes.LUCI_SMALL:
		lucicamera = lucicameranode.instantiate()
		lucicamera.zoom = Vector2(0.95,0.95)
		add_child(lucicamera)
