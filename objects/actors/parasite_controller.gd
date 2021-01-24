extends Node

var possessing = null
var camera = null
var energy = 100
var max_energy = 100
var energy_move = 1.0 # how much energy is consumed by movement
var energy_idle = 0.0 # how much energy is consumed while idle

var mainui
var energy_bar

func _ready():
	
	camera = Camera2D.new()
	camera.zoom = Vector2(0.5,0.5)
	camera.current = true
	add_child(camera)

	# add ui
	mainui = preload("res://ui/mainui/mainui.tscn").instance()
	mainui.parasite_controller = self
	add_child(mainui)

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
	var particles = preload("res://particles/parasite_test_particles.tscn").instance()
	add_child(particles)
	particles.position = possessing.position
	possessing.queue_free()
	possessing = null

func decrease_energy(val):
	energy -= val
	if energy <= 0.0:
		print("game over")
		energy = 0.0
