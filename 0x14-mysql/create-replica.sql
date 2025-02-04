-- MySQL script to create a replication user and grant necessary permissions

-- Create the user if it does not exist  
-- The user should be identified with password projectcorrection280hbtn  
CREATE USER IF NOT EXISTS 'replica_user'@'%' IDENTIFIED BY 'projectcorrection280hbtn';

-- Grant replication privileges to replica_user  
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';

-- Grant select privileges on mysql.user table to holberton_user  
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';

FLUSH PRIVILEGES;
