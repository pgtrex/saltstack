mysql:
  server:
    root_password: 'somepass'
    bind-address: 127.0.0.1
    port: 3306
    user: mysql

  # Manage databases
  database:
    - foo
    - bar
  schema:
    foo:
      load: False
    bar:
      load: False

  # Manage users
  user:
    - name: frank
      password: 'somepass'
      host: localhost
      databases:
        - database: foo
          grants: ['select', 'insert', 'update']
        - database: bar
          grants: ['all privileges']
    - name: bob
      password_hash: '*6C8989366EAF75BB670AD8EA7A7FC1176A95CEF4'
      host: localhost
      databases:
        - database: foo
          grants: ['all privileges']
        - database: bar
          grants: ['select', 'insert', 'update', 'delete']
    - name: nopassuser
      password: ~
      host: localhost
      databases: []

  # Override any names defined in map.jinja
  lookup:
    server: mysql-server
    client: mysql-client
#    service: mysql-service
    config: /etc/mysql/my.cnf
    python: python-mysqldb
