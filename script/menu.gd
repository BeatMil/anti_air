extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(OS.get_name())
	print(IP.get_local_addresses()[3])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_sever_button_pressed():
	get_tree().change_scene("res://scene/sever_node.tscn")


func _on_client_button_pressed():
	get_tree().change_scene("res://scene/client_node.tscn")
