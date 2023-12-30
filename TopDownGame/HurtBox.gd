extends Area2D
class_name HurtBox

class HitData:
	var damage: int = 0
	var fire: bool = false

signal got_hit(damage: HitData)
