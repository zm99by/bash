# bash

# nc: Netcat
nc -zvw3 10.128.0.12 5432


- systemctl daemon-reload
- systemctl enable mysqld_exporter
```
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
ExecStart=/opt/prometheus/prometheus \
    --config.file=/opt/prometheus/prometheus.yml \
    --storage.tsdb.path=/opt/prometheus/data \
    --web.console.templates=/opt/prometheus/consoles \
    --web.console.libraries=/opt/prometheus/console_libraries

[Install]
WantedBy=default.target
```
-----------------------------------

- sudo apt-get install mysql-server
```
CREATE USER 'user'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON * . * TO 'user'@'localhost';
```
https://github.com/prometheus/mysqld_exporter/releases/download/v0.13.0/mysqld_exporter-0.13.0.linux-amd64.tar.gz
```

export DATA_SOURCE_NAME='user:12345@(prometheus:9111)/'
./mysqld_exporter <flags>

```
/etc/systemd/system/mysqld_exporter.service
```
Unit]
Description=Mysql Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=mysqluser
Group=mysqluser
Type=simple
ExecStart=/opt/mysqld_exporter/mysqld_exporter \ 
    --web.listen-address=":9111" 

[Install]
WantedBy=multi-user.target

```
