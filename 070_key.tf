resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

output "generated_ssh_key" {
  value     = tls_private_key.ssh
  sensitive = true
}

resource "local_file" "key_private" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = "id_rsa"
  file_permission = "0600"
}

resource "local_file" "key_public" {
  content         = tls_private_key.ssh.public_key_openssh
  filename        = "id_rsa.pub"
  file_permission = "0666"
}

resource "ibm_is_ssh_key" "generated_key" {
  name           = "basic-deleteme"
  public_key     = tls_private_key.ssh.public_key_openssh
  resource_group = data.ibm_resource_group.group.id
}
