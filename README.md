
# Create Docker Image for Datiku and Posix Client (Data Fabric 6.2)

# Generate ticket
maprlogin generateticket -type service -cluster my.cluster.com -duration 120:0:0 -out /tmp/mapr_ticket -user mapr

# copy ticket /tmp/mapr_ticket to /user/tickets/mapr_ticket  on container host


# Build image for Ubuntu
docker build -t dataikuMapr ./ubuntu


# Make sure the image is created and no issue building Docker image.
docker images -a

# Run Dataiku container with Non-Secure Cluster and FUSE-Based POSIX Client
docker run -it --rm --device /dev/fuse --cap-add SYS_ADMIN -p 11000:11000  dataikumapr:latest


# Run with Non-Secure Cluster and FUSE-Based POSIX Client
docker run -it --device /dev/fuse --cap-add SYS_ADMIN -e MAPR_TZ=UTC -e MAPR_CLUSTER=my.cluster.com -e MAPR_CLDB_HOSTS=10.0.142.58 -e MAPR_CONTAINER_USER=mapr -e MAPR_CONTAINER_GROUP=mapr -e MAPR_CONTAINER_UID=5000 -e MAPR_CONTAINER_GID=5000 -e MAPR_MOUNT_PATH=/mapr -p 11000:11000 dataikumapr:latest



