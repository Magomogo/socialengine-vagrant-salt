/etc/apache2/sites-available/socialengine.conf:
  file.managed:
    - source: salt://apache/vhost.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - service: apache2

/etc/apache2/sites-enabled/socialengine.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/socialengine.conf
    - require:
      - pkg: apache2
    - require_in:
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
