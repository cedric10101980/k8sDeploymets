FROM neo4j:5.1.0

COPY conf/apoc.conf /var/lib/neo4j/conf/
COPY db_init_scripts/create_schema_object.cypher /var/lib/neo4j/db_init_scripts/
COPY plugins/apoc-5.1.0-core.jar /var/lib/neo4j/plugins/
COPY plugins/apoc-5.1.0-extended.jar /var/lib/neo4j/plugins/
COPY db_init_scripts/seed.cypher /var/lib/neo4j/db_init_scripts/
