#!/bin/bash
cur=$(cd `dirname $0`;pwd)
source $cur/common.sh
yum remove -y openldap-servers openldap-clients phpldapadmin symas-openssl-libs symas-libargon2-libs symas-libevent-libs symas-heimdal-libs symas-cyrus-sasl-libs symas-openldap-libs symas-openldap-clients symas-openldap-servers

