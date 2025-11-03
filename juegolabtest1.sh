# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # Sin color

asd=1
nivel=1
opcionPreg=0
respuesta=""

# Posición inicial del jugador
player_x=1
player_y=1

# Posición de la meta
goal_x=18
goal_y=9

# Contador de movimientos
moves=0

# Laberinto (0=camino, 1=pared)
preguntas(){
 case $((1 + RANDOM % 7)) in #agarra un numero del 1 al 7, en realidad es del 0 al 6 pero como le sumo +1 queda del 1 al 7
 1)
 	echo "¿Para qué sirven las ${GREEN}tuberías${NC} o ${GREEN}pipelines${NC}?"
	echo "a) Conectar salidas de un comando con entradas del siguiente"
	echo "b) Crear un script"
	echo "c) Sobreescribir un archivo .txt"
    	read -p "" respuesta

	if [[ $respuesta = "a" || $respuesta = "A" ]]; then
	echo "La respuesta es correcta, bien hecho!"
	sleep 2
	else
	echo "La respuesta es incorrecta. Hazlo mejor para la próxima!"
	sleep 2
	clear_screen
	exit 0
	fi
	
    ;;
  2)
    	echo "¿Qué debe ir ${YELLOW}siempre${NC} al comenzar un script en ${GREEN}bash${NC}?"
	echo "a) bin-bash:"
	echo "b) script.sh"
	echo "c) #!/bin/bash"
    	read -p "" respuesta

	if [[ $respuesta = "c" || $respuesta = "C" ]]; then
	echo "La respuesta es correcta, bien hecho!"
	sleep 2
	else
	echo "La respuesta es incorrecta. Hazlo mejor para la próxima!"
	sleep 2
	clear_screen
	exit 0
	fi
    ;;
  3)
    	echo "¿Qué hace el comando base ${GREEN}wc${NC}?"
	echo "a) Cambia, borra o comprime caracteres"
	echo "b) Muestra las últimas líneas de un archivo"
	echo "c) Cuenta la cantidad de líneas, palabras y carácteres que tiene un archivo"
    	read -p "" respuesta

	if [[ $respuesta = "c" || $respuesta = "C" ]]; then
	echo "La respuesta es correcta, bien hecho!"
	sleep 2
	else
	echo "La respuesta es incorrecta. Hazlo mejor para la próxima!"
	sleep 2
	clear_screen
	exit 0
	fi
    ;;

 4)
    	echo "¿En los operadores de comparación ${GREEN}-ge${NC} es…?"
	echo "a) destino de"
	echo "b) mayor que"
	echo "c) mayor o igual que"
    	read -p "" respuesta

	if [[ $respuesta = "c" || $respuesta = "C" ]]; then
	echo "La respuesta es correcta, bien hecho!"
	sleep 2
	else
	echo "La respuesta es incorrecta. Hazlo mejor para la próxima!"
	sleep 2
	clear_screen
	exit 0
	fi
    ;;

 5)
    	echo "¿El comando ${GREEN}for${NC} es un…?"
	echo "a) contador"
	echo "b) acumulador"
	echo "c) condición"
    	read -p "" respuesta

	if [[ $respuesta = "b" || $respuesta = "B" ]]; then
	echo "La respuesta es correcta, bien hecho!"
	sleep 2
	else
	echo "La respuesta es incorrecta. Hazlo mejor para la próxima!"
	sleep 2
	clear_screen
	exit 0
	fi
    ;;

 6)
    	echo "¿Qué es ${GREEN}||${NC}?"
	echo "a) and"
	echo "b) not"
	echo "c) or"
    	read -p "" respuesta

	if [[ $respuesta = "c" || $respuesta = "C" ]]; then
	echo "La respuesta es correcta, bien hecho!"
	sleep 2
	else
	echo "La respuesta es incorrecta. Hazlo mejor para la próxima!"
	sleep 2
	clear_screen
	exit 0
	fi
    ;;

