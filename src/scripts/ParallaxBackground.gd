extends ParallaxBackground


export (float) var scrolling_speed = 100


func _ready():
	pass # Replace with function body.


func _process(delta):
	scroll_offset.y += scrolling_speed * delta
