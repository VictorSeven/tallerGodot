extends Area2D

var got = false #¿Hemos cogido la moneda?

func _ready():
	pass

#El proceso solo comienza cuando la moneda ha sido cogida
func _process(delta):
	#Una vez cogida y las particulas se han mostrado, destruir
	if (not $particles.emitting and got):
		set_process(false)
		queue_free()


#Esta función se llama cuando hay una colisión con un cuerpo
func _on_coin_body_entered( body ):
	#Si hemos colisionado con el jugador
	if (body.get_name() == "player"):
		got = true
		body.get_coin() #Aumentar su número de monedas en uno
		$sprite.hide()
		#Animación con partículas
		$particles.emitting = true


	
