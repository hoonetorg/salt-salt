salt_minion__pkg_salt-minion:
  pkg:
    - name: salt-minion
    - installed
{% set slsrequires =salt['pillar.get']('salt:minion:slsrequires', False) %}
{% if slsrequires is defined and slsrequires %}
    - require:
{% for slsrequire in slsrequires %}
      - {{slsrequire}}
{% endfor %}
{% endif %}
