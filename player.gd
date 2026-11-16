extends CharacterBody2D

var time_elapsed: float = 0.0
var scene: int = 1

func _ready():
	$"../OldMan/CollisionShape2D".disabled = true

func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide()

func _on_pickup_area_area_entered(area):
	if scene==1:
		if area.is_in_group("basket"):
			$"../SpriteBackground2".visible = true
			$"../SpriteBackground".visible = false
			$"../OldMan".visible = true
			$"../OldMan/CollisionShape2D".set_deferred("disabled", false)
			print("enabled")
			position.x = -500
			position.y = 0
			scene=2
			
	elif scene==2:
		if area.is_in_group("OldMan"):
			$"../OldMan/CollisionShape2D".set_deferred("disabled", true)
			$"../SpriteBackground2".visible = true
			$CanvasLayer/OldMan.text = "Guy: Is there anyone else here?"
			await get_tree().create_timer(2.5).timeout
			$CanvasLayer/OldMan.text = "Old Man: No, everyone’s gone since the last time you’ve been here." 
			await get_tree().create_timer(2.5).timeout
			$CanvasLayer/OldMan.text = "Old Man: Ten years ago a nuclear warhead went off." 
			await get_tree().create_timer(2.5).timeout
			$CanvasLayer/OldMan.text = "Old Man: It's only gotten worse since."  
			await get_tree().create_timer(2.5).timeout
			$CanvasLayer/OldMan.text = "Guy: Is there nothing I can do?"
			await get_tree().create_timer(2.5).timeout
			$CanvasLayer/OldMan.text =  "Old Man: Here"
			$"../Coil".visible = true
			await get_tree().create_timer(2.5).timeout
			$CanvasLayer/OldMan.text =  "Old Man: Compress this spring to return to our time."
			await get_tree().create_timer(2.5).timeout
			$CanvasLayer/OldMan.text =  "Old Man: And stretch it to turn it back."
			await get_tree().create_timer(2.5).timeout
			$CanvasLayer/OldMan.text =  "Old Man: Find out who's to blame ten years ago."
			await get_tree().create_timer(2.5).timeout
			$CanvasLayer/OldMan.text =  "  "
		if area.is_in_group("basket"):
			$"../Coil".visible = false
			$"../OldMan".visible = false
			$"../SpriteBackground3".visible = true
			$"../SpriteBackground2".visible = false
			$"../SunglassesGuy".visible = true
			$"../HomelessGuy".visible = true
			position.x = -400
			position.y = 0
			scene = 3
	elif scene == 3:
		if area.is_in_group("HomelessGuy"):
			$"../CanvasLayer/HomelessGuy".text = "Guy: Do you have a newspaper I can read?"
			await get_tree().create_timer(2.5).timeout
			$"../CanvasLayer/HomelessGuy".text = "Homeless Man: You don’t need a newspaper. "
			await get_tree().create_timer(2.5).timeout
			$"../CanvasLayer/HomelessGuy".text = "Homeless Man: Just ask anyone here. "
			await get_tree().create_timer(2.5).timeout
			$"../CanvasLayer/HomelessGuy".text = "Homeless Man: It’s been a decade since war was declared."
			await get_tree().create_timer(2.5).timeout
			$"../CanvasLayer/HomelessGuy".text = "Homeless Man: It’s been a decade since war was declared."
			await get_tree().create_timer(2.5).timeout
			$"../CanvasLayer/HomelessGuy".text = "Homeless Man: The president’s gonna want to do something about it today"
			await get_tree().create_timer(2.5).timeout
			$"../CanvasLayer/HomelessGuy".text.text = " "
		if area.is_in_group("SunglassesGuy"):
			$"..CanvasLayer/SunglassesGuy".text = "Sunglasses Man: None of your business."
			await get_tree().create_timer(2.5).timeout
			$"..CanvasLayer/SunglassesGuy".text = "Sunglasses Man: The government doesn’t take kindly to intrusion."
			await get_tree().create_timer(2.5).timeout
			$"..CanvasLayer/SunglassesGuy".text = " "
		
			
			
			
			
	
		
		
	
