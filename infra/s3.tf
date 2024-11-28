resource "aws_s3_bucket" "barkeley-tfstate" {
    bucket = "rico-automata-tfstate"
    tags = {
        Name = "tfstate"
    }
}