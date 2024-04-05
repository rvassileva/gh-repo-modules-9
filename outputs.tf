output "instance_id_dev" {
  description = "Id of the Dev EC2 instances."
  value       = aws_instance.web_server_dev.id
}

output "instance_id_stg" {
  description = "Id of the STG EC2 instances."
  value       = aws_instance.web_server_stg.id
}