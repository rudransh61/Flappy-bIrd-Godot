extends Node

@export var pipe_scene : PackedScene

var game_running : bool
var game_over : bool
var scroll
var score
const SCROLL_SPEED : float = 0.00004
var screen_size : Vector2
var ground_height : int
var pipes : Array
const PIPE_DELAY : int = 100
const PIPE_RANGE : int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size
	ground_height = $Ground.get_node("Sprite2D").texture.get_height()
	new_game() # Replace with function body.

func new_game():
	#reset variables
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	
	$Bird.reset()
	
func _input(event):
	if game_over == false:
		if event is InputEventMouseButton:
			if event.pressed:
				if game_running == false:
					start_game()
				else:
					if $Bird.flying:
						$Bird.flap()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func start_game():
	game_running = true
	$Bird.flying = true


func _process(delta):
	if game_running:
		scroll += SCROLL_SPEED
		
		if scroll >= screen_size.x :
			scroll = 0
		$Ground.position.x -= scroll
