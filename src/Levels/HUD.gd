extends Control

func _ready():
	$Label1.text = "Lives: " + String(Global.lives)
	$Label2.text = "Crystals: " + String(Global.crystals)

func _on_crystal_collected() -> void:
	_ready()


func _on_Player_life_minus() -> void:
	_ready()
	
