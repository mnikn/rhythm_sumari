extends Node2D

func dict_assin(origin, target):
	for key in target.keys():
		origin[key] = target[key]
	return origin

var song1 = preload("res://assets/musics/bgm/song_1.wav")
var hit_heavy = preload("res://assets/musics/sound_effects/hit_heavy.wav")
var hit_light = preload("res://assets/musics/sound_effects/hit_light.wav")

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

var rhythm = {}

func _ready():
	dict_assin(rhythm_part2_partern, self.duplicate_next_rhythm_patern(rhythm_part2_partern))
	
	dict_assin(rhythm, rhythm_part1_partern)
	dict_assin(rhythm, rhythm_part2_partern)

	$Player/AnimationPlayer.play("idle")
	
	$BgmPlayer.stream = song1
	$BgmPlayer.play()
	
	$WaterSoundEffectPlayer.play()
	
	var animatopm_player = $Player/AnimationPlayer
	$Player/AnimationPlayer.connect("animation_finished", 
		func (anim):
			if anim != "idle":
				animatopm_player.play("idle") 
	)

	self.start_rhythm()

func start_rhythm():
	for per in self.rhythm.keys():
		var timer = self.get_tree().create_timer(per.to_float() * pb)
		var player_hit = self.play_hit
		var hit_type = self.rhythm[per]
		timer.connect("timeout", func (): player_hit.call(hit_type))

func play_hit(type = "heavy"):
	var node = AudioStreamPlayer.new()
	self.add_child(node)
	if type == "light":
		node.stream = hit_light
		$Player/AnimationPlayer.play("light_attack")
	else:
		node.stream = hit_heavy
		$Player/AnimationPlayer.play("heavy_attack")
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
