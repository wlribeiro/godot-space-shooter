extends CanvasLayer

# this ensure that the mouse will return to position that it be before call the pause
var last_mouse_position:Vector2

func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("user_pause") :
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused


func _on_Button_pressed():
	get_tree().paused = false
	set_visible(false)


func set_visible(is_visible:bool):
	for node in get_children():
		node.visible = is_visible
	handle_mouse_visibility()


func handle_mouse_visibility() :
	if Input.get_mouse_mode() == 1:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		last_mouse_position = get_viewport().get_mouse_position()
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		get_viewport().warp_mouse(last_mouse_position)

