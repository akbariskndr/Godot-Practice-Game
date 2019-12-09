extends Node2D

export (PackedScene) var Star
export (int) var total_stars = 0
export (int) var stars_found = 0

func _ready():
	randomize()
	$BGM.play()
	var curve = $StarSpawnPath.get_curve()
	var total_pos = curve.get_point_count()
	total_stars = 4#(randi() % total_pos) + 1
	
	var star_pos = []
	for i in range(0, total_stars):
		var pos = randi() % total_pos
		while(star_pos.has(pos)):
			pos = randi() % total_pos
		star_pos.append(pos)
		
	for i in star_pos:
		var star = Star.instance()
		$StarWrapper.add_child(star)
		star.position = curve.get_point_position(i)
		
	for star in $StarWrapper.get_children():
		star.connect("taken", self, "_on_Star_taken")
		
		
func _on_Star_body_entered(body):
	stars_found += 1