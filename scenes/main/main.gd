extends Node2D

func _ready():
	
	# set up mouse cursor
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	var mouse_cursor_image = Image.new()
	mouse_cursor_image.load("res://ui/cursor/default_cursor.png")
	var mouse_cursor_texture = ImageTexture.new()
	mouse_cursor_texture.create_from_image(mouse_cursor_image,0)
	Input.set_custom_mouse_cursor(mouse_cursor_texture)
	
	
	# load level
	get_tree().change_scene("res://scenes/levels/level01.tscn")
