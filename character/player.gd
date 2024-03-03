class_name Player

extends CharacterBody3D

@onready
var animations = $animations
@onready
var state_machine = $state_machine

func _ready() -> void:
#initialize the state machine, passing a reference of the player to the states,
#that way they can move and react accordingly
	state_machine.init(self)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_fram(delta)
#
#var mouse_sensitivity := 0.001
#var twist_input := 0.0
#var pitch_input := 0.0
#
#var jump_height := 1
#var jump_time_to_peak := 0.2
#var jump_time_to_descent := 0.1
#var coyote_time := 0.2
#var coyote_time_counter := 0.2
#const SPEED = 10
#@onready var jump_velocity := float (2.0 * jump_height) / jump_time_to_peak
#@onready var jump_gravity := float (-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)
#@onready var fall_gravity := float (-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)
#@onready var twist_pivot := $TwistPivot
#@onready var pitch_pivot := $TwistPivot/PitchPivot
#
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
#
##func _debug_gravity():
	##var posvec = self.get_global_position()
	##print(posvec)
#func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#
#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_cancel"):
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		#
	#twist_pivot.rotate_y(twist_input)
	#pitch_pivot.rotate_x(pitch_input)
	#pitch_pivot.rotation.x = clamp(pitch_pivot.rotation.x, 
		#deg_to_rad(-85),
		#deg_to_rad(85)
	#)
	#twist_input = 0.0
	#pitch_input = 0.0
#
#func _unhandled_input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion:
		#if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			#twist_input = - event.relative.x * mouse_sensitivity
			#pitch_input = - event.relative.y * mouse_sensitivity
#
#func _jump():
	#velocity.y = jump_velocity
	#
#func _get_gravity() -> float:
	#return jump_gravity if velocity.y > 0.0 else fall_gravity
#
#func _physics_process(delta):	
	#print(global_position)
	#if is_on_floor():
		#coyote_time_counter = coyote_time
	#else:
		#coyote_time_counter -= delta
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += _get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("jump") and coyote_time_counter > 0:
		#_jump()
	#if Input.is_action_just_released("jump"):
		#coyote_time_counter = 0.0
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	##keep movement relative to the twist pivot of mouse input
	#var direction = (twist_pivot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
#
	#move_and_slide()
