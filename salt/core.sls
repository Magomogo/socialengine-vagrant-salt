corepkgs:
  pkg.installed:
    - pkgs:
      - php5
      - mysql-server
      - postfix
      - curl
      - vim

apache2:
  pkg:
    - installed
    - pkgs:
      - apache2
      - libapache2-mod-php5
  service:
    - running
    - enable: True

php:
  pkg.installed:
    - pkgs:
      - php5-gd
      - php5-curl
      - php5-apcu
      - php5-json
      - php5-mysql
    - require:
      - pkg: corepkgs
