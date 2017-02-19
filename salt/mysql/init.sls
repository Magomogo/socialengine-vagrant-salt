socialengine:
  mysql_database.present:
    - require:
      - pkg: corepkgs

root:
  mysql_user.present:
    - host: localhost
    - password: root
    - require:
      - pkg: corepkgs
      - mysql_database: socialengine
