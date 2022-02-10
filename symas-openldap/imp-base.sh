#!/bin/bash
cur=$(cd `dirname $0`;pwd)
symas_openldap_home=/opt/symas
symas_openldap_conf=/opt/symas/etc/openldap
symas_openldap_db_path=/var/symas/openldap-data
slapadd=${symas_openldap_home}/sbin/slapadd

${symas_openldap_home}/bin/ldapadd -x -D cn=suser,ou=SysUserGroup,dc=dgzq,dc=com,dc=cn -W -f ~/symas-openldap/ldif/base.ldif
