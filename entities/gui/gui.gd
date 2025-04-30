extends CanvasLayer

@onready var label: Label = $HBoxContainer/Label

var number_of_coins: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for coin in get_tree().get_nodes_in_group("coins"):
		coin.coin_collected.connect(on_coin_collected)
	

func on_coin_collected() -> void:
	print("player collected coin")
	number_of_coins += 1
	label.text = str(number_of_coins)
	
