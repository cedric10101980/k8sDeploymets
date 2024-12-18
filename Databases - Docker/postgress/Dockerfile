FROM postgres:14.1-alpine

# On Windows root will own the files, and they will have permissions 755
COPY postgres-certs/server.key /var/lib/postgresql/server.key
COPY postgres-certs/server.crt /var/lib/postgresql/server.crt

# update the privileges on the .key, no need to touch the .crt  
RUN chmod 600 /var/lib/postgresql/server.key
RUN chown postgres:postgres /var/lib/postgresql/server.key