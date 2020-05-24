extends KinematicBody2D

var VELOCIDADE_PLATAFORMA = 0.3

var sent = 1

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var new_offset = get_parent().get_unit_offset() + delta * sent * VELOCIDADE_PLATAFORMA
	
	if sent == 1 and new_offset >= 0.99999:
		sent = -1
		get_parent().set_unit_offset(0.99999)
	elif sent == -1 and new_offset <= 0:
		sent = 1
		get_parent().set_unit_offset(0)
	else:
		get_parent().set_unit_offset(new_offset)
