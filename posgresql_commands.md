# Postgresql Commands


* To connect to postgresql database

      psql -U your_username -d your_database -h your_host -p your_port

* To list out all the available databases

      \l
  
* To use a database from the list

      \c database_name

* To Backup original database

      pg_dump -U username -d original_database > original_database_backup.sql

* To Create a copy of database

      createdb -U username -T original_database new_database_name

* To Verify the copy

      psql -U username -d postgres -c "\l"
