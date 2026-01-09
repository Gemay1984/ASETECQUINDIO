@echo off
echo ========================================================
echo   INICIANDO LUXESTATE - GESTION INMOBILIARIA
echo ========================================================
echo.
echo No cierres esta ventana negra mientras uses la aplicacion.
echo.
echo 1. Espera a que aparezca "Local: http://localhost:5173"
echo 2. Tu navegador deberia abrirse automaticamente.
echo    (Si no se abre, copia el enlace y pegalo en Chrome)
echo.
echo Cargando...
echo.

cd /d "%~dp0"
call npm install
call npx vite --open

pause
