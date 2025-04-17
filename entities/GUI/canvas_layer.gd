extends CanvasLayer

@onready var label: Label = $HBoxContainer/Label

func _ready() -> void:
	for coin in get_tree().get_nodes_in_group("coins"):
		coin.coin_collected.connect(on_coin_collected)
		

func on_coin_collected() -> void:
	print("You've collected a coin!")
	label.text = "1"
