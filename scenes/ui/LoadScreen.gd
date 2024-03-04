extends "res://scenes/ui/BaseUI.gd"


func _on_load_time_timeout():
	if app_state:
		app_state.set_trigger("load_done")
