extends Node2D

func _ready():
	var network = NetworkedMultiplayerENet.new()
	network.create_server(50021, 2)
	get_tree().set_network_peer(network)
	var is_server = get_tree().is_network_server()
	print("is_server: ", is_server)
	$ip_label.text = array_to_string(IP.get_local_addresses())

	# connect signals
	network.connect("peer_connected",self,"_peer_connected")
	network.connect("peer_disconnected",self,"_peer_disconnected")


func array_to_string(_array: Array) -> String:
	var text: String = "ip address:\n"
	for i in _array:
		text += str(i)
		text += "\n"
	return text
  

func _peer_connected(id):
	$user_count_label.text = "Total Users:" + str(get_tree().get_network_connected_peers().size())
	print("peer connected! ", id)

  
func _peer_disconnected(id):
	$user_count_label.text = "Total Users:" + str(get_tree().get_network_connected_peers().size())
	print("peer disconnected!", id)
