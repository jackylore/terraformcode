resource "aws_lightsail_instance" "example_instance" {
  name              = "example-instance"
  availability_zone = "us-east-1a" # Specify your desired availability zone
  blueprint_id      = "amazon_linux_2" # You can choose a different blueprint if needed
  bundle_id         = "nano_2_0" # You can choose a different instance size if needed
  key_pair_name     = "your-key-pair" # Specify your SSH key pair name

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>This Server is created using Terraform </h1>" | sudo tee /var/www/html/index.html
              EOF
}

output "public_ip" {
  value = aws_lightsail_instance.example.public_ip_address
}
