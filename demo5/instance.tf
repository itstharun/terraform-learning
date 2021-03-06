resource "aws_instance" "tkexample" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  subnet_id = aws_subnet.tk-public-1.id

  #security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  #the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
}
