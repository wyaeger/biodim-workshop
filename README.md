# biodim-workshop
Repo for the metagenomics workshop at the BIODIM/SATREPS molecular techniques course, taught at UNAS in February 2025.

This workshop uses data and code from the **[Bioinformatic Methods for Biodiversity Metabarcoding tutorial]([url](https://learnmetabarcoding.github.io/LearnMetabarcoding/index.html))**


# Instrucciones para que los estudiantes accedan al GitHub Codespace

¡Bienvenidos al taller de bioinformática! Para acceder y trabajar en el entorno de codificación preconfigurado, sigue los siguientes pasos:

## 1. Asegúrate de tener una cuenta en GitHub
Antes de acceder a Codespace, necesitas una cuenta de GitHub. Si aún no tienes una, regístrate en [https://github.com/](https://github.com/).

## 2. Accede al repositorio del taller
1. Abre un navegador web y dirígete al **repositorio de GitHub** que contiene los materiales del taller.
2. Haz clic en el botón **"Code"** cerca de la parte superior derecha de la página del repositorio.
3. Selecciona la pestaña **"Codespaces"**.
4. Haz clic en **"Create codespace on main"** (o en otra rama si se indica).

## 3. Espera a que Codespace se inicialice
- Puede tardar unos minutos en configurarse.
- Una vez cargado, verás una interfaz de **VS Code** ejecutándose en tu navegador.

## 4. Verifica la configuración
Para asegurarte de que todo está instalado correctamente:
1. Abre el **terminal** en Codespace haciendo clic en **"Terminal" > "New Terminal"** en la barra de menú.
2. Ejecuta el siguiente comando para comprobar las herramientas instaladas:
   ```bash
   fastqc --version
   blastn -version
   vsearch --version
   ```
3. Navega hasta el directorio de datos:
   ```bash
   cd /workspaces/biodim-workshop/data
   ls
   ```
   Deberías ver los archivos de datos descargados y extraídos.

## 5. Ejecutar comandos de bioinformática
- Usa el **terminal** para ejecutar herramientas de bioinformática como FastQC, BLAST y VSEARCH.
- Ejemplo de comando:
   ```bash
   fastqc sectionA/*.fastq
   ```

## 6. Guardar tu trabajo
- Cualquier cambio que realices dentro de Codespace es **temporal**, a menos que lo confirmes en GitHub.
- Si es necesario, usa Git para confirmar y subir cambios:
   ```bash
   git add .
   git commit -m "Progreso de mi análisis"
   git push origin main
   ```

## 7. Actualizar el Codespace con los últimos cambios
Si el instructor ha actualizado el repositorio y deseas obtener los cambios más recientes en tu Codespace, sigue estos pasos:
1. Asegúrate de estar en la rama principal:
   ```bash
   git checkout main
   ```
2. Descarga los cambios más recientes del repositorio:
   ```bash
   git pull origin main
   ```
3. Si hay nuevos archivos, verifica su presencia con:
   ```bash
   ls
   ```

## 8. Salir y reanudar tu Codespace
- Puedes cerrar la ventana del navegador cuando termines; tu Codespace guardará su estado.
- Para reanudarlo, regresa a la pestaña **Codespaces** del repositorio y vuelve a abrir tu sesión.

## 9. Solución de problemas
- Si encuentras errores, intenta reiniciar el Codespace.
- Si falta alguna herramienta, reinstálala usando:
   ```bash
   sudo apt update && sudo apt install <nombre-del-paquete>
   ```
- Contacta al instructor para obtener más ayuda.
