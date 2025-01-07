output "deployment_info" {
  description = "Deployment information for the API server"
  value = {
    environment = module.variables.environment
    component   = "api"
    instance_id = module.api.instance_id
    public_ip   = module.api.public_ip
    codedeploy_app_name = module.api.codedeploy_app_name
    codedeploy_deployment_group_name = module.api.codedeploy_deployment_group_name
  }
}

resource "local_file" "deployment_info" {
  content  = jsonencode({
    environment = module.variables.environment
    component   = "api"
    instance_id = module.api.instance_id
    public_ip   = module.api.public_ip
    codedeploy_app_name = module.api.codedeploy_app_name
    codedeploy_deployment_group_name = module.api.codedeploy_deployment_group_name
  })
  filename = "${path.module}/../${module.variables.environment}/deployment-info.json"
}