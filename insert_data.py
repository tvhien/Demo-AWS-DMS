import mysql.connector

# with open('../script/1_sales.state.copy.sql') as f:
with open('./script/1_sales.state.sql') as f:
    lines = f.readlines()

#establishing the connection
conn = mysql.connector.connect(
   user='myuser', password='AwesomePassword!', host='34.235.158.190', database='sales')

#Creating a cursor object using the cursor() method
cursor = conn.cursor()

for line in lines:
   print(line)
   
   # Preparing SQL query to INSERT a record into the database.
   sql = line
   try:
      # Executing the SQL command
      cursor.execute(sql)

      # Commit your changes in the database
      conn.commit()

   except:
      # Rolling back in case of error
      conn.rollback()
      raise TypeError("Fail to Executing the SQL command")

# Closing the connection
conn.close()
