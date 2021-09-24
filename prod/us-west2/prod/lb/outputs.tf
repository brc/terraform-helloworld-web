output "lb_address" {
  value       = "https://${module.lb.address}"
  description = "IPv4 address of load balancer"
}
