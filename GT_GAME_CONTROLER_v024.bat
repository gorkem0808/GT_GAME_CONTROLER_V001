@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo GT GAME CONTROLER V024 baslatiliyor...
if not exist gt_game_controler_v024.py (
  echo HATA: gt_game_controler_v024.py bu klasorde bulunamadi.
  echo ZIP/RAR icinden calistirma. Klasore tamamen cikar.
  pause
  exit /b 1
)
python gt_game_controler_v024.py
if errorlevel 1 (
  py gt_game_controler_v024.py
)
pause
