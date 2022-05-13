extends Node2D

const IP_ADDRESS = "127.0.0.1"
const PORT = 50021

func _ready():
	var network = NetworkedMultiplayerENet.new()
	network.create_client(IP_ADDRESS, PORT)
	get_tree().set_network_peer(network)
	network.connect("connection_failed",self,"_on_connection_failed")
	get_tree().multiplayer.connect("network_peer_packet",self,"_on_packet_received")
	$ip_label.text = array_to_string(IP.get_local_addresses())


func array_to_string(_array: Array) -> String:
	var text: String = "ip address:\n"
	for i in _array:
		text += str(i)
		text += "\n"
	return text
	

func _on_connection_failed(error):
	$status_label.text = "Error connecting to server " + error


func _on_packet_received(id,packet):
	$labelServerData.text = packet.get_string_from_ascii()


func _on_connect_button_pressed():
	var network = NetworkedMultiplayerENet.new()
	network.create_client(IP_ADDRESS, PORT)
	get_tree().set_network_peer(network)
	$status_label.text = "Connect!"


func _on_disconnect_button_pressed():
	get_tree().set_network_peer(null)
	$status_label.text = "Disconnect!"
