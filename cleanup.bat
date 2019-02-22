REM ######################################################
REM Uninstalling KBS Docker Cloud
REM ######################################################
REM ......................................................

REM ######################################################
REM Stopping and removing stacks...
REM ######################################################
REM docker stack rm ksys-logging
docker stack rm ksys-monitoring
docker stack rm ksys-portainer
docker stack rm ksys-swarmpit
docker stack rm ksys-traefik

REM ######################################################
REM Removing all stopped containers...
REM ######################################################
ping -n 10 127.1 >nul
docker container prune -f

REM ######################################################
REM Removing data volume...
REM ######################################################

REM ###### Prune all unused volumes 
docker volume prune -f

REM ######################################################
REM Removing network...
REM ######################################################
docker network rm ksys_front_net

REM ######################################################
REM List all
REM ######################################################
docker stack ls
docker volume ls
docker network ls

REM ......................................................
REM ######################################################
REM Uninstall finished!
REM ######################################################