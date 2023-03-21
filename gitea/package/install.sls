# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import gitea with context %}
gitea_pkg_install:
  pkg.installed:
    - name: {{ gitea.pkg_name }}
  group.present:
    - name: {{ gitea.config_group }}
    - system: True
  user.present:
    - name: {{ gitea.config_owner }}
    - gid: {{ gitea.config_group }}
    - system: True