7)
    	echo "¿Qué es un ${GREEN}Sistema Operativo${NC}?"
	echo "a) Un sistema operativo es un programa que actúa como intermediario entre el usuario y el hardware de la computadora"
	echo "b) Un sistema operativo es un administrador de tareas, archivos que ayudan al Usuario"
	echo "c) Es un conjunto de aplicaciones que ayudan en el manejo del hardware a la hora de hacer tareas: como navegar en internet, editar textos o mirar videos"
    	read -p "" respuesta

	if [[ $respuesta = "a" || $respuesta = "A" ]]; then
	echo "La respuesta es correcta, bien hecho!"
	sleep 2
	else
	echo "La respuesta es incorrecta. Hazlo mejor para la próxima!"
	sleep 2
	clear_screen
	exit 0
	fi
    ;;
    
  *)
    echo "Opcion no valida"
    ;;
esac
}

tiponivel(){
moves=0

if [ $nivel -eq 1 ]; then
player_x=1
        player_y=1
maze=(
    "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 X 1"
    "1 0 0 0 1 0 0 0 3 0 0 0 0 0 1 0 0 0 0 1"
    "1 0 1 0 1 0 1 1 1 1 1 1 1 0 1 0 1 1 0 1"
    "1 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 1"
    "1 0 1 1 1 1 1 1 1 0 1 0 1 1 1 1 0 1 0 1"
    "1 3 0 0 0 0 0 0 1 0 0 0 1 0 3 0 0 1 0 1"
    "1 1 1 1 1 0 1 0 1 1 1 1 1 0 1 1 1 1 0 1"
    "1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 1"
    "1 0 1 1 1 1 1 1 1 1 1 1 1 0 1 0 1 1 1 1"
    "1 0 0 0 0 0 0 0 3 0 0 0 0 0 1 0 0 0 0 X"
    "1 X 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
)
elif [ $nivel -eq 2 ]; then
player_x=1
        player_y=1

maze=(
"1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
"1 0 3 0 1 0 0 0 1 0 0 0 0 0 1"
"1 1 1 0 1 0 1 1 1 0 1 1 1 0 1"
"1 0 0 0 0 3 0 0 0 0 1 0 1 0 1"
"1 0 1 1 1 1 1 1 1 0 1 0 3 0 1"
"1 0 1 0 1 0 0 0 1 0 1 0 1 0 1"
"1 0 1 0 1 0 1 0 1 0 1 0 1 0 X"
"1 0 1 0 1 0 1 3 1 0 1 0 1 0 1"
"1 0 0 0 1 0 0 0 0 0 3 0 0 0 1"
"1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
)
elif [ $nivel -eq 3 ]; then
player_x=1
        player_y=1
maze=(

    "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 X 1"
    "1 0 0 0 1 0 0 0 3 0 0 0 0 0 1 0 0 0 0 1"
    "1 0 1 0 1 0 1 1 1 1 1 1 1 0 1 0 1 1 0 1"
    "1 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 1"
    "1 0 1 1 1 1 1 1 1 0 1 0 1 1 1 1 0 1 0 1"
    "1 3 0 0 0 0 0 0 1 0 0 0 1 0 3 0 0 1 0 1"
    "1 1 1 1 1 0 1 0 1 1 1 1 1 0 1 1 1 1 0 1"
    "1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 1"
    "1 0 1 1 1 1 1 1 1 1 1 1 1 0 1 0 1 1 1 1"
    "1 0 0 0 0 0 0 0 3 0 0 0 0 0 1 0 0 0 0 X"
    "1 X 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
)
fi
}


# Función para limpiar la pantalla
clear_screen() {
    clear
}

# Función para obtener el valor en una posición del laberinto
get_cell() {
    local y=$1
    local x=$2
    local row="${maze[$y]}"
    local cell=$(echo $row | cut -d' ' -f$((x+1)))
    echo "$cell"
}

