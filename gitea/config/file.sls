# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import gitea with context %}

include:
  - {{ sls_package_install }}

gitea_config_file:
  file.managed:
    - name: {{ gitea.config_path }}
    - user: {{ gitea.config_owner }}
    - group: {{ gitea.config_group }}
    - mode: {{ gitea.config_mode }}
    - require:
      - sls: {{ sls_package_install }}
