# delete docker image by name oneliner
docker images --format "{{.Repository}}:{{.Tag}}" | grep 'ibm-semeru-runtimes' | xargs -I {} docker rmi {}