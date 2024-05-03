module "rds" {
  source = "../module"
  count = var.db_instance_count
  identifier = var.identifier                            ###  identifier = "${var.identifier}-${count.index + 1}
  subnet_ids_for_subnet_group = var.subnet_ids_for_subnet_group
#  read_replica_identifier = var.read_replica_identifier  ###  read_replica_identifier = "${var.read_replica_identifier}-${count.index + 1}
  allocated_storage = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
#  read_replica_max_allocated_storage = var.read_replica_max_allocated_storage
  storage_type = var.storage_type[0]
#  read_replica_storage_type = var.read_replica_storage_type
  engine = var.engine[0]             ### var.engine[3]  use for postgresql
  engine_version = var.engine_version[0]       ### var.engine_version[11]  use for postgresql
  instance_class = var.instance_class[0]
#  read_replica_instance_class = var.read_replica_instance_class
  rds_db_name = var.rds_db_name
  username = var.username
  password = var.password
  parameter_group_name = var.parameter_group_name[0]
  multi_az = var.multi_az[0]
#  read_replica_multi_az = var.read_replica_multi_az
#  final_snapshot_identifier = var.final_snapshot_identifier
  skip_final_snapshot = var.skip_final_snapshot[0]
#  copy_tags_to_snapshot = var.copy_tags_to_snapshot
  availability_zone = var.availability_zone[0]  ### It should not be enabled for Multi-AZ option, If it is not enabled for Single DB Instance then it's value will be taken randomly.
  publicly_accessible = var.publicly_accessible[1]
  vpc_security_group_ids = var.vpc_security_group_ids
#  read_replica_vpc_security_group_ids = var.read_replica_vpc_security_group_ids
#  backup_retention_period = var.backup_retention_period
  kms_key_id = var.kms_key_id
#  read_replica_kms_key_id = var.read_replica_kms_key_id
  monitoring_role_arn = var.monitoring_role_arn
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  env = var.env[0]
}
