extends Label

func _ready():
	var network = NetworkedMultiplayerENet.new()
	network.create_server(1998, 2)
	get_tree().set_network_peer(network)
	
	# connect signals
	network.connect("peer_connected",self,"_peer_connected")
	network.connect("peer_disconnected",self,"_peer_disconnected")

  
func _peer_connected(id):
	text = text + "\nUser " + str(id) + " connected"
	get_parent().get_node("user_count_label").text = "Total Users:" + str(get_tree().get_network_connected_peers().size())

  
func _peer_disconnected(id):
	text = text + "\nUser " + str(id) + " disconnected"
	get_parent().get_node("user_count_label").text = "Total Users:" + str(get_tree().get_network_connected_peers().size())
