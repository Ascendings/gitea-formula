{% from "gitea/map.jinja" import gitea_settings as settings with context -%}

gitea_package:
  pkg.installed:
    - name: {{ settings.package_name }}

gitea_conf:
  file.managed:
    - name: {{ settings.conf_file }}
    - template: jinja
    - source: salt://gitea/files/app.ini
    - user: {{ settings.conf_user }}
    - group: {{ settings.conf_group }}
    - mode: {{ settings.conf_mode }}
    - require:
      - pkg: gitea_package

gitea_server:
  service.running:
    - name: {{ settings.service_name }}
    - enable: {{ settings.service_enable }}
    - reload: false
    - watch:
      - pkg: gitea_package
      - file: gitea_conf
