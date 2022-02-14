## pre-install ####################################################
## SSH to EC2 host
ssh ubuntu@34.235.158.190
## Ubuntu MySQL:##########################
sudo apt update
sudo apt install mysql-server

sudo su
mysql
################ create user admin #######
SELECT User, Host, plugin FROM mysql.user;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'AwesomePassword!';

# Create user
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'AwesomePassword!';
CREATE USER 'myuser'@'%' IDENTIFIED BY 'AwesomePassword!';
GRANT ALL ON *.* TO 'myuser'@'localhost';
GRANT ALL ON *.* TO 'myuser'@'%';
flush privileges;
##########################################
exit

# Enable remote access database
sudo sed -i "s/bind-address.*127.0.0.1/bind-address            =  0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf
# sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf #(verify: bind-address =  0.0.0.0)
# enable log_bin                 = /var/log/mysql/mysql-bin.log in /etc/mysql/mysql.conf.d/mysqld.cnf 
sudo apt install net-tools -y
sudo systemctl restart mysql
netstat -tuanp #verify (0.0.0.0:3306)

# mysql -v -u myuser -pAwesomePassword! -e "show databases"

# Create DB:
CREATE DATABASE sales;
# expected results:
#  state_id |         name         
# ----------+----------------------
#         1 | New York
#         2 | Virginia
#         3 | Missouri
#         4 | New York
#         5 | Kansas
#         6 | Massachusetts
#         7 | Tennessee
use sales;
create table state(
   state_id INT NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL,
   PRIMARY KEY ( state_id )
);

####################################################################
## Insert some data to sales database to test full load data
python3 insert_data.py # cancle after 30s

###############################
