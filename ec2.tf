resource "aws_instance" "web_1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras enable nginx1
              sudo yum install -y nginx

              echo '<html>
              <head><title>Home</title></head>
              <body>
              <h1>Hello Bala, your Home page is ready</h1>
              </body>
              </html>' 
              sudo systemctl restart nginx
              sudo systemctl enable nginx
EOF

  tags = { Name = "WebServer-Home" }
}

resource "aws_instance" "web_2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_2.id
  security_groups = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras enable nginx1
              sudo yum install -y nginx
              
              sudo mkdir -p /usr/share/nginx/html/images

              echo '<html>
              <head><title>Images</title></head>
              <body>
              <h1>Hello Bala, your Images page is ready</h1>
              </body>
              </html>'

      

              sudo systemctl restart nginx
              sudo systemctl enable nginx
EOF

  tags = { Name = "WebServer-Images" }
}

resource "aws_instance" "web_3" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_3.id
  security_groups = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras enable nginx1
              sudo yum install -y nginx
              
              sudo mkdir -p /usr/share/nginx/html/register

              echo '<html>
              <head><title>Register</title></head>
              <body>
              <h1>Hello Bala, your Register page is ready</h1>
              </body>
              </html>'


              sudo systemctl restart nginx
              sudo systemctl enable nginx
EOF

  tags = { Name = "WebServer-Register" }
}
