extends Node

var cool_name = "chat node desu"


func send_message(msg: String, name: String):
	var id = get_tree().get_network_unique_id()
	msg.erase(0, 1)
	rpc("receive_message", id, msg, name)


sync func receive_message(id, msg, name):
	var text_label = get_tree().root.get_children()[1].get_node("chat_display_label")
	# text_label.text += str(id) + ": " + msg + "\n"
	text_label.text += name + ": " + msg + "\n"


func say_bob():
	var id = get_tree().get_network_unique_id()
	print("local say_bob")
	rpc("_say_bob", id)


remote func _say_bob(id):
	print("from: " + str(id) + ": bob")
