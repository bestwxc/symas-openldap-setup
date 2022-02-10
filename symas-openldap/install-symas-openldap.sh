#!/bin/bash
cur=$(cd `dirname $0`;pwd)
source $cur/common.sh
yum remove openldap-servers openldap-clients phpldapadmin
rpm -ivh $cur/packages/symas-openssl-libs-*.rpm
rpm -ivh $cur/packages/symas-libargon2-libs-*.rpm
rpm -ivh $cur/packages/symas-libevent-libs-*.rpm
rpm -ivh $cur/packages/symas-heimdal-libs-*.rpm
rpm -ivh $cur/packages/symas-cyrus-sasl-libs*.rpm
rpm -ivh $cur/packages/symas-openldap-libs-*.rpm
rpm -ivh $cur/packages/symas-openldap-clients-*.rpm
rpm -ivh $cur/packages/symas-openldap-servers-*.rpm
rpm -ivh $cur/packages/phpldapadmin-*.rpm


