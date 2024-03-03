extends State

@export
var fall_state: State
@export
var idle_state: State
@export
var move_state: State

@export
var jump_force: float = 900.0

func enter() -> void:
	super()
	parent.velocity.z = jump_force

func process_physics(delta: float) -> State:
	parent.velocity.z -= gravity * delta
	
	if parent.velocity.z < 0:
		return fall_state
	
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back") * move_speed
	
	#if movement != 0:
		#parent.animations.flip_h = movement < 0
#current implementation would only allow move_left and move_right while falling
	parent.velocity = input_dir
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if input_dir != 0:
			return move_state
		return idle_state
	return null
