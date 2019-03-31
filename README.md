# The KSYS-Docker-Cloud
KSYS Docker Cloud Infrastructure by Docker Swarm
- Proxy : traefik
- Management : portainer, swarmpit, registry
- LDAP : openldap, phpldapadmin, ldapaccountmanager
- Logging : graylog
- Monitoring : prometheus, grafana
- ELK : Elasticsearch, logstash, Kibana

# Swarm Docker Cluster
Single Node : master and slave in one Docker Node (for testing)
Multiple Node : Nultiple master and slave nodes (for production)

## 1.1 Create a Swarm Cluster (Windows 10/Hyper-V)
https://docs.docker.com/get-started/part4/#create-a-cluster

First, quickly create a virtual switch for your virtual machines (VMs) to share, so they can connect to each other.
1. Launch Hyper-V Manager
2. Click Virtual Switch Manager in the right-hand menu
3. Click Create Virtual Switch of type External
4. Give it the name "My Virtual Switch", and check the box to share your host machine’s active network adapter

Now, create a couple of VMs using our node management tool, docker-machine:
```
docker-machine create -d hyperv --hyperv-virtual-switch "My Virtual Switch" mymanager1
docker-machine --debug --native-ssh create -d hyperv --hyperv-virtual-switch "My Virtual Switch" myworker1
```
## 1.2 Create a single Swarm Node in Docker Desktop (Windows 10)
```
docker swarm init
```

## 2. Usage
* Traefik Dashboard : 
  * [http://localhost:8000](http://localhost:8000)

* Swarmpit (admin/admin) : 
  * [http://localhost:8101](http://localhost:8101)
  * [http://localhost/swarmpit](http://localhost/swarmpit)

* Portainer (admin/portainer) : 
  * [http://localhost:8102](http://localhost:8102)
  * [http://localhost/portainer](http://localhost/portainer)

* Prometheus () : 
  * [http://localhost:8201](http://localhost:8201)

* Grafana (admin/grafana) : 
  * [http://localhost:8202](http://localhost:8202)
  * [http://localhost/grafana](http://localhost/grafana)

* Alertmanager () : 
  * [http://localhost:8203](http://localhost:8203)

* Kibana () : 
  * [http://localhost:8301](http://localhost:8301)

* Phpldapadmin (cn=admin,dc=ldap,dc=example,dc=org/admin) :
  * [http://localhost:8401](http://localhost:8401)

* LdapAccountManager (admin/admin | master password : lam) :
  * [http://localhost:8402](http://localhost:8402)


## 3. Reference
* https://github.com/stefanprodan/swarmprom
* https://github.com/deviantony/docker-elk
* https://github.com/uschtwill/docker_monitoring_logging_alerting
* https://github.com/imixs/imixs-cloud
* https://github.com/vegasbrianc/prometheus
* https://github.com/wrouesnel/postgres_exporter
* https://github.com/osixia/docker-openldap
* https://github.com/osixia/docker-phpLDAPadmin
* https://dzone.com/articles/swarmprom-prometheus-monitoring-for-docker-swarm
* https://www.akamenskiy.com/docker-swarm-ha-setup-production/

### Grafana Dashboard
* Server Overview
https://grafana.com/dashboards/9721
* Container Overview
https://grafana.com/dashboards/9722
* Node Exporter Full
https://grafana.com/dashboards/1860
* postgres-exporter
https://grafana.com/dashboards/455

### OpenLDAP 
Using below ldapsearch script within openldap container to test LDAP user, replace [CONTAIENR ID] with real ID. 

Or you may connect to openldap container console in Portainer, then ldapsearch in console directly.

```
docker exec [CONTAINER ID] ldapsearch -x -H ldap://localhost -b dc=ldap,dc=example,dc=org -D "cn=admin,dc=ldap,dc=example,dc=org" -w admin
```

### LDAP Account Manager
Change [LAM Configuration] -> [Edit Server Profiles]
