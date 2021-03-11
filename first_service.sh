# this will show swarm as inactive 
docker info 

# activate swarm
docker swarm init

# swarm active, one node and it is the manager
docker info

# part of the output:
# Server:
#  Swarm: active
#   NodeID: 5i9pqvrodkmal6a72tqygw5jm
#   Is Manager: true
#   ClusterID: 1lgbeqn0e47cn6uor9nn3dlxr
#   Managers: 1
#   Nodes: 1
#   Default Address Pool: 10.0.0.0/8  
#   SubnetSize: 24
#   Data Path Port: 4789
#   Orchestration:
#    Task History Retention Limit: 5
#   Manager Addresses:
#    192.168.2.16:2377


# create a service with random name and the command "ping 8.8.8.8"
docker service create alpine ping 8.8.8.8

# list our new service only, with a random name as we didnt define one
docker service ls 

# list the just created container
docker container ls

# The below code is commented as it relies on fixed ids that wont exist when running this script

# update the given service's replicas to 3 
# docker service update z994oyy7chao --replicas 3

# now this list the same service we created before, but using 3 replicas
# docker service ls 

# the below command will remove one of the containers ( change the id based on real container ids to test it )
# docker container rm -f 1c333d5b287e
# however, docker swarm will start a new container as we defined we want 3 replicas for our just created service. This is the job of an orchestrator

# log sample 

# docker service ps silly_swirles
# ID                  NAME                  IMAGE               NODE                DESIRED STATE       CURRENT STATE            ERROR                         PORTS
# ejkjjbn4633h        silly_swirles.1       alpine:latest       vtavares            Running             Running 11 minutes ago                                 
# wv7df6fr23dk        silly_swirles.2       alpine:latest       vtavares            Running             Running 8 minutes ago                                  
# satlkwcuf2fa        silly_swirles.3       alpine:latest       vtavares            Running             Running 2 minutes ago                                  
# shwyta9zeye5         \_ silly_swirles.3   alpine:latest       vtavares            Shutdown            Failed 3 minutes ago     "task: non-zero exit (137)"   

# kill the service
# docker service rm silly_swirles

# docker service ls                                           ±[●][main]
# ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
