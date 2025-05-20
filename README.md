# 🗂️ backup_ftp.sh

Script en Bash para **clasificar archivos por extensión**, **crear una copia comprimida (ZIP)** y **subirla automáticamente a un servidor FTP**.

---

## 📌 ¿Qué hace este script?

1. Crea tres carpetas locales: `imagenes/`, `videos/` y `documentos/`
2. Recorre todos los archivos del directorio actual y los mueve según su extensión:
   - A `documentos/` → `.pdf`, `.docx`, `.xlsx`, `.csv`
   - A `imagenes/` → `.jpg`, `.png`
   - A `videos/` → `.mp4`
3. Genera un archivo `copia_seguridad.zip` con el contenido de esas carpetas.
4. Sube el `.zip` a un servidor FTP usando `curl`.

## ⚙️ Requisitos

- Bash (cualquier sistema Linux/macOS o WSL en Windows)
- `zip` y `curl` instalados:
  ```bash
  sudo apt install zip curl
  
## 📁 Estructura generada
<pre>
📂 tu_carpeta
├── backup_ftp.sh
├── copia_seguridad.zip
├── documentos/
├── imagenes/
└── videos/ </pre>

## 🔐 Configuración del FTP
El script incluye variables que debes modificar con los datos reales de tu servidor:

<pre>
servidor='172.20.10.2'
usuario='tu-usuario'
contrasena='tu-contraseña'
archivo_remoto='/ruta/remota/copia_seguridad.zip'
</pre>
⚠️ Evita guardar contraseñas en texto plano. Mejor usa variables de entorno o .netrc.

## 🖥️ Ejecución
Haz el script ejecutable y ejecútalo:
<pre>
chmod +x backup_ftp.sh
./backup_ftp.sh
</pre>

## 🧑‍💻 Autor
- **Jorge Garrido**
- Versión: 1.0
- Fecha: 2025-05-20
