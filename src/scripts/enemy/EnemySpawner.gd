extends Area2D

var Enemy = preload("res://scenes/enemy/Enemy.tscn")
var free_to_spaw_enemy = false
var RESPAW_INTERVAL = 3

func _ready():
	pass

func _process(delta):
	if free_to_spaw_enemy :
		var enemy_instance = Enemy.instance()
		enemy_instance.position = get_global_position()
		get_tree().get_root().call_deferred("add_child", enemy_instance)
		free_to_spaw_enemy = false


func _on_Timer_timeout():
	free_to_spaw_enemy = true
	set_Timer_to_next_spawn()

func set_Timer_to_next_spawn():
	$Timer.wait_time = rand_range(0, RESPAW_INTERVAL)
