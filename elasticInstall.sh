# Centos 9 using dnf
dnf update -y

dnf install epel-release -y; dnf install wget curl btop htop nano tmux -y;

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

chown -R elasticsearch:elasticsearch /data/

dnf install --enablerepo=elasticsearch elasticsearch -y;

# After these, elasticsearch is installed on the first node
# Edit the following variables in /etc/elasticsearch/elasticsearch.yml
cluster.name: solotax-horizon
node.name: solontax-horizon01
path.data: /data






## Remove Everything
#Remove elasticsearch installation
dnf remove --enablerepo=elasticsearch elasticsearch -y;
#Remove elasticsearch directories and data
rm -rf /var/lib/elasticsearch/ /data/* /usr/share/elasticsearch/ /etc/elasticsearch/

#Remove Kibana
dnf remove --enablerepo=elasticsearch kibana -y;
#Remove Kibana directories
rm -rf /var/lib/kibana /usr/share/kibana /etc/kibana





rm -rf /opt/Elastic/Agent/ /etc/systemd/system/elastic-agent.service
rpm -qa | grep agent
rpm -e rpm -e elastic-agent-8.13.2-1.x86_64


