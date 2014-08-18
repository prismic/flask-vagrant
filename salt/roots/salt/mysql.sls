mysql-server:
  pkg.installed:
    - names:
      - mysql-server
      - python-mysqldb

/etc/mysql/my.cnf:
  file.replace:
    - pattern: 'bind-address\s*\=\s*127.0.0.1'
    - repl: 'bind-address = 0.0.0.0'
    - backup: False
    - require:
      - pkg: mysql-server

mysql:
  service:
    - running
  require:
    - pkg: mysql-server
    - file: /etc/mysql/my.cnf

database-setup:
  mysql_user.present:
    - host: '%'
    - name: {{ pillar['mysql']['username'] }}
    - password: {{ pillar['mysql']['password'] }}
    - require:
      - pkg: python-mysqldb
      - service: mysql

  mysql_database.present:
    - name: {{ pillar['mysql']['dbname'] }}
    - require:
      - mysql_user: database-setup

  mysql_grants.present:
    - grant: ALL
    - database: {{ pillar['mysql']['dbname'] }}.*
    - user: {{ pillar['mysql']['username'] }}
    - host: '%'
    - require:
      - mysql_database: database-setup
