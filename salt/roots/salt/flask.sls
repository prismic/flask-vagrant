flask-requirements:
  pip.installed:
    - requirements: {{ pillar['flask']['requirements'] }}
    - user: root
    - no_chown: True
    - require:
      - pkg: libmysqlclient-dev
      - pkg: python-dev


