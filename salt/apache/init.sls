/etc/apache2/sites-available/socialengine.conf:
  file.managed:
    - source: salt://apache/vhost.conf
    - template: jinja
    - mode: 644
    - require:
      - pkg: apache2
    - watch_in:
      - service: apache2

/etc/apache2/sites-enabled/socialengine.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/socialengine.conf
    - require:
      - file: /etc/apache2/sites-available/socialengine.conf
    - watch_in:
      - service: apache2

/etc/apache2/sites-enabled/000-default.conf:
  file.absent:
    - watch_in:
      - service: apache2

{% for mod in "php5","rewrite" %}
apache2_{{ mod }}:
  cmd.run:
    - name: a2enmod {{ mod }} ; echo -e "\nChanged=yes\n"
    - stateful: True
    - unless: a2enmod -q {{ mod }}
    - require:
      - pkg: apache2
    - require_in:
      - service: apache2
{% endfor %}
