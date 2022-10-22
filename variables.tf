
variable "name" {
  description = "Nome da instância"
  type        = string
  default     = ""
}

variable "region" {
  description = "Em qual zona sua instância irá ficar"
  type        = string
  default     = ""
}

variable "storage_sizes" {
  description = "Tamanho das configurações de maquina"
  type        = string
  default     = ""
}

variable "image" {
  description = "softwarer"
  type        = string
  default     = "ubuntu-22-04-x64"
}

variable "token" {
  description = "token"
  type        = string
  default     = ""
}

variable "ssh_key" {
  description = "ssh_key"
  type        = string
  default     = ""
}


variable "droplet" {
  type    = list(any)
  default = ["k8s", "autanbr", "jenkins"]
}

output "jenkins_ip" {
  value = digitalocean_droplet.jenkins.ipv4_address
}

resource "local_file" "foo" {
    content  = digitalocean_kubernetes_cluster.k8s.kube_config.0.raw_config
    filename = "kube_config.yaml"
}