rm movimientos_validos.log pares.log coords.log #borra los logs creados la vez anterior 

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # Sin color

asd=1
nivel=1
((nivel_siguiente=nivel+1))
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
 case $((1 + RANDOM % 7)) in
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

pregunta_comandos() {
    comandos=(
        "ls"
        "ls -a"
        "ls -l"
        "pwd"
        "whoami"
        "cat archivo.txt"
        "cat > archivo.txt"
        "cat >> archivo.txt"
        "df -h"
        "du -sh"
        "echo Hola"
        "touch nuevo.txt"
        "chmod 600 archivo.txt"
        "chmod u=rw,go=r archivo.txt"
        "cp archivo.txt copia.txt"
        "mv archivo.txt carpeta/"
        "mkdir nueva_carpeta"
        "mkdir -p 1/aa/e"
        "free -h"
        "find . -name '*.sh'"
        "grep root /etc/passwd"
        "grep -i usuario /etc/passwd"
        "grep -v bash /etc/passwd"
        "head archivo.txt"
        "tail archivo.txt"
        "tail -n 5 archivo.txt"
        "tail -n+5 archivo.txt"
        "date"
        "nano ejemplo.txt"
        "man ls"
        "read nombre"
        "read -s clave"
        "read -n 4 codigo"
        "sort archivo.txt"
        "sort -k 2 archivo.txt"
        "sort -n archivo.txt"
        "sort -r archivo.txt"
        "sort -u archivo.txt"
        "sort -t , archivo.csv"
        "stat archivo.txt"
        "tree"
        "tr 'a-z' 'A-Z' < archivo.txt"
        "tr -d ' ' < archivo.txt"
        "tr -s ' ' < archivo.txt"
        "uniq archivo.txt"
        "uptime"
        "wc archivo.txt"
        "wc -c archivo.txt"
        "wc -l archivo.txt"
        "wc -w archivo.txt"
    )
    descripciones=(
        "Muestra todos los archivos del directorio actual"
        "Muestra archivos, incluyendo ocultos, del directorio actual"
        "Muestra archivos del directorio actual en formato largo"
        "Muestra el directorio actual"
        "Muestra el usuario actual"
        "Muestra el contenido de archivo.txt"
        "Crea archivo.txt con texto desde la terminal"
        "Agrega texto al final de archivo.txt"
        "Muestra el uso del disco en formato legible"
        "Muestra el espacio utilizado por la carpeta actual"
        "Muestra el mensaje Hola"
        "Crea un archivo vacío llamado nuevo.txt"
        "Asigna permisos 600 a archivo.txt"
        "Permite solo rw a usuario, solo r a grupo y otros para archivo.txt"
        "Copia archivo.txt en copia.txt"
        "Mueve archivo.txt al directorio carpeta/"
        "Crea una carpeta llamada nueva_carpeta"
        "Crea directorios y subdirectorios 1/aa/e"
        "Muestra memoria libre/ocupada en formato legible"
        "Busca todos los archivos .sh en el directorio actual y sus subdirectorios"
        "Busca la palabra root en /etc/passwd"
        "Busca la palabra usuario (no distingue mayúsculas/minúsculas) en /etc/passwd"
        "Muestra líneas de /etc/passwd que NO contengan la palabra bash"
        "Muestra las primeras líneas de archivo.txt"
        "Muestra las últimas líneas de archivo.txt"
        "Muestra las últimas 5 líneas de archivo.txt"
        "Muestra desde la línea 5 en adelante de archivo.txt"
        "Muestra la fecha y hora actual"
        "Edita el archivo ejemplo.txt con el editor nano"
        "Muestra el manual de uso del comando ls"
        "Lee una variable llamada nombre desde terminal"
        "Lee una variable clave en forma oculta"
        "Lee un código de 4 caracteres como máximo"
        "Ordena las líneas de archivo.txt"
        "Ordena archivo.txt por la segunda columna"
        "Ordena archivo.txt numéricamente"
        "Ordena archivo.txt en orden inverso"
        "Ordena archivo.txt mostrando solo líneas únicas"
        "Ordena archivo.csv separando por coma"
        "Muestra información detallada de archivo.txt"
        "Muestra el árbol de directorios"
        "Convierte el contenido de archivo.txt a mayúsculas"
        "Elimina los espacios de archivo.txt"
        "Reemplaza espacios múltiples por uno solo en archivo.txt"
        "Muestra solo líneas únicas de archivo.txt"
        "Muestra cuánto tiempo lleva encendido el sistema"
        "Muestra el número de líneas, palabras y caracteres en archivo.txt"
        "Muestra el número de caracteres en archivo.txt"
        "Muestra el número de líneas en archivo.txt"
        "Muestra el número de palabras en archivo.txt"
    )
    comando_eleccion=$((RANDOM % ${#comandos[@]}))
    echo "Haz completado el nivel $nivel! Responde correctamente para pasar al nivel $nivel_siguiente:"
    echo "${descripciones[$comando_eleccion]}"
    read -p "Comando: " respuesta
    if [[ "$respuesta" == "${comandos[$comando_eleccion]}" ]]; then
        echo "La respuesta es correcta, bien hecho!"
	sleep 2
	clear_screen
	((nivel=nivel+1))
	((nivel_siguiente=nivel+1))
	tiponivel
	draw_maze
	else
	echo "La respuesta es incorrecta. Hazlo mejor para la próxima!"
	echo ""
	echo "El comando correcto era:"
	echo "${comandos[$comando_eleccion]}"
	sleep 5
	clear_screen
	exit 0
    fi
}


mostrar_cron() {
    echo "Tareas programadas (dentro del archivo crontab.txt):"
    cat crontab.txt
	echo ""
	echo ""
    echo "Puedes agregar tareas usando 'crontab crontab.txt'"

	echo ""
	echo ""

	read -p "Quieres ver la lista de tareas programadas en todo tu sistema? (s/n)" opcioncron
	if [[ $opcioncron = "s" || $opcioncron = "S" ]]; then
	echo "Tareas programadas en tu sistema:"
	crontab -l
	else
	echo "Ok"
	fi
	echo "Volviendo al juego..."
	sleep 3
	clear_screen
	draw_maze
}

monitoreo_sistema() {
	clear_screen
    echo "Monitoreo de Usuarios Conectados y Recursos:"
    who
    echo "--------------------"
    echo "Procesos actuales:"
    ps -e --sort=-%mem | head -10
    echo "--------------------"
    echo "Uso de disco:"
    df -h
    echo "--------------------"
    echo "Uso por directorio actual:"
    du -sh .
	echo "Presiona ${GREEN}ENTER${NC} para volver"
	read -p ""
	clear_screen
	draw_maze
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
    echo -e "Controles: ${GREEN}W${NC}=Arriba ${GREEN}S${NC}=Abajo ${GREEN}A${NC}=Izquierda ${GREEN}D${NC}=Derecha ${RED}M${NC}=Monitoreo ${RED}C${NC}=Crons ${RED}Q${NC}=Salir"
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
		
		echo "$moves" | tee -a moves.log | wc -l > total_lineas.log # Captura los movimientos del jugador con 2 tuberías
		echo "$key" | grep -E '^[wasdWASD]$' >> movimientos_validos.log # Detecta movimientos válidos (w/a/s/d)
		echo "pos=($player_x,$player_y)" | grep -E '^\pos=\([0-9]+,[0-9]+\)$' >> coords.log # Detecta si el output del juego contiene coordenadas
		echo "$moves" | grep -E '^[0-9]*[02468]$' >> pares.log # Detecta movimientos pares
        
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
		
		if [ "$key" = "m" ] || [ "$key" = "M" ]; then
			clear_screen
            monitoreo_sistema
        fi

		if [ "$key" = "c" ] || [ "$key" = "C" ]; then
			clear_screen
            mostrar_cron
        fi
		
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
            echo "Presiona ${GREEN}ENTER${NC} para responder preguntas, tienes 1 sola oportunidad..."
	    	read -p ""
			clear_screen
			preguntas
			draw_maze
        fi

        if [ $result -eq 1 ]; then
			clear_screen
            pregunta_comandos
        fi
    done
}

# Iniciar el juego
clear_screen
echo "Bienvenido a ${CYAN}WinSurf${NC}"
sleep 3
clear_screen
echo "Tu computadora ha sido ${RED}hackeada${NC}"
sleep 3
clear_screen
echo "¡Pero todavía no está todo acabado!"
sleep 3
clear_screen
echo "Resuelve ejercicios y ve ${GREEN}recuperando${NC} tus datos"
sleep 3
clear_screen
echo "Estás listo? Presiona ${GREEN}ENTER${NC} para comenzar..."
read -p ""

tiponivel
game_loop
