extends KinematicBody2D

export var move_speed = 5000
export var possessable = true
var possessed_by = null

func _ready():
	
	# actors need to be pickable to detect input events on them
	input_pickable = true
	
	connect("input_event", self, "_on_npc_input_event", [])

func _physics_process(delta):
	
	# if possessed, handle player input
	if possessed_by:
		var move_dir = Vector2()
		
		rotation = position.angle_to_point(possessed_by.camera.get_global_mouse_position()) - (PI/2)
		
		if Input.is_action_pressed("ui_up"):
			move_dir = Vector2(0,1).rotated(rotation + PI) * move_speed * delta
		
		move_and_slide(move_dir)
		possessed_by.camera.position = position
		
		if !move_dir: possessed_by.decrease_energy(delta * possessed_by.energy_idle)
		else: possessed_by.decrease_energy(delta * possessed_by.energy_move)
			


func _on_npc_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			Gamedata.parasite_controller.possess(self)
