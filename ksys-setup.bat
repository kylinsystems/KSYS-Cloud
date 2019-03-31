REM ######################################################
REM Installing KSYS Docker Cloud
REM ######################################################
REM ......................................................

REM ######################################################
REM Creating data volume...
REM ######################################################
REM docker volume create --name=ksys_swarmpit_db_data
docker volume create --name=ksys_portainer_data
docker volume create --name=ksys_grafana_data
docker volume create --name=ksys_prometheus_data

REM ######################################################
REM Creating separate docker network...
REM ######################################################
docker network create -d overlay --attachable ksys_front_net

REM ######################################################
REM Build & Pulling images...
REM ######################################################
docker-compose -f proxy/traefik/docker-stack.yml pull traefik
REM docker-compose -f management/swarmpit/docker-stack.yml pull app db agent
docker-compose -f management/portainer/docker-stack.yml pull portainer agent
REM docker-compose -f monitoring/docker-stack.yml pull prometheus alertmanager node-exporter cadvisor grafana 
REM docker-compose -f logging/docker-stack.yml pull curator elastalert elasticsearch kibana logstash master-filebeat
REM docker-compose -f elk/docker-stack.yml pull elasticsearch logstash kibana

cd ldap/lam 
docker build -t kylinsystems/ksys-lam .
cd ../..
docker-compose -f ldap/docker-stack.yml pull openldap phpldapadmin

REM ######################################################
REM Starting stack
REM ######################################################
docker stack deploy -c proxy/traefik/docker-stack.yml ksys-traefik
REM docker stack deploy -c management/swarmpit/docker-stack.yml ksys-swarmpit
docker stack deploy -c management/portainer/docker-stack.yml ksys-portainer
docker stack deploy -c ldap/docker-stack.yml ksys-ldap
REM docker stack deploy -c logging/docker-stack.yml ksys-logging
REM docker stack deploy -c monitoring/docker-stack.yml ksys-monitoring
REM docker stack deploy -c elk/docker-stack.yml ksys-elk


REM ######################################################
REM List all
REM ######################################################
ping -n 10 127.1 >nul
docker network ls
docker volume ls
docker stack ls
docker service ls

REM ......................................................
REM ######################################################
REM Installation finished!
REM ######################################################