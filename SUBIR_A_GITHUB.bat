@echo off
set /p repoUrl="Introduce la URL de tu repositorio GitHub (ej: https://github.com/usuario/repo.git): "

if "%repoUrl%"=="" (
    echo Error: No has introducido ninguna URL.
    pause
    exit
)

echo Inicializando Git...
git init
git add .
git commit -m "Lanzamiento inicial Asetec del Quindio - Version 1.0"
git branch -M main
git remote add origin %repoUrl%
git push -u origin main

echo.
echo ========================================================
echo ¡Subida completada!
echo Ahora ve a Vercel.com e importa este proyecto.
echo ========================================================
pause
