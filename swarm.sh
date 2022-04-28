GHCR_PAT=$GHCR_PAT
GHCR_USERNAME=$GHCR_USERNAME
PROJ_NAME=$PROJ_NAME

echo $GHCR_PAT
echo $GHCR_USERNAME
echo $PROJ_NAME
cd /opt/swarm_project 
echo ${GHCR_PAT} | /usr/bin/docker login ghcr.io -u ${GHCR_USERNAME} --password-stdin
/usr/bin/docker stack deploy --compose-file=/opt/swarm_project/docker-compose.yml ${PROJ_NAME}
/usr/bin/docker service scale ${secrets.PROJ_NAME}=3