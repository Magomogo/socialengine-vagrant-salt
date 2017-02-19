/var/www/socialengine:
  archive.extracted:
    - source: salt://socialengine/socialengine4813_trial.zip
    - user: {{ pillar.user }}
    - group: {{ pillar.group_www }}
    - enforce_toplevel: false
    - require:
      - pkg: apache2

/var/www/socialengine/install/config:
  file.directory:
    - mode: 777
    - makedirs: false
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/temporary:
  file.directory:
    - mode: 777
    - makedirs: false
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/public:
  file.directory:
    - mode: 777
    - makedirs: false
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/application/themes:
  file.directory:
    - mode: 777
    - makedirs: false
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/application/packages:
  file.directory:
    - mode: 777
    - makedirs: false
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/application/languages:
  file.directory:
    - mode: 777
    - makedirs: false
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/application/settings:
  file.directory:
    - mode: 777
    - makedirs: false
    - require:
      - archive: /var/www/socialengine
