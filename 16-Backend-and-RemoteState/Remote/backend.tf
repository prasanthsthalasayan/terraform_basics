terraform { 
  backend "s3" { 
   bucket = "terraform-demo-av-16july2021"
   key = "mterraform01/terraform.tfstate"
   region = "us-east-1"
 }
}
