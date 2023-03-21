# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config.file' %}
{%- from tplroot ~ "/map.jinja" import gitea with context %}

include:
  - {{ sls_config_file }}

gitea_service:
  service.running:
    - name: {{ gitea.service_name }}
    - enable: {{ gitea.service_enabled }}
    - watch:
      - sls: {{ sls_config_file }}
