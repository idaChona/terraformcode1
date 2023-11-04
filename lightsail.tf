resource "aws_lightsail_instance" "web_server" {
  name                  = "my-lightsail-server"
  availability_zone     = "us-east-1a" # Change to your desired availability zone
  instance_type         = "nano_2_0"
  blueprint_id          = "amazon_linux_2"

  user_data = <<-EOF
#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>This Server is created using Terraform</h1>" | sudo tee /var/www/html/index.html
EOF
}

output "public_ip" {
  value = aws_lightsail_instance.web_server.public_ip_address
}