# Función para dibujar el laberinto
draw_maze() {
    clear_screen
    echo -e "${CYAN}╔════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║            Nivel $nivel - winSurf           ║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════╝${NC}"
    echo ""
    
    for y in "${!maze[@]}"; do
        local row="${maze[$y]}"
        local output=""
        local x=0
        
        for cell in $row; do
            if [ $x -eq $player_x ] && [ $y -eq $player_y ]; then
                output+="${GREEN}@${NC} "
            elif [ "$cell" = "1" ]; then
                output+="${BLUE}█${NC} "
	elif [ "$cell" = "3" ]; then
                output+="${RED}#${NC} "
            elif [ "$cell" = "X" ]; then
                output+="${YELLOW}X${NC} "
            else
                output+="  "
            fi
            ((x++))
        done
        
        echo -e "$output"
    done
    
    echo -e "Debes llegar a las X sin pasar por los virus(#) si es que no quieres preguntas"
    echo ""
    echo -e "${CYAN}Movimientos: ${moves}${NC}"
    echo ""
    echo -e "Controles: ${GREEN}W${NC}=Arriba ${GREEN}S${NC}=Abajo ${GREEN}A${NC}=Izquierda ${GREEN}D${NC}=Derecha ${RED}Q${NC}=Salir"
    echo -e "Objetivo: Llega a la ${YELLOW}X${NC}"
    echo ""
}

# Función para mover al jugador
move_player() {
    local new_x=$player_x
    local new_y=$player_y
    
    case $1 in
        w|W) ((new_y--)) ;;
        s|S) ((new_y++)) ;;
        a|A) ((new_x--)) ;;
        d|D) ((new_x++)) ;;
    esac
    
    # Verificar colisión con paredes
    local cell=$(get_cell $new_y $new_x)
    
    if [ "$cell" != "1" ]; then
        player_x=$new_x
        player_y=$new_y
        ((moves++))
        
	# Verificar si toca un virus
        if [ "$cell" = "3" ]; then
            return 2
        fi
        # Verificar si llegó a la meta
        if [ "$cell" = "X" ]; then
            return 1
        fi
    fi
    
    return 0
}

# Función principal del juego
game_loop() {
    draw_maze
    
    while true; do
        read -n1 -s key
        
        if [ "$key" = "q" ] || [ "$key" = "Q" ]; then
            clear_screen
            echo -e "${RED}Te has rendido${NC}"
            echo -e "Movimientos realizados: ${moves}"
            exit 0
        fi
        
        move_player "$key"
        local result=$?
        
        draw_maze
        
	if [ $result -eq 2 ]; then
            echo -e "${RED}¡Haz impactado contra un virus!${NC}"
            echo ""
            read -p "Presiona ENTER para responder preguntas, tienes 1 sola oportunidad..."
	clear_screen
	preguntas
	draw_maze
		
        fi

        if [ $result -eq 1 ]; then
            echo -e "${GREEN}¡¡¡FELICIDADES!!! ¡Has completado el nivel $nivel!${NC}"
            echo -e "Movimientos totales: ${YELLOW}${moves}${NC}"
            echo ""
            read -p "Presiona ENTER para pasar al siguiente..."
            ((nivel=nivel+1))
		tiponivel
		draw_maze
        fi
    done
}

# Iniciar el juego

clear_screen
echo "Bienvenido a ${CYAN}WinSurf${NC}"
#sleep 3
clear_screen
echo "Tu computadora ha sido ${RED}hackeada${NC}"
#sleep 3
clear_screen
echo "¡Pero todavía no está todo acabado!"
#sleep 3
clear_screen
echo "Resuelve ejercicios y ve ${GREEN}recuperando${NC} tus datos"
#sleep 3
clear_screen
echo "Estás listo? Presiona ${GREEN}ENTER${NC} para comenzar..."
read -p ""

tiponivel
game_loop

