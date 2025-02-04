-- MySQL script to create a user and grant replication permissions on web servers

-- Create the user if it does not exist  
-- The user should be identified with password projectcorrection280hbtn  
CREATE USER IF NOT EXISTS 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';

-- Grant holberton_user permission to check primary/replica status  
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';  
FLUSH PRIVILEGES;
