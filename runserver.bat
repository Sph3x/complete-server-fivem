@echo OFF
RMDIR /s /q "c:\server-gekko\cache\files"
echo Appuyez sur une TOUCHE pour lancer votre serveur
echo -
pause > nul
CLS
cd C:\Users\Administrateur\Desktop\Dawnstar
cmd /k C:\Users\Administrateur\Desktop\Dawnstar\server\run.cmd +exec server.cfg