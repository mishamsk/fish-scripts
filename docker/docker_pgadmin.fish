function docker_pgadmin
    docker run -p 3380:80 \
        -e 'PGADMIN_DEFAULT_EMAIL=admin@localhost.com' \
        -e 'PGADMIN_DEFAULT_PASSWORD=admin' \
        -d --name pgadmin dpage/pgadmin4
end
