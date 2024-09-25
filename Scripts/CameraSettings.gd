
extends Camera2D


var car: Node2D

var cam_offset = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	car = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if car:
		var offset_vec = Vector2.UP.rotated(car.rotation) * cam_offset
		offset_vec.y += offset_vec.orthogonal().x /2
		#print(offset_vec)
		offset = offset_vec
