# Centos 9 using dnf
dnf update -y

dnf install epel-release -y; dnf install wget curl btop htop nano -y;

cat >/etc/yum.repos.d/elasticsearch.repo <<EOL
[elasticsearch]
name=Elasticsearch repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=0
autorefresh=1
type=rpm-md
EOL

dnf install --enablerepo=elasticsearch elasticsearch -y;