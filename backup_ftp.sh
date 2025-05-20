#!/bin/bash

# Colores en negrita
BOLD_MAGENTA="\033[1;35m"
BOLD_CYAN="\033[1;36m"

# Reset (importante para cerrar el color)
RESET="\033[0m"

# Nombre Script
echo -e "$BOLD_CYAN"
cat << "EOF"

 /$$$$$$$   /$$$$$$   /$$$$$$  /$$   /$$ /$$   /$$ /$$$$$$$        /$$$$$$$$ /$$$$$$$$ /$$$$$$$ 
| $$__  $$ /$$__  $$ /$$__  $$| $$  /$$/| $$  | $$| $$__  $$      | $$_____/|__  $$__/| $$__  $$
| $$  \ $$| $$  \ $$| $$  \__/| $$ /$$/ | $$  | $$| $$  \ $$      | $$         | $$   | $$  \ $$
| $$$$$$$ | $$$$$$$$| $$      | $$$$$/  | $$  | $$| $$$$$$$/      | $$$$$      | $$   | $$$$$$$/
| $$__  $$| $$__  $$| $$      | $$  $$  | $$  | $$| $$____/       | $$__/      | $$   | $$____/ 
| $$  \ $$| $$  | $$| $$    $$| $$\  $$ | $$  | $$| $$            | $$         | $$   | $$      
| $$$$$$$/| $$  | $$|  $$$$$$/| $$ \  $$|  $$$$$$/| $$            | $$         | $$   | $$      
|_______/ |__/  |__/ \______/ |__/  \__/ \______/ |__/            |__/         |__/   |__/    

					backup_ftp.sh - v1.0
				       Autor -> Jorge Garrido

EOF
echo -e "$RESET"
# Creación de carpetas
mkdir -p imagenes videos documentos

for archivo in *
do
	# Obtener el nombre base del archivo sin la ruta
	nombre_archivo=$(basename "$archivo")

	# Obtener la extensión del archivo usando awk
	extension=$(echo "$nombre_archivo" | awk -F '.' '{print $NF}')

	# Mover el archivo a la carpeta correspondiente según su  extensión
	case "$extension" in
		docx|pdf|csv|xlsx)
			mv "$archivo" documentos/
			echo "Movido el $archivo a la carpeta documentos"
			;;
		jpg|png)
			mv "$archivo" imagenes/
			echo "Movido el $archivo a la carpeta imágenes"
			;;
		mp4)
			mv "$archivo" videos/
			echo "Movido el $archivo a la carpeta videos"
			;;
		*)
			echo "Archivo $archivo no se movió porque la extensión es desconocida"
			;;
	esac
done

# Comprimir todas las carpetas con sus archivos en un .zip
zip -r copia_seguridad.zip imagenes/ videos/ documentos/

# IP, Usuario y Contraseña para iniciar sesión al servidor FTP
servidor='172.20.10.2'
usuario='jorge-server'
password='Jgz02716263'

# Ruta del archivo que queremos subir al Servidor FTP
ruta_archivo_local=copia_seguridad.zip

# Ruta donde queremos subir el archivo en el Servidor FTP
archivo_remoto='/home/jorge-server/copia_seguridad.zip'

# Comando para subir el archivo
curl -u "$usuario:$password" -T "$ruta_archivo_local" ftp://$servidor/$archivo_remoto
