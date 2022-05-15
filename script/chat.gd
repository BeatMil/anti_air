extends Node

var cool_name = "chat node desu"


func send_message(msg: String):
	var id = get_tree().get_network_unique_id()
	msg.erase(0, 1)
	rpc("receive_message", id, msg)


sync func receive_message(id, msg):
	var text_label = get_tree().root.get_children()[1].get_node("chat_display_label")
	text_label.text += str(id) + ": " + msg + "\n"
