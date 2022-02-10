# symas openldap 安装说明

# 一、说明
1. symas是openldap的主要贡献公司，提供商业服务，类似于spring和Pivotal的关系
2. 从redhat8开始，redhat官方库不再提供openldap的rpm包，可以中symas的库获取
3. 从2.3.X 版本开始，openldap 不再推荐使用slapd.conf，而是使用slapd.d的形式，通过slapadd等命令修改配置，openldap提供将slapd.conf转为slapd.d的工具
4. 从2.5.X 版本开始，openldap 不再推荐使用hdb，默认使用mdb
5. 按照文博的建议，使用最新版本，使用新的技术，即使用symas-openldap 2.6,通过slapd.d配置，数据存储层使用mdb

# 二、安装目录设置
1. 程序安装目录： /opt/symas
2. 配置文件目录： /opt/symas/etc/openldap
3. 数据文件存储目录, 在./ldif/slapd.ldif中调整： /var/symas/openldap-data
4. 审计日志目录（操作日志）, 在./ldif/slapd.ldif中调整：/tmp/auditlog.ldif

# 三、单机部署
1. 安装包准备，将symas-openldap上传至目标服务器的/root目录下,并进入(cd /opt/symas-openldap)
2. （可选）清理原openldap的安装：/opt/symas-openldap/uninstall-symas-openldap.sh
3. 安装symas-openldap-servers 及phpldapadmin，脚本 symas-openldap/install-symas-openldap.sh
4. 启动slapd systemctl
``` bash
# 启动服务
systemctl start slapd
# 查看服务状态
systemctl status slapd
# 停止服务
systemctl stop slapd
# 将服务设置为自启动
systemctl enable slapd
```
5. 导入基础分类 使用 symas-openldap/imp-base.sh 过程中需要输入密码（DgzqLdap@2022）

# 四、 配置phpldapadmin
1. 修改 /etc/httpd/conf/httpd.conf, 调整httpd的端口为合适的端口
2. 修改/etc/httpd/conf.d/phpldapadmin.conf，如下：
``` conf
Alias /phpldapadmin /usr/share/phpldapadmin/htdocs
Alias /ldapadmin /usr/share/phpldapadmin/htdocs

<Directory /usr/share/phpldapadmin/htdocs>
  <IfModule mod_authz_core.c>
    # Apache 2.4
    # Require local
	Require all granted
  </IfModule>
  <IfModule !mod_authz_core.c>
    # Apache 2.2
    Order Deny,Allow
    Deny from all
    Allow from 127.0.0.1
    Allow from ::1
  </IfModule>
</Directory>
```
3. 修改phpldapadmin配置文件 /etc/phpldapadmin/config.php
``` php
// 398行,配置登录用户名使用的属性，可以是dn,cn,uid等, 优先改为dn
$servers->setValue('login','attr','dn');

// 460行 控制是否允许使用匿名用户登录phpldapadmin,开发期间可放开，正式环境需要禁止，禁止则取消前面的注释
// $servers->setValue('login','anon_bind',true);

// 159行增加 控制phpldapadmin导航树的节点显示名称 部门显示部门名称
$config->custom->appearance['tree_display_format'] = array('%deptName','%sn','%o','%rdn');
```
4. 启动服务并设置自启动
``` bash
# 启动服务
systemctl start httpd
# 查看服务状态
systemctl status httpd
# 停止服务
systemctl stop httpd
# 将服务设置为自启动
systemctl enable httpd
```