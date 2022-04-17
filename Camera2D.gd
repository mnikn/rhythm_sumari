extends Camera2D


var tween: Tween

var shake_amount = 0
var default_offset = offset


func _ready():
	self.tween = self.create_tween()
	set_process(false)


func _process(delta):
	randomize()
	self.offset = Vector2(randf_range(-shake_amount, shake_amount), randf_range(-shake_amount, shake_amount)) * delta + default_offset


func shake(new_shake, shake_time=0.3):
	shake_amount += new_shake
	set_process(true)
	
	await self.get_tree().create_timer(shake_time).timeout
	shake_amount = 0
	set_process(false)
	
	var tween = self.create_tween()
	tween.tween_property(self, "offset", default_offset, 0.1)
