extends BoxContainer


@onready var mushrooms_label: Label = $Label2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mushrooms_label.text = str(Globals.mushrooms)
	pass
