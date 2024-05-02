output "alb_dns_name" {
  value = aws_lb.test-application-loadbalancer.dns_name
}
output "alb_arn" {
  value = aws_lb.test-application-loadbalancer.arn
}
output "targetgroup_arn" {
  value = aws_lb_target_group.target_group.arn 
}
