extends Node

onready var perc = get_node("personagem")
onready var camera = get_node("deadCamera")

func _ready():
	pass
	
func change_camera():
	camera.set_global_pos(perc.get_node("camera").get_camera_pos())
	camera.make_current()


func _on_personagem_morreu():
	change_camera()
	get_node("spawn_time").set_wait_time(1.5)
	get_node("spawn_time").start()


func _on_spawn_time_timeout():
	reviver()

func reviver():
	perc.set_pos(get_node("spawn_point").get_pos())
	perc.reviver()

func _on_personagem_fim():
	change_camera()
	get_node("spawn_time").set_wait_time(3)
	get_node("spawn_time").start()
