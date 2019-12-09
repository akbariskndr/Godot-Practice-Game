extends Control

func _ready():
	$VBoxContainer/HBoxContainer/PlayerAnimation.play('walking')
	$VBoxContainer/TitleLabel/AnimationPlayer.play("hover")
	$BGM.play()
	
	for button in $VBoxContainer/HBoxContainer/ButtonContainer.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_target])
		
func _on_Button_pressed(scene_target):
	get_tree().change_scene(scene_target)
