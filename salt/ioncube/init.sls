/usr/lib/php5/20131226/ioncube_loader_lin_5.6.so:
  file.managed:
    - source: salt://ioncube/ioncube_loader_lin_5.6.so
    - watch_in:
      - service: apache2

/etc/php5/apache2/conf.d/00-ioncube.ini:
  file.managed:
    - source: salt://ioncube/ioncube.ini
    - watch_in:
      - service: apache2
