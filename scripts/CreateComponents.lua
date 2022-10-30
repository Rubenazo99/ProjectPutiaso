--[[

   _____  ____   __  __  _____    ____   _   _  ______  _   _  _______  ______   _____ 
  / ____|/ __ \ |  \/  ||  __ \  / __ \ | \ | ||  ____|| \ | ||__   __||  ____| / ____|
 | |    | |  | || \  / || |__) || |  | ||  \| || |__   |  \| |   | |   | |__   | (___  
 | |    | |  | || |\/| ||  ___/ | |  | || . ` ||  __|  | . ` |   | |   |  __|   \___ \ 
 | |____| |__| || |  | || |     | |__| || |\  || |____ | |\  |   | |   | |____  ____) |
  \_____|\____/ |_|  |_||_|      \____/ |_| \_||______||_| \_|   |_|   |______||_____/ 
                                                                                       
Código hecho por Rubén López García


Aquí crearemos los componentes que utilizaremos en el juego, eso si, las variables en la tercera línea
por cada componente son valores por defecto, NO los modifiques aquí, ves a [ CreatePlayers ] para modificar las variables
o eliminar las de default y poner custom

Si la mamaste y ya no sabes qué variables tenían, síguete por las variables default

   _____  _    _   __           
  / ____|| |  | | /_/     /\    
 | |  __ | |  | ||_ _|   /  \   
 | | |_ || |  | | | |   / /\ \  
 | |__| || |__| | | |  / ____ \ 
  \_____| \____/ |___|/_/    \_\
                           
Transform -> Almacena lo básico de lo básico, la posición, rotación, escala, altura y anchura y su nombre.
Collider -> La que gestiona los colliders, tiene isTrigger por si queremos hacer que lo atraviess igualmente (perfecto para eventos, sin implementar todavía) después isColliding para el suelo, y isTouchingWall para las parades, todos en true o false
Velocity -> Almacena la velocidad actual del jugador tanto en x o y
Acceleration -> Se encarga de guardar la aceleración tanto de x o y individualmente de la velocidad, se podría modificar para hacer los saltos más crunchy
Color -> Guarda las 3 variables r g b y la alpha en bytes (0 - 255)
Jump -> Contiene las variables jumpKey (tecla para saltar), force (la fuerza del salto), rayActive (true o false) y desactiva o activa los raycasts del suelo, y timer y maxtimer (explicadas en sistemas)
MovementKeys -> Contiene las teclas que se usarán para moverte
Direction -> Almacena la dirección del jugador, está atada con movement keys-
Dragable -> Permite una entidad ser arrastrable por el ratón (perfectamente para recolocar cosas y testear, esto hecho pa ti teo jeje)

]]

Transform = Component.create("transform", 
{ "x", "y", "rotation", "scaleX", "scaleY", "width", "height", "name"},
{ x = 0, y = 0, rotation = 0, scaleX = 1, scaleY = 1, width = 10, height = 10, name = "Default"})
--[[

x -> posición x del jugador [ NO MODIFICABLE ]
y -> posición y del jugador [ NO MODIFICABLE ] 
rotation -> rotación del jugador (no se usa) [ NO MODIFICABLE ]
scaleX -> escala en x del jugador (pendiente de ser utilizado) [ NO MODIFICABLE ]
scaleY -> escala en y del jugador (pendiente de ser utilizado) [ NO MODIFICABLE ]
width -> anchura del jugador [ MODIFICABLE ]
height -> altura del jugador [ MODIFICABLE ]
name -> nombre del jugador (JugadorA, JugadorB, JugadorC...) [ NO MODIFICABLE ]

]]

Collider = Component.create("collider",
{ "isTrigger", "isColliding", "isTouchingLeftWall", "isTouchingRightWall" },
{ isTrigger = false, isColliding = false, isTouchingLeftWall = false, isTouchingRightWall = false })
--[[

isTrigger -> Si el collider es trigger, puede se atravesado [ MODIFICABLE ]
isColliding -> Si está tocando el suelo o no [ NO MODIFICABLE ]
isTouchingLeftWall -> Si está tocando la pared izquierda o no [ NO MODIFICABLE ]
isTouchingRightWall -> Si está tocando la pared derecha o no [ NO MODIFICABLE ]

]]

Velocity = Component.create("velocity",
{ "x", "y" },
{ x = 1, y = 1 })
--[[

x -> la velocidad del personaje en la x [ MODIFICABLE ]
y -> la velocidad del personaje en la y [ NO MODIFICABLE ]

]]

