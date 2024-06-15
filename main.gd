extends Node2D

var hp:float = 100
var maxhp:float = 100 # 最大HP 

func _ready():

	$"sample".max_value =maxhp
	$"sample/Label".text = "Hp:" + str(hp)
	
	
func _process(delta):
	
	if hp >= 0:
		hp -= delta
	
	# HPバー更新
	var hpbar:TextureProgressBar = $"sample"
	var hpPer = _hpPer()
	hpbar.value = maxhp * hpPer
	
	# HPバー更新
	hpbar.tint_progress = lerp(Color.YELLOW, Color.YELLOW, hpPer)
	hpbar.tint_under = lerp(Color.RED, Color.RED, hpPer)
	#hpbar.tint_over = lerp(Color.WHITE, Color.WHITE, hpPer)
	$"sample/Label".text = "Hp:" +"%4.0f" %  hp
	if hp <= 0:
		$"sample/Label".text = "Hp:0"
	
func _hpPer():
	return 1.0 * hp / maxhp;
