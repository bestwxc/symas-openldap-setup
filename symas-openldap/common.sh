#!/bin/bash
symas_openldap_home=/opt/symas
symas_openldap_conf=/opt/symas/etc/openldap
symas_openldap_db_path=/var/symas/openldap-data
slapadd=$$symas_openldap_home}/sbin/slapadd


mkdir -p $symas_openldap_db_path
rm -rf ${symas_openldap_db_path}/*


#!/bin/bash
mkdir -p /var/lib/ldap
rm -rf /var/lib/ldap/*
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
chown -R ldap:ldap /var/lib/ldap/DB_CONFIG