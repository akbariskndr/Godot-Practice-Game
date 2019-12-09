extends Area2D

signal taken

func _on_Star_body_entered(body):
	$CollisionPolygon2D.disabled = true
	hide()
	emit_signal("star_taken")
	queue_free()
