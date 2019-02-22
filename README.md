# The KSYS-Cloud
KSYS Cloud Infrastructure by Docker Swarm
- Proxy : traefik
- Management : portainer, swarmpit, registry
- Logging : graylog
- Monitoring : prometheus, grafana
- ELK : 

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
## 1.2 Create a single Swarm in Docker Desktop (Windows 10)
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

* Grafana () : 
  * [http://localhost:8301](http://localhost:8301)


## 3. Reference
* https://github.com/stefanprodan/swarmprom
* https://github.com/deviantony/docker-elk
* https://github.com/uschtwill/docker_monitoring_logging_alerting
* https://github.com/imixs/imixs-cloud
* https://github.com/vegasbrianc/prometheus
* https://github.com/wrouesnel/postgres_exporter
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

