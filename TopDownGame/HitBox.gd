extends Area2D
class_name HitBox

@export var weapon: Weapon

func _on_area_entered(area: HurtBox):
	assert(area is HurtBox)
	
	var hit_data = HurtBox.HitData.new()
	hit_data.damage = weapon.damage
	
	area.got_hit.emit(
		hit_data
	)
