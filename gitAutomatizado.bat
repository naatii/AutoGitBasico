@echo off
echo.
set/p direccion= indique el path del repo:  
cls
echo.
cd %direccion%
git init
echo.
git add *
cls
set/p comentario= indique el comentario del commit:  
echo.
set/p origin= Por ultimo, indique la ruta del repositorio en GitHub: 
git commit -m %comentario%

:pregunta
@ECHO.1.- push 
@ECHO.2.- merge 
@ECHO.3.- stash
@ECHO.4.- ayuda
@ECHO.5.- salir
:pregunta

set/p pregunta= ¿Que quieres hacer? 
if %pregunta% == 1 goto pusheo 
if %pregunta% == 2 goto mergeo 
if %pregunta% == 3 goto stasheo 
if %pregunta% == 4 goto ayuda 
if %pregunta% == 5 goto salir
:pusheo
git remote add origin main %origin%
git branch -M main
git push -u origin main
echo.
cls

goto pregunta
:mergeo
@echo.Mostrando las ramas disponibles...
git branch
set/p rama=¿Indique el nombre de la rama?
git merge %rama%
echo.

goto pregunta
:stasheo
git stash
echo.

goto ayuda
echo.
:ayuda
echo Esta es la ayuda del programa AutoGit por Natalia Cortés: 
echo    -1 push (Sube el repositorio a GitHub)
echo    -2 merge (Fusiona ramas)
echo    -3 stash (Guarda todos los cambios en un buffer)        
echo    -4 salir (Sale del programa)

goto pregunta
echo.
:salir
echo Pulsa una tecla para salir.
pause>nul
exit