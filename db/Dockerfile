FROM postgres:15

# Environmental variables
ENV POSTGRES_DB=personal_library
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin123

# We copied all the SQL scripts (they are automatically executed in order)
COPY *.sql /docker-entrypoint-initdb.d/