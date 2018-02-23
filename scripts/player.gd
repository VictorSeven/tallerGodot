extends KinematicBody2D

var velocidad = Vector2(0.0, 0.0)
var v = 100.0 #Velocidad de movimiento
var g = 100.0 #Gravedad

var coins = 0 #Numero de monedas obtenidas

var on_floor = false

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	
	#Velocidad horizontal
	if (Input.is_key_pressed(KEY_RIGHT)):
		velocidad.x = v #Poner la velocidad
		$sprite.flip_h = false #Mirando a la derecha
		change_anim("walk") #Animacion de andar
	elif (Input.is_key_pressed(KEY_LEFT)):
		velocidad.x = -v
		$sprite.flip_h = true
		change_anim("walk")
	else:
		velocidad.x = 0.0 #Detener
		$anim.stop(true) #Parar la animacion, frame 0
	
	on_floor = is_on_floor() #¿Esta en el suelo?
	
	if (Input.is_key_pressed(KEY_UP) and on_floor):
		velocidad.y = -v
	
	velocidad.y += g * delta #Aumentar velocidad vertical
	
	#Mover y deslizar
	move_and_slide(velocidad, Vector2(0.0, -1.0))


func change_anim(anim_name):
	if (anim_name != $anim.current_animation):
		$anim.play(anim_name)

#Esta función es invocada por la moneda
func get_coin():
	coins += 1