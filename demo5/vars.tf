  
variable "AWS_REGION" {
  default = "us-west-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0d204b1f624e3b51d"
    us-west-2 = "ami-0dd273d94ed0540c0"
    us-west-1 = "ami-0daf1443f6adffe0d"
  }
}