Acceleration = Component.create("acceleration",
{ "x", "y" },
{ x = 0, y = 0 })
--[[

x -> la aceleración del personaje en la x (sin usar) [ NO MODIFICABLE ]
y -> la aceleración del personaje en la y [ MODIFICABLE ]

]]

Color = Component.create("color",
{ "r", "g", "b", "a" },
{ r = 255, g = 255, b = 255, a = 1 })
--[[

r -> la cantidad de rojo del color [ MODIFICABLE ]
g -> la cantidad de verde del color [ MODIFICABLE ]
b -> la cantidad de azul del color [ MODIFICABLE ]
a -> cantidda de transparencia del color [ MODIFICABLE ]

]]

Jump = Component.create("jump",
{ "jumpKey", "force", "rayActive", "timer", "maxTimer" },
{ jumpKey = "w", force = -8, rayActive = true, timer = 0, maxTimer = 0.3 })
--[[

jumpKey -> La tecla que usa para saltar [ MODIFICABLE ]
force -> La fuerza de salto (sobrescribe la velocidad.y actual) [ MODIFICABLE ]
rayActive -> Activa lo desactiva los raycast de salto de * collider * [ NO MODIFICABLE ]
timer y maxTimer -> Temporizador que, en cuanto se desactive los rayos, se reactiven de nuevo [ MODIFICABLE, PERO NO RECOMENDADO ]

]]


MovementKeys = Component.create("movementKeys",
{ "left", "right" },
{ left = "a", right = "d" })
--[[

left -> La tecla que usarás para moverte a la izquierda [ MODIFICABLE ]
right -> La tecla que usarás para moverte a la derecha [ MODIFICABLE ]

]]

Direction = Component.create("direction",
{ "left", "right", "lastDirection" },
{ left = false, right = true, lastDirection = "right" })
--[[

left -> Almacena si el jugador está yendo a la izquierda [ NO MODIFICABLE ]
right -> Almacena si el jugador está yendo a la derecha [ NO MODIFICABLE ]
lastDirection -> Almacena la última dirección que fué el jugador (no usada) [ NO MODIFICABLE ]

]]


AttackComponent = Component.create("attackComponent",
{ "minWidth", "minHeight", "maxWidth", "maxHeight", "canAttack", "charging", "chargingTime", "chargingMaxTime", "angle", "cooldownTimer", "cooldownMaxTimer", "key", "alreadyScaled" },
{ minWidth = 12, minHeight = 12, maxWidth = 25, maxHeight = 25, canAttack = true, charging = false,
chargingTime = 0, chargingMaxTime = 1, angle = 0, cooldownTimer = 0, cooldownMaxTimer = 0.5, key = "e", alreadyScaled = false})
--[[

minWidth, minHeight, maxWidth, maxHeight -> Almacenan el mínimo y el máximo de width y height que ocurrirá mientras el jugador presione el boton de atacar [ MODIFICABLE ]
canAttack -> Permite al jugador si puede atacar o no (está desactivado en cooldown) [ NO MODIFICABLE ]
charging -> Almacena si está cargando el ataque o no [ NO MODIFICABLE ]
chargingTime -> Almacena el tiempo actual de carga del ataque [ NO MODIFICABLE ]
chargingMaxTime -> Almacena el máximo tiempo que puede estar cargando el ataque [ MODIFICABLE, NO RECOMENDADO ]
angle -> Almacena el ángulo final del ataque [ NO MODIFICABLE ]
cooldownTimer -> Almacena el tiempo actual del cooldown [ NO MODIFICABLE ]
cooldownMaxTimer -> Almacena el tiempo máximo que puede tener el cooldown [ MODIFICABLE ]
key -> Almacena la tecla que puedes usar para cometer el crímen de atacar [ MODIFICABLE ]
alreadyScaled -> Almacena un bool que dice si estás ya escalado o no [ NO MODIFICABLE ]

]]


HitComponent = Component.create("hitComponent",
{ "hit", "angle", "horizontalForce" },
{ hit = false, angle = 0, horizontalForce = -10 }
)
--[[

hit -> Dice si el jugador está golpeado o no [ NO MODIFICABLE ]
angle -> Recoge el ángulo final de * AttackComponent * [ NO MODIFICABLE ]
horizontalForce -> Multiplicador de fuerza en la que irá el jugador al ser golpeado horizontalmente [ MODIFICABLE ]

]]

DragableComponent = Component.create("dragableComponent",
{ "enabled", "isBeingDragged "},
{ enabled = true, isBeingDragged = false }
)
--[[

enabled -> En modod debug, dice si se puede agarrar o no [ MODIFICABLE ]
isBeingDragged -> Dice si está siendo agarrado o no [ NO MODIFICABLE ]

]]