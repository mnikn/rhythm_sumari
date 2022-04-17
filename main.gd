extends Node2D

func dict_assin(origin, target):
	for key in target.keys():
		origin[key] = target[key]
	return origin

var song1 = preload("res://assets/musics/bgm/song_1.wav")
var hit_heavy = preload("res://assets/musics/sound_effects/hit_heavy.wav")
var hit_light = preload("res://assets/musics/sound_effects/hit_light.wav")

var icon_heavy = preload("res://assets/ui/heavy_action.png")
var icon_light = preload("res://assets/ui/light_action.png")

var pb = 60.0 / 130.0

var rhythm_part1_partern = {
	"8": "heavy",
	"16": "heavy",
	"24": "heavy",
}

var rhythm_part2_partern = {
	"32": "heavy",
	"34": "light",
	"36": "heavy",
	"38": "light",
	"40": "heavy",
	"42": "light",
	"44": "heavy",
	"46": "light",
}

var rhythm_part3_partern = {
	"64": "heavy",
	"65": "light",
	"65.5": "light",
	"66": "light",
	
	"72": "heavy",
	"73": "light",
	"73.5": "light",
	"74": "light",
}

var rhythm_part4_partern = {
	"96": "heavy",
	"97": "light",
	"97.5": "light",
	"98": "light",
	
	"104": "heavy",
	"105": "light",
	"105.5": "light",
	"106": "light",
}

var rhythm_part5_partern = {
	"128": "heavy",
	"129": "heavy",
	"129.5": "light",
	"130": "light",
	"130.5": "heavy",
	
	"136": "heavy",
	"137": "light",
	"137.5": "light",
	"138": "light",
	"138.5": "heavy",
}

var rhythm_part6_partern = {
	"160": "light",
	"160.5": "light",
	"161": "heavy",
	"162": "light",
	"162.5": "light",
	"163": "heavy",
	
	"164": "light",
	"164.5": "heavy",
	"165": "light",
	"165.5": "heavy",
	"166": "light",
	"166.5": "heavy",
	"167": "light",
	"167.5": "heavy",
	
	"168": "light",
	"168.5": "light",
	"169": "heavy",
	"170": "light",
	"170.5": "light",
	"171": "heavy",
	
	"172": "light",
	"172.5": "heavy",
	"173": "light",
	"173.5": "heavy",
	"174": "light",
	"174.5": "heavy",
	"175": "light",
	"175.5": "heavy",
}

var rhythm_part7_partern = {
	"192": "light",
	"192.25": "heavy",
	"192.5": "light",
	"193": "light",
	"193.25": "heavy",
	"193.5": "light",
	"194": "light",
	"194.25": "heavy",
	"194.5": "light",
	"195": "light",
	"195.25": "heavy",
	"195.5": "light",
	
	"196": "heavy",
	"197": "light",
	"198": "heavy",
	"199": "light",
	
	"200": "light",
	"200.25": "heavy",
	"200.5": "light",
	"201": "light",
	"201.25": "heavy",
	"201.5": "light",
	"202": "light",
	"202.25": "heavy",
	"202.5": "light",
	"203": "light",
	"203.25": "heavy",
	"203.5": "light",
	
	"204": "heavy",
	"205": "light",
	"206": "heavy",
	"207": "light",
}

var rhythm_part8_partern = {
	"224": "light",
	"224.25": "heavy",
	"224.5": "light",
	"225": "light",
	"225.25": "heavy",
	"225.5": "light",
	"226": "light",
	"226.25": "heavy",
	"226.5": "light",
	"227": "light",
	"227.25": "heavy",
	"227.5": "light",
	
	"228": "heavy",
	"229": "light",
	"230": "heavy",
	"231": "light",
	
	"232": "light",
	"232.25": "heavy",
	"232.5": "light",
	"233": "light",
	"233.25": "heavy",
	"233.5": "light",
	"234": "light",
	"234.25": "heavy",
	"234.5": "light",
	"235": "light",
	"235.25": "heavy",
	"235.5": "light",
	
	"236": "heavy",
	"237": "light",
	"238": "heavy",
	"239": "light",
}

var rhythm_part9_partern = {
	"256": "light",
	"256.25": "light",
	"256.5": "heavy",
	"257.5": "light",
	"257.75": "light",
	"258": "heavy",
	
	"260": "light",
	"260.25": "light",
	"260.5": "heavy",
	"261.5": "light",
	"261.75": "light",
	"262": "heavy",
	
	"264": "light",
	"264.25": "light",
	"264.5": "heavy",
	"265.5": "light",
	"265.75": "light",
	"266": "heavy",
	
	"268": "light",
	"268.25": "light",
	"268.5": "heavy",
	"269.5": "light",
	"269.75": "light",
	"270": "heavy"
}

