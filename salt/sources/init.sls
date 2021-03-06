/var/www/socialengine:
  archive.extracted:
    - source: salt://sources/socialengine4813_trial.zip
    - user: {{ pillar.user }}
    - group: {{ pillar.group_www }}
    - enforce_toplevel: false
    - require:
      - pkg: apache2

/var/www/socialengine/install/config:
  file.directory:
    - mode: 777
    - makedirs: false
    - recurse:
      - mode
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/temporary:
  file.directory:
    - mode: 777
    - makedirs: false
    - recurse:
      - mode
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/public:
  file.directory:
    - mode: 777
    - makedirs: false
    - recurse:
      - mode
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/application/themes:
  file.directory:
    - mode: 777
    - makedirs: false
    - recurse:
      - mode
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/application/packages:
  file.directory:
    - mode: 777
    - makedirs: false
    - recurse:
      - mode
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/application/languages:
  file.directory:
    - mode: 777
    - makedirs: false
    - recurse:
      - mode
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/application/settings:
  file.directory:
    - mode: 777
    - makedirs: false
    - recurse:
      - mode
    - require:
      - archive: /var/www/socialengine

/var/www/socialengine/license.txt:
  file.managed:
    - user: {{ pillar.user }}
    - group: {{ pillar.group_www }}
    - contents_pillar: license
