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

####################################################################

## your terminal session
## Insert some data see and monitor on-going change ## 
python3 4.insert_data.py # cancle after 30s
###############################


## EC2 session
ssh ubuntu@34.235.158.190
sudo su
watch -n 1 "mysql -e 'select * from sales.state ORDER BY state_id DESC LIMIT 20'"


## RDS session
ssh ubuntu@34.235.158.190
watch -n 1 "mysql -v -uadmin -pAwesomePassword! -h database-1.cpkuikpztlyg.us-east-1.rds.amazonaws.com -e 'select * from sales.state ORDER BY state_id DESC LIMIT 20'"