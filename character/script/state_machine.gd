extends Node

@export
var starting_state: State

var current_state: State

#initialize state machine by giving each child state a reference to the
#parent object and enter the default starting state.
func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent
	
	#initialize to the default state.
	change_state(starting_state)

#change to the new state by first calling any exit logic on the current state.
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter()

#pass through functions for the player to call,
#handling state changes as needed.
func _process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
		
func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	
func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
