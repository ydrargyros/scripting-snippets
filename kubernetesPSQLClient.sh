kubectl run postgres-client --rm --tty -i --restart='Never' --namespace default --image docker.io/bitnami/postgresql:11.11.0-debian-10-r24 --env="PGPASSWORD=H@Sh1CoR3!" --command -- psql --host 10.241.69.4 -U psqladmin -d postgres -p 5432

# Create a container of the postgresql client, with an environmental variable for the postgresql's instance admin password
kubectl run postgres-client --rm --tty -i --restart='Never' --namespace default --image docker.io/bitnami/postgresql:11.11.0-debian-10-r24 --env="PGPASSWORD=H@Sh1CoR3!" -- bash

# Copy the local dump to the postgresql client container, under /tmp
kubectl cp /mnt/c/repos/irm_db_tests-202403131216.sql default/postgres-client:/tmp/irm_db_tests-202403131216.sql

# From inside the container itself, connect to the database server and import (<) the dump file
psql --host 10.241.69.4 -U psqladmin -d postgres -p 5432 < irm_db_tests-202403131216.sql