var rhythm_part10_partern = {
	"288": "heavy",
	"290": "light",
	"292": "heavy",
	"294": "light",
	"296": "heavy",
	"298": "light",
	"300": "heavy",
	"302": "light",
}

var rhythm = {}

var ActionIconScene = preload("res://ActionIcon.tscn")

func _ready():
	dict_assin(rhythm_part2_partern, self.duplicate_next_rhythm_patern(rhythm_part2_partern))
	dict_assin(rhythm_part3_partern, self.duplicate_next_rhythm_patern(rhythm_part3_partern))
	dict_assin(rhythm_part4_partern, self.duplicate_next_rhythm_patern(rhythm_part4_partern))
	dict_assin(rhythm_part5_partern, self.duplicate_next_rhythm_patern(rhythm_part5_partern))
	dict_assin(rhythm_part6_partern, self.duplicate_next_rhythm_patern(rhythm_part6_partern))
	dict_assin(rhythm_part7_partern, self.duplicate_next_rhythm_patern(rhythm_part7_partern))
	dict_assin(rhythm_part8_partern, self.duplicate_next_rhythm_patern(rhythm_part8_partern))
	dict_assin(rhythm_part9_partern, self.duplicate_next_rhythm_patern(rhythm_part9_partern))
	dict_assin(rhythm_part10_partern, self.duplicate_next_rhythm_patern(rhythm_part10_partern))
	
	dict_assin(rhythm, rhythm_part1_partern)
	dict_assin(rhythm, rhythm_part2_partern)
	dict_assin(rhythm, rhythm_part3_partern)
	dict_assin(rhythm, rhythm_part4_partern)
	dict_assin(rhythm, rhythm_part5_partern)
	dict_assin(rhythm, rhythm_part6_partern)
	dict_assin(rhythm, rhythm_part7_partern)
	dict_assin(rhythm, rhythm_part8_partern)
	dict_assin(rhythm, rhythm_part9_partern)
	dict_assin(rhythm, rhythm_part10_partern)

	$Player/AnimationPlayer.play("idle")
	
	$BgmPlayer.stream = song1
	$BgmPlayer.play()
	
	$WaterSoundEffectPlayer.play()
	
	$Enemy/AnimationPlayer.play("idle")
	var animatopm_player = $Player/AnimationPlayer
	$Player/AnimationPlayer.connect("animation_finished", 
		func (anim):
			if anim != "idle":
				animatopm_player.play("idle") 
	)

	self.start_rhythm()

func start_rhythm():
	for per in self.rhythm.keys():
		var timer = self.get_tree().create_timer((per.to_float() - 7.7) * pb)
		var create_action_icon = self.create_action_icon
		var hit_type = self.rhythm[per]
		timer.connect("timeout", func (): 
			create_action_icon.call(hit_type)
		)

		# debug code
#		var player_hit = self.play_hit
#		var timer2 = self.get_tree().create_timer(per.to_float() * pb)
#		timer2.connect("timeout", func (): 
#			player_hit.call(hit_type)
#		)

func create_action_icon(type):
	var node = self.ActionIconScene.instantiate()
	node.position.x = 580
	if type == "heavy":
		node.texture = self.icon_heavy
	else:
		node.texture = self.icon_light
	var tween = create_tween()
	tween.tween_property(node, "position", Vector2(-30, 12), 4)
	$ActionPanel/Container.add_child(node)
	await tween.finished
	if is_instance_valid(node):
		node.queue_free()

func play_hit(type = "heavy"):
	var node = AudioStreamPlayer.new()
	if type == "light":
		node.stream = hit_light
		$Player/AnimationPlayer.play("light_attack")
	else:
		node.stream = hit_heavy
		if $Player/AnimationPlayer.is_playing and $Player/AnimationPlayer.current_animation == "heavy_attack":
			return
		$Player/AnimationPlayer.play("heavy_attack")
	self.add_child(node)
	
	var tween = create_tween()
	var tween2 = create_tween()
	var checkbox = $ActionPanel/CheckBox
	tween.tween_property(checkbox, "color", Color(255,255,255,0.5), 0.1)
	tween.connect("finished", func():
		checkbox.color = Color("000928e7")
	)
	
	for node in $ActionPanel/Container.get_children():
		if node.position.x >= 30 and node.position.x <= 50:
			node.queue_free()

	var enemy_player = $Enemy/AnimationPlayer
	$Enemy/AnimationPlayer.play("hit")
	self.get_tree().create_timer(0.1).connect("timeout", func():
		enemy_player.play("idle")
	)
	
	node.play()
	await node.finished
	node.queue_free()

func duplicate_next_rhythm_patern(patern):
	var res = {}
	for per in patern.keys():
		var v = per.to_float() + 16.0
		res[str(v)] = patern[per]
	return res

func _input(event):
	if event.is_action_pressed("player_heavy_hit"):
		self.play_hit("heavy")
	elif event.is_action_pressed("player_light_hit"):
		self.play_hit("light")
