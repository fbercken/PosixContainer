#!/bin/bash

# Configure Mapr cluster access
groupadd -g $MAPR_CONTAINER_GID $MAPR_CONTAINER_GROUP && useradd -u $MAPR_CONTAINER_UID -g $MAPR_CONTAINER_GID $MAPR_CONTAINER_USER
/opt/mapr/server/configure.sh -N $MAPR_CLUSTER -c -C $MAPR_CLDB_HOSTS -u $MAPR_CONTAINER_USER -U $MAPR_CONTAINER_UID -g $MAPR_CONTAINER_GROUP -G $MAPR_CONTAINER_GID 

# Start Posix client
service mapr-posix-client-basic start

runuser -l  dataiku /home/dataiku/data/bin/dss start &