extends Control

var label : Label
var car : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	car = get_parent()
	label = $CanvasLayer/Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = str(floor(car.current_speed/100), " kmh")
