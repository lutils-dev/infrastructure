output "instance_id" {
  value = aws_instance.api.id
}

output "public_ip" {
  value = aws_instance.api.public_ip
}

output "codedeploy_app_name" {
  value = aws_codedeploy_app.api.name
}

output "codedeploy_deployment_group_name" {
  value = aws_codedeploy_deployment_group.api.deployment_group_name
}
