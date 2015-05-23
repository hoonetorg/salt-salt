salt_master__pkg_salt-master:
  pkg:
    - name: salt-master
    - installed
{% set slsrequires =salt['pillar.get']('salt:master:slsrequires', False) %}
{% if slsrequires is defined and slsrequires %}
    - require:
{% for slsrequire in slsrequires %}
      - {{slsrequire}}
{% endfor %}
{% endif %}

salt_master__pkg_salt-minion:
  pkg:
    - name: salt-minion
    - installed
    - require:
      - pkg: salt_master__pkg_salt-master

salt_master__pkg_gnutls-utils:
  pkg:
    - name: gnutls-utils
    - installed
    - require:
      - pkg: salt_master__pkg_salt-master
