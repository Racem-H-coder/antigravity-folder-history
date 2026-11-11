@echo off
echo ========================================================
echo Test de detection depuis le sous-dossier: backend\api
echo Antigravity va remonter l'arborescence pour trouver
echo l'historique du projet parent!
echo ========================================================
echo.
powershell -ExecutionPolicy Bypass -File "..\..\..\scripts\find_history.ps1" -StartPath .
echo.
pause

