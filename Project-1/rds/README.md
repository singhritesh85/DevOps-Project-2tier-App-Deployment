# Terraform Script to Launch RDS DB Instance

**To launch PostgreSQL DB Instance.**

Select the identifier as dbinstance-1, rds_db_name as mydb, engine as postgres, engine_version as 14.9, username as postgres, password as Sonar123, parameter_group_name as default.postgres14 and change the value enabled_cloudwatch_logs_exports to ["postgresql", "upgrade"].

```
identifier = "dbinstance-1"
rds_db_name = "mydb"
engine = "postgres"
engine_version = "14.9"
username = "postgres"
password = "Sonar123"
parameter_group_name = "default.postgres14"



enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]  in file rds/module/rds.tf
```  
<br><br/>
Select the identifier as dbinstance-2, rds_db_name as demodb, engine as mysql, engine_version as 5.7.44, username as admin, password as Admin123, parameter_group_name as default.mysql5.7 and change the value enabled_cloudwatch_logs_exports to ["audit", "error", "general", "slowquery"].

```
identifier = "dbinstance-2"
rds_db_name = "demodb"
engine = "mysql"
engine_version = "5.7.44"
username = "admin"
password = "Admin123"
parameter_group_name = "default.mysql5.7"  



enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]  in file rds/module/rds.tf  
```
<br><br/>
**Change the key in backend.tf while creating different RDS.**
