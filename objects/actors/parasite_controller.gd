extends Node

var possessing = null
var camera = null

func _ready():
	
	camera = Camera2D.new()
	camera.zoom = Vector2(0.5,0.5)
	camera.current = true
	add_child(camera)
	

func _input(event):
	
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func possess(target):
	print("attempting to posses ",target.name)
	if !target.possessable: return
	if possessing: release_possession()
	
	possessing = target
	target.possessed_by = self
	
func release_possession():
	if !possessing: return
	possessing.possessed_by = null
	possessing = null
