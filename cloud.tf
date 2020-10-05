terraform {
  backend "remote" {
    organization = "th3lolipop"

    workspaces {
      name = "aws-infrastructure"
    }
  }
}
