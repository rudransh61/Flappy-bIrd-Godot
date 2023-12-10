extends KinematicBody2D

const GRAVITY : int = 1000
const MAX_VEL : int = 600
const FLAP_SPEED : int = -500
var flying : bool = false
var falling : bool = false
const START_POS = Vector2(100,0)
var velocity = Vector2()

func _ready():
	reset()
	
func reset():
	falling = false
	flying = false
	position = START_POS
	set_rotation(0)
	
func _physics_process(delta):
	if flying or falling :
		velocity.y += GRAVITY * delta
		
		if velocity.y > MAX_VEL:
			velocity.y = MAX_VEL
		if flying:
			set_rotation(0.01)
		elif falling:
			set_rotation(PI/2)
		move_and_collide(velocity * delta)
	

func flap():
	velocity.y = FLAP_SPEED
						
