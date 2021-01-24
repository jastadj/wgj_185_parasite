extends Node2D

var parasite_controller = null
var start_position = null

# common level script inherited by each level
func _ready():
	
	# find the player start position in the level
	for c in get_children():
		if c.name == "start_position":
			start_position = c.position
			print(start_position)
			break
	
	if start_position == null:
		print("!!!ERROR COULD NOT FIND LEVEL START POSITION!!!")
	
	# spawn parasite controller
	parasite_controller = preload("res://objects/actors/parasite_controller.gd").new()
	parasite_controller.name = "parasite_controller"
	add_child(parasite_controller)
	Gamedata.parasite_controller = parasite_controller

	# spawn parasite at start position
	var new_parasite = spawn_parasite(start_position)
	parasite_controller.possess(new_parasite)
	
func spawn_parasite(pos):
	var new_parasite = preload("res://objects/actors/parasite/parasite.tscn").instance()
	add_child(new_parasite)
	new_parasite.position = pos
	return new_parasite
