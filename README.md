# Proyecto Final - Sistemas Operativos

**Proyecto realizado por:**  
Alexander Bogorodskiy  
Karlos Martinez  
Salvador Medina  
Franco Pereira

---

## Cómo correr el juego?

1. **Descarga** los archivos `winsurf.sh` y `crontab.txt`.
2. **Colócalos** en la misma carpeta.
3. Abre la terminal y **sitúate en el directorio** donde guardaste los archivos:
    ```
    cd /ruta/del/directorio
    ```
4. **Dale permisos de ejecución** al script:
    ```
    chmod u=rwx winsurf.sh
    ```
5. **Ejecuta el programa**:
    ```
    ./winsurf.sh
    ```

---

## Requerimientos

- Tener acceso a la terminal (bash).
- Permisos para ejecutar scripts.
- Los archivos necesarios en el mismo directorio.

---

## Comandos que aparecen en el juego (función `pregunta_comandos`)

Los siguientes comandos de Linux son preguntados como desafíos en el juego (tenlos en cuenta para avanzar dentro del juego :] ):  

- `bash -x nombreScript.sh`
- `cat archivo.txt`
- `cat > archivo.txt`
- `cat >> archivo.txt`
- `cd`
- `cd ..`
- `chmod 600 archivo.txt`
- `chmod u=rw,go=r archivo.txt`
- `cp archivo.txt copia.txt`
- `cut archivo.txt`
- `cut -d: -f2 archivo.txt`
- `cut -f 3 archivo.txt`
- `date`
- `df -h`
- `du -sh .`
- `echo Hola`
- `find . -name '*.sh'`
- `free -h`
- `grep root /etc/passwd`
- `grep -E '^a' archivo.txt`
- `grep -i usuario /etc/passwd`
- `grep -n palabra archivo.txt`
- `grep -v bash /etc/passwd`
- `head archivo.txt`
- `ls`
- `ls -a`
- `ls -l`
- `man ls`
- `man grep`
- `man nano`
- `mkdir carpetaX`
- `mkdir -p 1/aa/e`
- `mv archivo.txt carpeta/`
- `nano ejemplo.txt`
- `pwd`
- `read nombre`
- `read -s clave`
- `read -n 4 codigo`
- `sort archivo.txt`
- `sort -k 2 archivo.txt`
- `sort -n archivo.txt`
- `sort -r archivo.txt`
- `sort -t , archivo.csv`
- `sort -u archivo.txt`
- `stat archivo.txt`
- `tail archivo.txt`
- `tail -n 5 archivo.txt`
- `tail -n+5 archivo.txt`
- `tee -a moves.log`
- `touch nuevo.txt`
- `tr 'a-z' 'A-Z' < archivo.txt`
- `tr -c 'A-Za-z' '[*]' < archivo.txt`
- `tr -d ' ' < archivo.txt`
- `tr -s ' ' < archivo.txt`
- `tree`
- `uniq archivo.txt`
- `uptime`
- `wc archivo.txt`
- `wc -c archivo.txt`
- `wc -l archivo.txt`
- `wc -w archivo.txt`
- `whoami`

---

## Descripción de niveles, objetivos y condiciones de victoria

El juego cuenta con 3 niveles, los cuales tienen como objetivo llegar a la "X" (la meta de cada nivel). Una vez llegado a la meta, el juego te hará escribir un comando de linux basado en una descripción. Si el usuario responde bien pasará de nivel y si no, perderá. Esto hasta llegar al tercer nivel, en el cual si llegas a la meta (en esta vez de color verde), el juego te dará las felicitaciones y te dirá la cantidad de movimientos hechos en total.
En cada mapa habrán trampas "#", que tendrán preguntas extra. Si caes encima de ellas te mostrará una pregunta múltiple opción, en la cual si respondes bien podrás seguir y si respondes mal, perderás.

---

## Cómo reproducir cron/at 

El juego contiene una sección de crontab dándole a la tecla C mientras se ejecuta el juego. Esa sección te mostrará qué crons hay activos y un comando para que el usuario pueda agregar más. Además, te mostrará un pregunta sobre si quieres ver los crontabs activos de tu pc en general.
