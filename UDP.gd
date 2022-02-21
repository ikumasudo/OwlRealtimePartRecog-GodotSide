extends Node

var socket
var done

func _ready():
	socket = PacketPeerUDP.new()
	if (socket.listen(7010, "127.0.0.1") != OK):
		print("Error occured")
		done = true
	else:
		print("Listening on on localhost")


func get_data():
	if (socket.get_available_packet_count() > 0):
		var data = socket.get_packet().get_string_from_ascii()
		return data
	else:
		return null
		
func _exit_tree():
	socket.close()
	print("Connection closed")

#func _process(delta):
#	if not done:
#		if (socket.get_available_packet_count() > 0):
#			var data = socket.get_packet().get_string_from_ascii()
#			if (data == "quit"):
#				done = true
#			else:
#				print("Data received:", data)
#
#	else:
#		socket.close()
#		print("Connection closed")
#		set_process(false)
