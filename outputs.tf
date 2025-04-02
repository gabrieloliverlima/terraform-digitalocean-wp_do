
output "wp_lb_ip" {
  value = digitalocean_loadbalancer.wp_lb.ip
  description = "Ip Load Balancer"
}

output "vm_ip" {
  value = digitalocean_droplet.vm_wp[*].ipv4_address
  description = "Ip Load Balancer"
}

output "vm_nfs_ip" {
  value = digitalocean_droplet.vm_nfs.ipv4_address
  description = "Ip do NFS"
}

output "database_username" {
  value     = digitalocean_database_user.wp_database_user.name
  description = "User DataBase"
}

output "database_password" {
  value     = digitalocean_database_user.wp_database_user.password
  sensitive = true
}