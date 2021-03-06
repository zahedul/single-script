#!/bin/sh

# Install celery and rabbitmq

# Add and enable relevant application repositories:
# Note: We are also enabling third party remi package repositories.
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

# Finally, download and install Erlang:
yum install -y erlang

# Download the latest RabbitMQ package using wget:
wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.2.2/rabbitmq-server-3.2.2-1.noarch.rpm

# Add the necessary keys for verification:
rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc

# Install the .RPM package using YUM:
yum install -y rabbitmq-server-3.2.2-1.noarch.rpm

#To enable RabbitMQ Management
rabbitmq-plugins enable rabbitmq_management

#To have RabbitMQ start as a daemon by default
chkconfig rabbitmq-server on

# To start the service:
service rabbitmq-server start

#remove what we download
rm remi-release-6*.rpm epel-release-6*.rpm rabbitmq-server-3.2.2-1.noarch.rpm

#cp /opt/python/current/app/scripts/django_celeryd.config /etc/default/celeryd
#cp /opt/python/current/app/scripts/celeryd_init_script.sh /etc/init.d/celeryd

#chmod 644 /etc/default/celeryd
#chmod 755 /etc/init.d/celeryd

#/etc/init.d/celeryd start
