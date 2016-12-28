{%- set major_version = salt['pillar.get']('elasticsearch:major_version', 2) %}

include:
  - elasticsearch.repo

{% from "elasticsearch/map.jinja" import elasticsearch with context %}

elasticsearch_pkg:
  pkg.installed:
    - name: {{ elasticsearch.pkg }}
    - version: {{ salt.pillar.get('elasticsearch:version', major_version ~ ".*") }}
    - hold: {{ salt.pillar.get('elasticsearch:version_hold', False) }}
    - require:
      - sls: elasticsearch.repo
