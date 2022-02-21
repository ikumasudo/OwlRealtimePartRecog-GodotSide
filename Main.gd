extends Spatial

var mat_orange
var mat_white

func _ready():
	mat_orange = load("res://Owl/bright.tres")
	mat_white = load("res://Owl/white.tres")


func _process(delta):
	var data = $UDP.get_data()
	if data:
		for part in $OwlAndTree/OwlMesh.get_children():
			part.set("material/0", mat_white)
		
		print(data)
		var part_names = data.split(",", false)
		for part in part_names:
			var touched_part = get_node("OwlAndTree/OwlMesh/%s" % part)
			touched_part.set("material/0", mat_orange)
		
	$OwlAndTree.rotate_y(PI/8*delta)


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
