#!/bin/bash
cur=$(cd `dirname $0`;pwd)
symas_openldap_home=/opt/symas
symas_openldap_conf=/opt/symas/etc/openldap
symas_openldap_db_path=/var/symas/openldap-data
slapadd=${symas_openldap_home}/sbin/slapadd

systemctl stop slapd
mkdir -p $symas_openldap_conf/slapd.d
rm -rf $symas_openldap_conf/slapd.d/*
echo $slapadd
$slapadd -n 0 -F $symas_openldap_conf/slapd.d -l ~/symas-openldap/ldif/slapd.ldif

echo "clean db"

systemctl stop slapd
# mkdir -p $symas_openldap_db_path
# \rm -rf $symas_openldap_db_path/*
echo "end"